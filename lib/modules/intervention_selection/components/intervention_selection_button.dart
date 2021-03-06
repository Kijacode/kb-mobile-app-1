import 'package:flutter/material.dart';

class InterventionSelectionButton extends StatelessWidget {
  const InterventionSelectionButton(
      {Key key,
      @required this.isInterventionSelected,
      this.onInterventionButtonClick})
      : super(key: key);

  final bool isInterventionSelected;
  final VoidCallback onInterventionButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Container(
        margin: EdgeInsets.only(top: 60, bottom: 50),
        width: double.infinity,
        child: FlatButton(
            onPressed:
                !isInterventionSelected ? null : onInterventionButtonClick,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: isInterventionSelected
                        ? Color(0xFFFAFAFA)
                        : Color(0xFF7FBA7C)),
                borderRadius: BorderRadius.circular(12.0)),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              child: Text(
                'Continue',
                style: TextStyle(
                    color: isInterventionSelected
                        ? Color(0xFFFAFAFA)
                        : Color(0xFF7FBA7C)),
              ),
            )),
      ),
    );
  }
}
