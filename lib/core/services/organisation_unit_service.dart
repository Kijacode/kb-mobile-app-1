import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_unit_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class OrganisationUnitService {
  List<OrganisationUnit> organisationUnitList = [];
  List<OrganisationUnit> organisations = [];
  Future<dynamic> organisationUnitGetRequest() async {
    var url =
        "api/organisationUnits.json?fields=id,name,programs,parent[id],level,children[id]&paging=false";
    CurrentUser user = await UserService().getCurrentUser();
    HttpService http =
        HttpService(username: user.username, password: user.password);

    var response = await http.httpGet(url);

    //check status code
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      for (var organisation in responseData["organisationUnits"]) {
        organisationUnitList.add(OrganisationUnit.fromJson(organisation));
      }
      setOrganisationUnits(organisationUnitList);
    } else {
      return null;
    }
  }

  setOrganisationUnits(List<OrganisationUnit> organisationUnit) async {
    await OrganisationUnitOffline()
        .addOrUpdateOrganisationUnits(organisationUnit);
  }

  List<OrganisationUnit> getCompleteOrganizationUnitOfCurrentUser(
      List currentUserOrganisationId) {
    for (var organisationId in currentUserOrganisationId) {
      OrganisationUnitOffline()
          .getOrganisationUnitById(organisationId)
          .then((value) => {
                value.forEach((organisation) {
                  organisations.add(organisation);
                })
              });
    }
    print(organisations[0].name);
    return organisations;
  }
}
