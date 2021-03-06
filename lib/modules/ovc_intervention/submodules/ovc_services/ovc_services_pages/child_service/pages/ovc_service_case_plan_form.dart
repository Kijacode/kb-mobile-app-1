import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_caseplan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_caseplan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/service_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';
import 'package:provider/provider.dart';

class OcvServiceCasePlanForm extends StatefulWidget {
  const OcvServiceCasePlanForm({
    Key key,
    this.shouldEditCaseGapFollowUps = false,
    this.shouldViewCaseGapFollowUp = false,
  }) : super(key: key);

  final bool shouldEditCaseGapFollowUps;
  final bool shouldViewCaseGapFollowUp;

  @override
  _OcvServiceCasePlanFormState createState() => _OcvServiceCasePlanFormState();
}

class _OcvServiceCasePlanFormState extends State<OcvServiceCasePlanForm> {
  final String label = 'Service Follow up';
  List<FormSection> formSections;
  Map borderColors = Map();

  bool isSaving = false;
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      formSections = [];
      for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
        borderColors[formSection.id] = formSection.borderColor;
        formSection.borderColor = Colors.transparent;
        formSections.add(formSection);
      }
      isFormReady = true;
    });
  }

  onInputValueChange(String formSectionId, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(formSectionId, value);
  }

  bool isAllDomainGoalAndGapFilled(Map dataObject) {
    bool isAllDomainFilled = true;
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String domainType in dataObject.keys.toList()) {
      Map domainDataObject = dataObject[domainType];
      if (domainDataObject['gaps'].length > 0 &&
          (domainDataObject[casePlanFirstGoal] == null ||
              '${domainDataObject[casePlanFirstGoal]}'.trim() == '')) {
        isAllDomainFilled = false;
      }
    }
    return isAllDomainFilled;
  }

  Future savingDomainsAndGaps(
    Map dataObject,
    OvcHouseHoldChild currentOvcHouseHoldChild,
  ) async {
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String domainType in dataObject.keys.toList()) {
      Map domainDataObject = dataObject[domainType];
      if (domainDataObject['gaps'].length > 0 &&
          (domainDataObject[casePlanFirstGoal] != null ||
              '${domainDataObject[casePlanFirstGoal]}'.trim() != '')) {
        try {
          List<String> hiddenFields = [
            OvcCasePlanConstant.casePlanToGapLinkage,
            OvcCasePlanConstant.casePlanDomainType
          ];
          List<FormSection> domainFormSections = formSections
              .where((FormSection formSection) => formSection.id == domainType)
              .toList();
          List<FormSection> domainGapFormSections =
              OvcServicesChildCasePlanGaps.getFormSections()
                  .where(
                      (FormSection formSection) => formSection.id == domainType)
                  .toList();
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcChildCasePlanConstant.program,
            OvcChildCasePlanConstant.casePlanProgramStage,
            currentOvcHouseHoldChild.orgUnit,
            domainFormSections,
            domainDataObject,
            domainDataObject['eventDate'],
            currentOvcHouseHoldChild.id,
            domainDataObject['eventId'],
            hiddenFields,
          );
          hiddenFields = [
            OvcCasePlanConstant.casePlanToGapLinkage,
            OvcCasePlanConstant.casePlanGapToFollowinUpLinkage
          ];
          for (Map domainGapDataObject in domainDataObject['gaps']) {
            await TrackedEntityInstanceUtil
                .savingTrackedEntityInstanceEventData(
              OvcChildCasePlanConstant.program,
              OvcChildCasePlanConstant.casePlanGapProgramStage,
              currentOvcHouseHoldChild.orgUnit,
              domainGapFormSections,
              domainGapDataObject,
              domainGapDataObject['eventDate'],
              currentOvcHouseHoldChild.id,
              domainGapDataObject['eventId'],
              hiddenFields,
            );
          }
        } catch (e) {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(
            child: Consumer<ServiceFormState>(
              builder: (context, serviceFormState, child) {
                Map dataObject = serviceFormState.formState;
                return Container(
                  child: !isFormReady
                      ? Container(
                          child: CircularProcessLoader(
                            color: Colors.blueGrey,
                          ),
                        )
                      : Column(
                          children: [
                            OvcChildInfoTopHeader(),
                            Container(
                              margin: EdgeInsets.only(
                                top: 10.0,
                                left: 13.0,
                                right: 13.0,
                              ),
                              child: Column(
                                children: formSections
                                    .map(
                                      (FormSection formSection) =>
                                          ServiceFormContainer(
                                        shouldEditCaseGapFollowUps:
                                            widget.shouldEditCaseGapFollowUps,
                                        shouldViewCaseGapFollowUp:
                                            widget.shouldViewCaseGapFollowUp,
                                        formSectionColor:
                                            borderColors[formSection.id],
                                        formSection: formSection,
                                        dataObject: dataObject[formSection.id],
                                        isEditableMode:
                                            serviceFormState.isEditableMode,
                                        onInputValueChange: (
                                          dynamic value,
                                        ) =>
                                            onInputValueChange(
                                                formSection.id, value),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
