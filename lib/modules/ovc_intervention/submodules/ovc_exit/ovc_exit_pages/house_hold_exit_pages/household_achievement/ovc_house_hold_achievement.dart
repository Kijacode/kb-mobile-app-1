import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_achievement/components/ovc_house_hold_achievement_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_achievement/constants/ovc_house_hold_achievement_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_achievement/pages/ovc_house_hold_achievement_form.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldAchievement extends StatelessWidget {
  final String label = 'House Hold Case Plan Achievement Rediness';
  final List<String> programStageIds = [
    OvcHouseHoldAchievementConstant.programStage
  ];

  void updateFormState(
      BuildContext context, bool isEditableMode, Events achievement) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);

    if (achievement != null) {
      Provider.of<ServiceFormState>(context, listen: false);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', achievement.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', achievement.event);
      for (Map datavalue in achievement.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcHouseHoldAchievementForm()));
  }

  void onAddNewHouseHoldAchievement(
    BuildContext context,
    OvcHouseHold houseHold,
  ) {
    updateFormState(context, true, null);
  }

  void onViewHouseHoldAchievement(
      BuildContext context, OvcHouseHold houseHold, Events achievement) {
    updateFormState(context, false, achievement);
  }

  void onEditHouseHoldAchievement(
      BuildContext context, OvcHouseHold houseHold, Events achievement) {
    updateFormState(context, true, achievement);
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
            child: Consumer<OvcHouseHoldCurrentSelectionState>(
              builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                var currentOvcHouseHold =
                    ovcHouseHoldCurrentSelectionState.currentOvcHouseHold;
                return Container(
                  child: Column(
                    children: [
                      OvcHouseHoldInfoTopHeader(
                        currentOvcHouseHold: currentOvcHouseHold,
                      ),
                      Container(
                        child: Consumer<OvcHouseHoldCurrentSelectionState>(
                          builder: (context, ovcHouseHoldCurrentSelectionState,
                              child) {
                            OvcHouseHold currentOvcHouseHold =
                                ovcHouseHoldCurrentSelectionState
                                    .currentOvcHouseHold;
                            return Container(
                              child: Consumer<ServiveEventDataState>(
                                builder:
                                    (context, serviveEventDataState, child) {
                                  bool isLoading =
                                      serviveEventDataState.isLoading;
                                  return isLoading
                                      ? CircularProcessLoader(
                                          color: Colors.blueGrey,
                                        )
                                      : Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  top: 10.0,
                                                  right: 13.0,
                                                  left: 13.0,
                                                ),
                                                child:
                                                    OvcHouseHoldAchievementListContainer(
                                                        programStageIds:
                                                            programStageIds,
                                                        onEditHouseHoldAchievement:
                                                            (Events achievement) =>
                                                                onEditHouseHoldAchievement(
                                                                  context,
                                                                  currentOvcHouseHold,
                                                                  achievement,
                                                                ),
                                                        onViewHouseHoldAchievement:
                                                            (Events achievement) =>
                                                                onViewHouseHoldAchievement(
                                                                  context,
                                                                  currentOvcHouseHold,
                                                                  achievement,
                                                                )),
                                              ),
                                              Container(
                                                child: Visibility(
                                                  visible: !isLoading,
                                                  child:
                                                      OvcEnrollmentFormSaveButton(
                                                          label:
                                                              "NEW ACHIEVEMENT",
                                                          labelColor:
                                                              Colors.white,
                                                          fontSize: 10,
                                                          buttonColor:
                                                              Color(0xFF4B9F46),
                                                          onPressButton: () =>
                                                              onAddNewHouseHoldAchievement(
                                                                context,
                                                                currentOvcHouseHold,
                                                              )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                },
                              ),
                            );
                          },
                        ),
                      )
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
