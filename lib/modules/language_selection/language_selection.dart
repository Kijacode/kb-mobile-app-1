import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/language_selection_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/services/language_selection_service.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/login/login.dart';
import 'package:provider/provider.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({
    Key key,
    this.showLanguageSettingAppBar = false,
  }) : super(key: key);

  final bool showLanguageSettingAppBar;

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  final String label = 'Language setting';
  String selectionLanguageCode = '';

  @override
  void initState() {
    super.initState();
    LanguageSelectionService.getCurrentLanguageSelection().then((value) {
      selectionLanguageCode = value ?? selectionLanguageCode;
      setState(() {});
    });
  }

  void onSetSelectedLanguage(
    BuildContext context,
    String selectionLanguageCode,
  ) async {
    await LanguageSelectionService.setCurrentLanguageSelection(
      selectionLanguageCode,
    );
    Provider.of<LanguageTranslationState>(context, listen: false)
        .setLanguageTranslation(selectionLanguageCode);
    if (widget.showLanguageSettingAppBar) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: !widget.showLanguageSettingAppBar
              ? null
              : PreferredSize(
                  preferredSize: Size.fromHeight(65.0),
                  child: Consumer<IntervetionCardState>(
                    builder: (context, intervetionCardState, child) {
                      InterventionCard activeInterventionProgram =
                          intervetionCardState.currentIntervetionProgram;
                      return SubPageAppBar(
                        label: label,
                        activeInterventionProgram: activeInterventionProgram,
                        disableSelectionOfActiveIntervention: false,
                      );
                    },
                  ),
                ),
          body: LanguageSelectionContainer(
              selectionLanguageCode: selectionLanguageCode,
              showLanguageSettingAppBar: widget.showLanguageSettingAppBar,
              onSetSelectedLanguage: (String selectionLanguageCode) =>
                  onSetSelectedLanguage(
                    context,
                    selectionLanguageCode,
                  )),
        ),
      ),
    );
  }
}
