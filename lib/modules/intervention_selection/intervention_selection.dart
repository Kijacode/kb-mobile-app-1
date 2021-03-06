import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/services/reserved_attribute_value_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_container.dart';
import 'package:provider/provider.dart';

class InterventionSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterventionSelectionState();
  }
}

class _InterventionSelectionState extends State<InterventionSelection> {
  List<InterventionCard> interventionPrograms =
      InterventionCard.getInterventions();

  Color primmaryColor = CustomColor.defaultPrimaryColor;
  bool hasDataLoaded = false;

  void onIntervetionSelection(InterventionCard interventionProgram) {
    setState(() {
      AppUtil.setStatusBarColor(interventionProgram.primmaryColor);
      primmaryColor = interventionProgram.primmaryColor;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), updateDataStateLoadingStatus);
  }

  updateDataStateLoadingStatus() async {
    await ReservedAttributeValueService().generateReservedAttributeValues();
    Provider.of<OvcInterventionListState>(context, listen: false)
        .refreshOvcList();
    Provider.of<DreamsInterventionListState>(context, listen: false)
        .refreshDreamsList();
    Provider.of<OgacInterventionListState>(context, listen: false)
        .refreshOgacList();
    Provider.of<CurrentUserState>(context, listen: false)
        .setCurrentUserLocation();
    setState(() {
      hasDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(color: primmaryColor),
        ),
        Container(child: Consumer<OvcInterventionListState>(
          builder: (context, ovcInterventionListState, child) {
            bool isOvcListLoading = ovcInterventionListState.isLoading;
            int numberOfHouseHolds =
                ovcInterventionListState.numberOfHouseHolds;
            int numberOfOvcs = ovcInterventionListState.numberOfOvcs;
            return Container(
              child: Consumer<DreamsInterventionListState>(
                builder: (context, dreamsInterventionListState, child) {
                  bool isDreamsListLoading =
                      dreamsInterventionListState.isLoading;
                  int numberOfAgywDreamsBeneficiaries =
                      dreamsInterventionListState
                          .numberOfAgywDreamsBeneficiaries;
                  int numberOfNoneAgywDreamsBeneficiaries =
                      dreamsInterventionListState
                          .numberOfNoneAgywDreamsBeneficiaries;

                  return Consumer<OgacInterventionListState>(
                    builder: (context, ogacInterventionListState, child) {
                      int numberOfOgac = ogacInterventionListState.numberOfOgac;
                      bool isOgacListLoading =
                          ogacInterventionListState.isLoading;
                      return Container(
                        child: isDreamsListLoading ||
                                isOvcListLoading ||
                                isOgacListLoading
                            ? CircularProcessLoader()
                            : InterventionSelectionContainer(
                                interventionPrograms: interventionPrograms,
                                onIntervetionSelection: onIntervetionSelection,
                                numberOfHouseHolds: numberOfHouseHolds,
                                numberOfAgywDreamsBeneficiaries:
                                    numberOfAgywDreamsBeneficiaries,
                                numberOfNoneAgywDreamsBeneficiaries:
                                    numberOfNoneAgywDreamsBeneficiaries,
                                numberOfOvcs: numberOfOvcs,
                                numberOfOgac: numberOfOgac,
                              ),
                      );
                    },
                  );
                },
              ),
            );
          },
        )),
      ],
    )));
  }
}
