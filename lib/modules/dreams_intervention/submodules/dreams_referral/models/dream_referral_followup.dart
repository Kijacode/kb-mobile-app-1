import 'dart:ui';

import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamReferralFollowUp {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Referral Follow Up',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'DPf5mUDoZMy',
              name: 'Follow-up date',
              valueType: 'DATE',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
            ),
            InputField(
                id: 'VHe4ctA0bqU',
                name: 'Follow-up Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Complete', name: 'Complete'),
                  InputFieldOption(code: 'Not complete', name: 'Not complete'),
                ]),
            InputField(
              id: 'BzkeBAxdEVT',
              name: 'Additional follow up required',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'LcG4J82PM4Z',
              name: 'Comments or next steps',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
            ),
          ])
    ];
  }
}
