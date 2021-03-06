import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class AgywDreamsPrepSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();

  static Future evaluateSkipLogics(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'Jhp451oeYyB' && value != 'true') {
        hiddenFields['p9AA21uFn2n'] = true;
        hiddenFields['Y0QGNDBCEbz'] = true;
      }
      if (inputFieldId == 'JflxahjBLrH' && value != 'true') {
        hiddenFields['PqSjDmu2eMy'] = true;
      }

      if (inputFieldId == 'IrJBisQbxi6' && value != 'true') {
        hiddenFields['XnVcJkyoobx'] = true;
        hiddenFields['sUyz3SX93IM'] = true;
        hiddenFields['D1ukXCpeU0K'] = true;
      }
      if (inputFieldId == 'kQULFUqgab0' && value != '1') {
        hiddenFields['WsZMwXWcHly'] = true;
      }
      if ((inputFieldId == 'Syuc71VFOuO' && value != '1') &&
          dataObject['meLwdeoU4Ei'] != '1') {
        hiddenFields['zs5TJVoHg9j'] = true;
      }
      if ((inputFieldId == 'meLwdeoU4Ei' && value != '1') &&
          dataObject['Syuc71VFOuO'] != '1') {
        hiddenFields['zs5TJVoHg9j'] = true;
      }

      //Substantial Risk and Eligibility
      if (inputFieldId == 'pQaAQdJnE1w' && value != 'Yes') {
        hiddenFields['DobfAIMBOvy'] = true;
      }
      if (inputFieldId == 'O8Fz5EWOOzU' && value != 'true') {
        hiddenFields['KLxWrSRAXfY'] = true;
      }
      if (inputFieldId == 'rDV6sBIwivl' && value != 'true') {
        hiddenSections['PeSfSRaE'] = true;
      }

      if (inputFieldId == 'kK8Gt6LA8QM' && value != 'Other') {
        hiddenFields['gufQ1ELVqcS'] = true;
      }
      if (inputFieldId == 'qgNIIJBeMBT' && value != 'Other') {
        hiddenFields['gDlQ3IThgzH'] = true;
      }
      if (inputFieldId == 'bZ8fTvAhdMS' && value != 'true') {
        hiddenFields['UL1Pq6sgvr2'] = true;
      }

      if (inputFieldId == 'veoA322323t' &&
          !((value == 'true' && dataObject['bH9DpJOIutM'] == 'true') ||
              value != dataObject['bH9DpJOIutM'])) {
        hiddenSections['BsLnIfmtn'] = true;
      }
      if (inputFieldId == 'bH9DpJOIutM' &&
          !((value == 'true' && dataObject['veoA322323t'] == 'true') ||
              value != dataObject['veoA322323t'])) {
        hiddenSections['BsLnIfmtn'] = true;
      }
    }
    for (String sectionId in hiddenSections.keys) {
      List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections
          .where((formSection) => formSection.id == sectionId)
          .toList());
      for (String inputFieldId in inputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
    resetValuesForHiddenSections(context, formSections);
  }

  static resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(context, inputFieldId, null);
      }
    }
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
  }

  static resetValuesForHiddenSections(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenSections(hiddenSections);
  }

  static assignInputFieldValue(
    BuildContext context,
    String inputFieldId,
    String value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
