import 'dart:convert';
import 'package:http/http.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_data_value.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_attribute_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class SynchronizationService {
  HttpService httpClient;
  final List programs;
  final List orgUnitIds;
  final String offlineSyncStatus = 'not-synced';
  final String onlineSyncStatus = 'synced';

  SynchronizationService(
      String username, String password, this.programs, this.orgUnitIds) {
    httpClient = HttpService(username: username, password: password);
  }

  Future<List<String>> getDataPaginationFilters(String url) async {
    List<String> paginationFilter = [];
    Response response = await httpClient.httpGetPagination("$url");
    Map<String, dynamic> pager = json.decode(response.body)['pager'];
    int pagetTotal = pager['total'];
    int pageSize = 500;
    int total = pagetTotal >= pageSize ? pagetTotal : pageSize;
    for (int page = 1; page <= (total / pageSize).round(); page++) {
      paginationFilter.add("totalPages=true&pageSize=$pageSize&page=$page");
    }
    return paginationFilter;
  }

  Future<List<Events>> getEventsfromServer(
      String program, String userOrgId) async {
    List<Events> eventsFromServer = [];
    try {
      List<String> pageFilters = await getDataPaginationFilters(
          "api/events.json?ouMode=DESCENDANTS&orgUnit=$userOrgId&program=$program");
      for (var pageFilter in pageFilters) {
        String newTrackedInstanceUrl =
            "api/events.json?ouMode=DESCENDANTS&orgUnit=$userOrgId&program=$program&fields=event,program,programStage,trackedEntityInstance,status,orgUnit,dataValues[dataElement,value,displayName],eventDate&$pageFilter";
        Response response = await httpClient.httpGet(newTrackedInstanceUrl);
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body);
          for (var event in responseData["events"]) {
            eventsFromServer.add(Events().fromJson(event));
            // await saveEventsToOffline(Events().fromJson(event));
          }
        } else {
          return null;
        }
      }
    } catch (e) {}
    return eventsFromServer;
  }

  Future saveEventsToOffline(Events event) async {
    EventOfflineProvider().addOrUpdateEvent(event);
  }

  Future<List> getOfflineEventsAttributesValuesById(String eventIds) async {
    List entityInstanceAttributes =
        await EventOfflineDataValueProvider().getEventDataValues(eventIds);
    return entityInstanceAttributes;
  }

  Future<List<dynamic>> getTrackedInstancefromServer(
      String program, String userOrgId) async {
    List trackedInstanceFromServer = [];
    List<String> pageFilters = await getDataPaginationFilters(
        "api/trackedEntityInstances.json?ouMode=DESCENDANTS&ou=$userOrgId&program=$program");
    for (var pageFilter in pageFilters) {
      String newTrackedInstanceUrl =
          "api/trackedEntityInstances.json?ouMode=DESCENDANTS&ou=$userOrgId&program=$program&fields=trackedEntityInstance,trackedEntityType,orgUnit,attributes[attribute,value, displayName],enrollments[enrollment,enrollmentDate,incidentDate,orgUnit,program,trackedEntityInstance,status]&$pageFilter";
      Response response = await httpClient.httpGet(newTrackedInstanceUrl);
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        for (var trackedEntityInstance
            in responseData["trackedEntityInstances"]) {
          trackedInstanceFromServer.add(trackedEntityInstance);
        }
      } else {
        return null;
      }
    }

    return trackedInstanceFromServer;
  }

  Future saveTrackeEntityInstanceToOffline(
      TrackeEntityInstance trackeEntityInstance) async {
    await TrackedEntityInstanceOfflineProvider()
        .addOrUpdateTrackedEntityInstance(trackeEntityInstance);
  }

