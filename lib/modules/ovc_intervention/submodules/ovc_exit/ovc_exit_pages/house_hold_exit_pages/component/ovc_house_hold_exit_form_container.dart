import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldExitFormContainer extends StatefulWidget {
  const OvcHouseHoldExitFormContainer({
    Key key,
    @required this.event,
    @required this.formSections,
    @required this.isSaving,
    this.onSaveForm,
  }) : super(key: key);

  final Events event;
  final List<FormSection> formSections;
  final bool isSaving;
  final Function onSaveForm;

  @override
  _OvcHouseHoldExitFormContainerState createState() =>
      _OvcHouseHoldExitFormContainerState();
}

class _OvcHouseHoldExitFormContainerState
    extends State<OvcHouseHoldExitFormContainer> {
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      bool isEditableMode = widget.event == null;
      updateFormState(context, isEditableMode, widget.event);
      setState(() {
        isFormReady = true;
      });
    });
  }

  void onEditForm() {
    bool isEditableMode = true;
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
  }

  void updateFormState(
      BuildContext context, bool isEditableMode, Events event) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (event != null) {
      Provider.of<ServiceFormState>(context, listen: false);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', event.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', event.event);
      for (Map datavalue in event.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
  }

  @override
  Widget build(BuildContext context) {
    return !isFormReady
        ? Container(
            child: CircularProcessLoader(
              color: Colors.blueGrey,
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
            child: Consumer<ServiceFormState>(
              builder: (context, serviceFormState, child) {
                return Column(
                  children: [
                    MaterialCard(
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Visibility(
                                visible: !serviceFormState.isEditableMode,
                                child: FlatButton(
                                  onPressed: () => onEditForm(),
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Color(0xFF4B9F46).withOpacity(0.3),
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                      child: Text(
                                    'Update',
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF4B9F46),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: EntryFormContainer(
                              elevation: 0.0,
                              formSections: widget.formSections,
                              mandatoryFieldObject: Map(),
                              dataObject: serviceFormState.formState,
                              isEditableMode: serviceFormState.isEditableMode,
                              onInputValueChange: onInputValueChange,
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: serviceFormState.isEditableMode,
                      child: OvcEnrollmentFormSaveButton(
                        label: widget.isSaving ? 'Saving ...' : 'Save',
                        labelColor: Colors.white,
                        buttonColor: Color(0xFF4B9F46),
                        fontSize: 15.0,
                        onPressButton: () {
                          widget.onSaveForm(serviceFormState.formState);
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          );
  }
}