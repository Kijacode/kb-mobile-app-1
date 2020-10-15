import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class BeneficiaryIdentification {
  static final String beneficiaryId = 'cfPJpuMGp2O';
  static final String beneficiaryIndex = 'Uth5HQFgqlb';
  static final List<String> firstNameReference = ['WTZ7GLTrE8Q', 'JhOvli80Qbx'];
  static final List<String> surnameReference = ['rSP9c21JsfC', 'jjZWuJfVStp'];
  static final List<String> birthDate = ['qZP982qpSPS', 'jVSwC6Ln95H'];
  static final int maxNumberToReserve = 100;

  String getBenificiaryId(
    OrganisationUnit organisationUnit,
    Map dataObject,
    String beneficiaryIndex,
  ) {
    var enrollYear = getValueFromMap(dataObject, birthDate);
    String enrollFirstName = getValueFromMap(dataObject, firstNameReference);
    String enrollSurName = getValueFromMap(dataObject, surnameReference);
    DateTime date = AppUtil.getDateIntoDateTimeFormat(enrollYear);
    String yearBirth = '${date.year}'.substring(2, 4);
    String monthBirth = date.month < 10 ? '0${date.month}' : '${date.month}';
    String districtBirth = organisationUnit.code;
    String firstName = '$enrollFirstName'.toUpperCase().substring(0, 2);
    String surName = '$enrollSurName'.toUpperCase().substring(0, 2);
    return '$yearBirth$monthBirth$districtBirth$firstName$surName$beneficiaryIndex';
  }

  String getValueFromMap(Map dataObject, List<String> objectData) {
    String value = '';
    try {
      for (var referenceId in objectData) {
        if (dataObject[referenceId] != null) {
          value = dataObject[referenceId];
        }
      }
    }catch (e){}
    return value;
  }
}