import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class ClientInformation {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Client Information',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'Dlri7xJ6u0a',
                name: 'Key Population',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'FSW', name: 'FSW'),
                  InputFieldOption(code: 'MSM SW', name: 'MSM SW'),
                  InputFieldOption(code: 'MSM NonSW', name: 'MSM NonSW'),
                  InputFieldOption(code: 'TG SW', name: 'TG SW'),
                  InputFieldOption(code: 'TG NonSW', name: 'TG NonSW'),
                  InputFieldOption(code: 'PWID', name: 'PWID'),
                  InputFieldOption(
                      code: 'Prisoner or enclosed',
                      name: 'Prisoner or enclosed')
                ]),
            InputField(
                id: 'hh5iJYHnEAr',
                name: 'Priority Pop: OVC 1',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HWf49rygbTG',
                name: 'Priority Pop: OVC 2',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BULkcZp7VrF',
                name: 'Priority Pop: Factory/exworker',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'PtoIbExJ2RE',
                name: 'Priority Pop: Mobile',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yVYVJe26S4u',
                name:
                    'Do you agree counselor will inform you of the test results in person?',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'B4xx1IVaAnI',
                name:
                    'Do you agree that the results of the test may be anonymously used for purposes of research and data collection purposes, provided that such information is de-identified with sufficient safeguards as to confidentiality?',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'OlKIVlexb1I',
                name: 'Priority Pop: Military',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HthZdwsEkt5',
                name: 'Priority Pop: Miner/ex worker',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          name: 'Previous HIV test history',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'HXUTJfK4T6V',
                name: 'Have you ever had an HIV test before',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'f8irSIFCXDF',
                name: 'When was the last test',
                valueType: 'DATE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JL1rGyJaDnw',
                name: 'Type of final assessment',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Provider', name: 'Provider'),
                  InputFieldOption(code: 'HIVST', name: 'HIVST')
                ]),
            InputField(
                id: 'j2qNW9NsNBv',
                name: 'Results of the last test were',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(
                      code: 'Positive on ART', name: 'Positive on ART'),
                  InputFieldOption(
                      code: 'Positve not on ART', name: 'Positve not on ART'),
                  InputFieldOption(code: 'Indeterminate', name: 'Indeterminate')
                ]),
          ]),
      FormSection(
          name: "Today's HIV test",
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'UlombfpCloG',
                name: 'Client Type',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Individual', name: 'Individual'),
                  InputFieldOption(code: 'Couple', name: 'Couple')
                ]),
            InputField(
                id: 'hWdE0MXmeuP',
                name: 'Couple UIC',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GSLu0wyCCsP',
                name: 'Testing channel',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aoWp3tKXOqa',
                name: 'Other community platforms',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Index', name: 'Index'),
                  InputFieldOption(
                      code: 'New Start clinic', name: 'New Start clinic'),
                  InputFieldOption(code: 'VCT', name: 'VCT'),
                  InputFieldOption(
                      code: 'Mobile testing', name: 'Mobile testing'),
                  InputFieldOption(code: 'Home-based', name: 'Home-based'),
                  InputFieldOption(code: 'Other', name: 'Other'),
                ]),
            InputField(
                id: 'p2r7Gf6Yqye',
                name: 'Layering',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Assist/ Sentebale', name: 'Assist/ Sentebale'),
                  InputFieldOption(code: 'IPC', name: 'IPC'),
                  InputFieldOption(code: 'M2M', name: 'M2M'),
                  InputFieldOption(
                      code: 'CRS or Caritas', name: 'CRS or Caritas'),
                  InputFieldOption(code: 'Promo', name: 'Promo'),
                  InputFieldOption(code: 'WVI', name: 'WVI'),
                  InputFieldOption(
                      code: 'Care for Lesotho', name: 'Care for Lesotho'),
                  InputFieldOption(code: 'Other', name: 'Other'),
                ]),
            InputField(
                id: 'RXHjnbJAMkz',
                name: 'Other layering',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'FclxLnBHILO',
                name: 'How far did you go to school',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Primary level', name: 'Primary level'),
                  InputFieldOption(
                      code: 'Secondary level', name: 'Secondary level'),
                  InputFieldOption(
                      code: 'Tertiary level',
                      name: 'Tertiary level (college/university)'),
                  InputFieldOption(
                      code: 'Vocational level', name: 'Vocational level'),
                  InputFieldOption(code: 'Other', name: 'Other'),
                  InputFieldOption(code: 'None', name: 'None'),
                  InputFieldOption(code: 'Primary', name: 'Primary'),
                  InputFieldOption(code: 'High school', name: 'High school'),
                  InputFieldOption(code: 'Tertiary', name: 'Tertiary'),
                ]),
            InputField(
                id: 'D8jPUK4QDxD',
                name: 'Your work',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Employment or Self employmed',
                      name: 'Employment or Self employmed'),
                  InputFieldOption(code: 'Student', name: 'Student'),
                  InputFieldOption(code: 'Unemployed', name: 'Unemployed')
                ]),
            InputField(
                id: 'EHhaJRS2gqc',
                name: 'What made you decide to get tested for HIV today',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Index', name: 'Index'),
                  InputFieldOption(
                      code: 'Other health worker', name: 'Other health worker'),
                  InputFieldOption(
                      code: 'Self motivated', name: 'Self motivated'),
                  InputFieldOption(code: 'Radio or TV', name: 'Radio or TV'),
                  InputFieldOption(
                      code: 'Positive self-test', name: 'Positive self-test'),
                  InputFieldOption(
                      code: 'PSI field or New Start staff',
                      name: 'PSI field or New Start staff'),
                  InputFieldOption(
                      code: 'Billboard or Poster', name: 'Billboard or Poster'),
                  InputFieldOption(
                      code: 'Partner notification',
                      name: 'Partner notification'),
                  InputFieldOption(
                      code: 'Other friends or relatives',
                      name: 'Other friends or relatives'),
                  InputFieldOption(code: 'Other', name: 'Other'),
                ]),
            InputField(
                id: 'OJfuwI9k15B',
                name: 'Other reasons why decided to get tested',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          name: 'Risk assessment',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'SNGOfhanJia',
                name: 'Pregnant/breastfeeding',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CR5xUFmPHVy',
                name: 'Do you know your partners HIV status',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ODv7ghspcbG',
                name: "what's your partner HIV status",
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(code: 'Unknown', name: 'Unknown'),
                  InputFieldOption(code: 'No Response', name: 'No Response')
                ]),
            InputField(
                id: 'DzRsmX6O9V6',
                name: 'Na u',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Circumsized', name: 'Circumsized'),
                  InputFieldOption(
                      code: 'Genital sores or discharge',
                      name: 'Genital sores or discharge')
                ]),
            InputField(
                id: 'qS3VY5i86ZB',
                name: 'Number of sexual partners in last 12  months',
                valueType: 'INTEGER_ZERO_OR_POSITIVE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          name: 'Non-communicable diseases',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'x7Jzm67o0Ng',
                name: 'Height (m)',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gCvMVscBNfk',
                name: 'Weight',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WeaVsrFcWne',
                name: 'Blood Pressure Systolic (mmHg)',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RqWMrqUcDqv',
                name: 'Blood PressureDiastolic (mmHg)',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Circumsized', name: 'Circumsized'),
                  InputFieldOption(
                      code: 'Genital sores or discharge',
                      name: 'Genital sores or discharge')
                ]),
            InputField(
                id: 'UlJr5baZcQj',
                name: 'Glucose',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(name: 'HIV test', color: Color(0xFF737373), inputFields: [
        InputField(
            id: 'sPdC9NxNEME',
            name: 'T1: Result',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative')
            ]),
        InputField(
            id: 'ZZcv0xCUXLP',
            name: 'T2: Result',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative')
            ]),
        InputField(
            id: 'nleqA1tu4Gs',
            name: 'T3: Parallel 1/2',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative')
            ]),
        InputField(
            id: 'FweZ4RT9EUI',
            name: 'T3: Parallel 2/2',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative')
            ]),
        InputField(
            id: 'EPNufgY5Q4j',
            name: 'T4: SD Bioline',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative'),
              InputFieldOption(code: 'Out of stock', name: 'Out of stock')
            ]),
        InputField(
            id: 'mhZeM9CuGQn',
            name: 'Final results',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative'),
              InputFieldOption(code: 'Indeterminate', name: 'Indeterminate')
            ]),
        InputField(
            id: 'IcJ9QmUV2Mw',
            name: 'Test results given',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'vu6kABBg23g',
            name: 'If HIV+, did client have knowledge of HIV+ status',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'OLM5yg5kW6R',
            name: 'Extra products used: Determine strips',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'MoA0SBuczaP',
            name: 'Extra products used: Capillary tubes',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'j4j5ppqBTDd',
            name: 'Extra products used: Alcohol swabs',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'VKPaCtAS9vg',
            name: 'Extra products used: Unigold strips',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'dnCcoQIVZ1I',
            name: 'Extra products used: Exam gloves',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'GO6QIfHE7Vc',
            name: 'TB Screening conducted',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'WWL1XKS3Hg8',
            name: 'TB Suspected',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'NpGma0GzvBk',
            name: 'Referral offered',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'Mcoc57TzQwX',
            name: 'ART referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'O2IpQLJ64pU',
            name: 'DNA PCR referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'MIda6PYnDe3',
            name: 'Fp referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'fPzwReDDMya',
            name: 'PReP (HIV-) referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'YstOYReVQSu',
            name: 'STI Dx/TX referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'HPzl16DToJQ',
            name: 'TB Dx/Tx referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'DGxRatLifox',
            name: 'VMMC referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'rvanxUEglQu',
            name: 'Name of referral DNA PCR or ART facility',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'YstOYReVQSu',
            name: 'STI Dx/TX referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'HPzl16DToJQ',
            name: 'TB Dx/Tx referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'DGxRatLifox',
            name: 'VMMC referral given to client',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'rvanxUEglQu',
            name: 'Name of referral DNA PCR or ART facility',
            valueType: 'ORGANISATION_UNIT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'tfqVBXrWxyZ',
            name: 'Female condoms distributed',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'uRHUjuCgaJU',
            name: 'Male condoms distributed',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'nUp9TLkqont',
            name: 'Lube condoms distributed',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'qtXzz8JEyFg',
            name: 'Senior counselor/Team Leader name',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
      ]),
    ];
  }
}