//TrackedEntityInstanceOfflineAttributeProvider
  Future saveEnrollmentToOffline(dynamic enrollments) async {
    for (var enrollment in enrollments) {
      EnrollmentOfflineProvider()
          .addOrUpdateEnrollement(Enrollment().fromJson(enrollment));
    }
  }

  Future<List> getOfflineTrackedEntityAttributesValuesById(
      List<String> attributeIds) async {
    List entityInstanceAttributes =
        await TrackedEntityInstanceOfflineAttributeProvider()
            .getTrackedEntityAttributesValuesById(attributeIds);
    return entityInstanceAttributes;
  }

  Future<List<TrackeEntityInstance>> getTeisFromOfflineDb() async {
    return await TrackedEntityInstanceOfflineProvider()
        .getTrackedEntityInstanceByStatus(offlineSyncStatus);
  }

  Future<List<Enrollment>> getTeiEnrollmentFromOfflineDb() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentByStatus(offlineSyncStatus);
  }

  Future<List<TeiRelationship>> getTeiRelationShipFromOfflineDb() async {
    return await TeiRelatioShipOfflineProvider().getAllTeiRelationShips();
  }

  Future<List<Events>> getTeiEventsFromOfflineDb() async {
    return await EventOfflineProvider()
        .getTrackedEntityInstanceEventsByStatus(offlineSyncStatus);
  }

  Future uploadTeisToTheServer(
    List<TrackeEntityInstance> teis,
    List<Enrollment> teiEnrollments,
  ) async {
    List<String> syncedIds = [];
    String url = 'api/trackedEntityInstances?strategy=CREATE_AND_UPDATE';
    Map body = Map();
    var enrollments = teiEnrollments
        .map((enrollment) => enrollment.toOffline(enrollment))
        .toList();
    body['trackedEntityInstances'] = teis.map((tei) {
      var data = tei.toOffline(tei);
      String trackedEntityInstance = data['trackedEntityInstance'];
      data['attributes'] =
          data['attributes'].where((att) => att['value'] != 'null').toList();
      data['enrollments'] = enrollments
          .where((enrollment) =>
              enrollment['trackedEntityInstance'] == trackedEntityInstance)
          .toList();
      return data;
    }).toList();
    var response = await httpClient.httpPost(url, json.encode(body));
    try {
      syncedIds = _getReferenceids(json.decode(response.body));
    } catch (e) {}
    if (syncedIds.length > 0) {
      for (TrackeEntityInstance tei in teis) {
        if (syncedIds.indexOf(tei.trackedEntityInstance) > -1) {
          tei.syncStatus = 'synced';
          FormUtil.savingTrackeEntityInstance(tei);
        }
      }
      for (Enrollment teiEnrollment in teiEnrollments) {
        if (syncedIds.indexOf(teiEnrollment.trackedEntityInstance) > -1) {
          teiEnrollment.syncStatus = 'synced';
          FormUtil.savingEnrollment(teiEnrollment);
        }
      }
    }
  }

  Future uploadTeiEventsToTheServer(
    List<Events> teiEvents,
  ) async {
    List<String> syncedIds = [];
    String url = 'api/events?strategy=CREATE_AND_UPDATE';
    Map body = Map();
    body['events'] = teiEvents.map((event) {
      var data = event.toOffline(event);
      if (data['trackedEntityInstance'] == null ||
          data['trackedEntityInstance'] == '') {
        data.remove('trackedEntityInstance');
      }
      return data;
    }).toList();
    var response = await httpClient.httpPost(url, json.encode(body));
    try {
      syncedIds = _getReferenceids(json.decode(response.body));
    } catch (e) {}
    if (syncedIds.length > 0) {
      for (Events event in teiEvents) {
        if (syncedIds.indexOf(event.event) > -1) {
          event.syncStatus = 'synced';
          FormUtil.savingEvent(event);
        }
      }
    }
  }

  Future uploadTeiRelationToTheServer(
    List<TeiRelationship> teiRelationShips,
  ) async {
    print('teiRelationShips $teiRelationShips');
  }

  List<String> _getReferenceids(Map body) {
    List<String> referenceIds = [];
    var bodyResponse = body['response'];
    var importSummaries = bodyResponse['importSummaries'] ?? [];
    for (var importSummary in importSummaries) {
      if (importSummary['status'] == 'SUCCESS' &&
          importSummary['reference'] != null) {
        referenceIds.add(importSummary['reference']);
      } else {
        //@TODO add logs
        print(json.encode(importSummary));
      }
    }
    return referenceIds;
  }
}
