import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class BioDataInformationAboutIndexPositiveClient {
  static List<FormSection> getFormSections() {
    return [
            FormSection(
               name: 'BIO DATA: Information about Index Positive client',
               color: Color(0xFF05131B),
               inputFields: [
                  InputField(
                      id: 'eT9Dk0tPnHe',
                      name: 'Do you allow New Start to provide HTS services to all people?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                     ),
                  InputField(
                      id: 'V5mfC58nqj2',
                      name: 'If No, Give reasons for not indexing',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                      options: [
                        InputFieldOption(code: 'Family members know their HIV positive status', name: 'Family members know their HIV positive status'),
                        InputFieldOption(code: 'To consult family member(s) first', name: 'To consult family member(s) first'),
                        InputFieldOption(code: 'Fear of stigma', name: 'Fear of stigma'),
                        InputFieldOption(code: 'Other', name: 'Other')
                      ]),
                  InputField(
                      id: 'Gfakgx9bgsW',
                      name: 'Other reasons for not indexing',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                   InputField(
                      id: 'ssL9Wi4Qm0u',
                      name: 'For Newly identified positive, Client UIC',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                   InputField(
                      id: 'ePGwxaqA5Po',
                      name: 'For Known Positive clients: Are you already in ART treatment?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'MqHM8UEHaFD',
                      name: 'If Yes, File No',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'qdN6oXzoUCg',
                      name: 'ART START Date',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'rvZ3SgtvxB5',
                      name: 'ART enrolment facility',
                      valueType: 'ORGANISATION_UNIT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'rvkObPpBWbH',
                      name: 'Where lead identified',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                      options: [
                        InputFieldOption(code: 'Facility', name: 'Facility'),
                        InputFieldOption(code: 'Community', name: 'Community')
                      ]),
                  InputField(
                      id: 'Vw2UuN7qN8P',
                      name: 'Index to Index Contact linkage',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),   
                ]),
          
    ];
  }
}