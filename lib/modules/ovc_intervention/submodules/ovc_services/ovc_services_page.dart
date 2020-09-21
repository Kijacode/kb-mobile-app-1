import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_appBar.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card.dart';

class OvcServicesPage extends StatelessWidget {
  const OvcServicesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf4ed),
      appBar:AppBar(
         backgroundColor: Colors.white,
         title: OvcInterventionAppBar(title: "HOUSE HOLD LIST"),
      ),
        body:  SingleChildScrollView(
          
                  child: Column(
            children: [
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            ],
          
      ),
        ),
      );
    
    
    
  }
}
