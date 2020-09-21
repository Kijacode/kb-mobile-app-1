import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_children.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card_body.dart';

// ignore: must_be_immutable
class OvcInterventionCard extends StatelessWidget {
  bool editService, editReferral, editEnrollment, addExit;
  bool showChild = false;

  OvcInterventionCard(
      {@required this.editService,
      @required this.editReferral,
      @required this.editEnrollment,
      @required this.addExit});

    //this line used as the setstate in statefull widgets
    // (context as Element).markNeedsBuild();
    
  void onExpand(BuildContext context) {
    showChild = !showChild;

    print("on Expand");
    //
    (context as Element).markNeedsBuild();
    
  }

  void onAssess() {
    print("on ASSESS");
  }

  void onPlan() {
    print("on Plan");
  }

  void onMonitor() {
    print("on Monitor");
  }

  void onReferral() {
    print("on Referral");
  }

  void onAchievment() {
    print("on Achievement");
  }

  void onExit() {
    print("on Exit");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0, right: 13.0, left: 13.0, top: 13),
      child: Material(
        type: MaterialType.card,
        elevation: 0.6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Container(
          padding: EdgeInsets.all(1),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.1),
                            width: 3))),
                margin: EdgeInsets.only(bottom: 3, top: 3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 15,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                          visible: true,
                          child: Expanded(
                              flex:  editEnrollment ? 3 :2,
                              child: SvgPicture.asset(
                                  "assets/icons/hh_icon.svg"))),
                      Visibility(
                          visible: true,
                          child: Expanded(
                            
                           // flex: editService || editReferral || addExit ? 8 : 8,
                           flex:  8,
                            child: Text(
                              "HHID-IL-00120820",
                              style: TextStyle(
                                  color: Color.fromRGBO(26, 53, 24, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Visibility(
                          visible: editService || editReferral || addExit
                              ? false
                              : true,
                          child: Expanded(
                              flex: 2,
                              child: SvgPicture.asset(
                                "assets/icons/expand_icon.svg",
                              ))),
                      Visibility(
                          visible: editService || editReferral || addExit
                              ? false
                              : true,
                          child: Expanded(
                            flex: 2,
                            child: SvgPicture.asset(
                              "assets/icons/edit_icon.svg",
                            ),
                          )),
                      Visibility(
                          visible: true,
                          child: Expanded(
                              flex: 1,
                              child: GestureDetector(
                                child: showChild || showChild && editEnrollment
                                    ? SvgPicture.asset(
                                        "assets/icons/chevron_up.svg",
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/chevron_down.svg",
                                      ),
                                onTap: () => onExpand(context),
                              )))
                    ],
                  ),
                ),
              ),
              //bodydata,
              OvcInterventionBodyData(),
              Visibility(
                visible: editService ? true : false,
                child: Container(
                  
                   decoration: BoxDecoration(
                     color: Color.fromRGBO(75, 159, 70, 0.05),
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                            
                            right:BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                            left:  BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                             top: BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1)
                            )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, left: 21, right: 21, bottom: 14),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: GestureDetector(
                            child: Text("ASSESS",
                                style: TextStyle(
                                    color: Color(0xFF4B9F46),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            onTap: () => onAssess(),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: GestureDetector(
                              child: Text("PLAN",
                                  style: TextStyle(
                                      color: Color(0xFF4B9F46),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              onTap: () => onPlan()),
                        ),
                        Expanded(
                          flex: 7,
                          child: GestureDetector(
                            child: Text("MONITOR",
                                style: TextStyle(
                                    color: Color(0xFF4B9F46),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            onTap: () => onMonitor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: editReferral ? true : false,
                child: Container(
                  
                   decoration: BoxDecoration(
                     color: Color.fromRGBO(75, 159, 70, 0.05),
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                            
                            right:BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                            left:  BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                             top: BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1)
                            )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, left: 21, right: 21, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Text(
                            "",
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: GestureDetector(
                            child: Text("REFERRAL",
                                style: TextStyle(
                                  color: Color(0xFF4B9F46),
                                  fontWeight: FontWeight.bold,
                                )),
                            onTap: () => onReferral(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: addExit ? true : false,
                child: Container(
                
                   decoration: BoxDecoration(
                     color: Color(0xfff6fcf6),
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xfff6fcf6),
                            width: 1),
                            
                            right:BorderSide(
                            color: Color(0xfff6fcf6),
                            width: 1),
                            left:  BorderSide(
                            color: Color(0xfff6fcf6),
                            width: 1),
                             top: BorderSide(
                            color: Color(0xfff6fcf6),
                            width: 1)
                            )),
                  child: Padding(
                    
                    padding: const EdgeInsets.only(top: 12, left: 8, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              child: Text("ACHIEVEMENT",
                                  style: TextStyle(
                                      color: Color(0xff99dc9a),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              onTap: () => onAchievment(),
                            ),
                          ),
                          flex: 7,
                        ),
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              child: Text("EXIT",
                                  style: TextStyle(
                                      color: Color(0xff99dc9a),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              onTap: () => onExit(),
                            ),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                              child: GestureDetector(
                            child: Text("TRANSFER",
                                style: TextStyle(
                                    color: Color(0xff99dc9a),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            onTap: () {
                              print("on Transfer");
                            },
                          )),
                          flex: 6,
                        ),
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              child: Text("CLOSURE",
                                  style: TextStyle(
                                      color: Color(0xffb5b8b5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              onTap: () {
                                print("on Closure");
                              },
                            ),
                          ),
                          flex: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: showChild ? true : false,
                child: Padding(
               
                  padding:editEnrollment ? const EdgeInsets.only(top:0):const EdgeInsets.only(top: 18.08),
                  child: AnimatedContainer(
                                      duration: Duration(seconds: 120),
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: SvgPicture.asset(
                                    "assets/icons/children_ovc_icon.svg"),
                              ),
                              flex: 3,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "CHILDREN LIST",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff143d14)),
                                ),
                              ),
                              flex: 9,
                            ),
                          ],
                        ),
                        OvcInterventionChilrens(
                            editService: editService,
                            editReferral: editReferral,
                            editEnrollment: editEnrollment,
                            addExit: addExit),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: editEnrollment && showChild ? true : false,
                child: Container(
                   decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Color(0xff9fde9f),
                              width: 3))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 21, right: 21, bottom: 10),
                 

                     
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              "",
                            ),
                          ),
                          Expanded(
                            flex: 13,
                            child: Text("ADD CHILD",
                                style: TextStyle(
                                  color: Color(0xFF4B9F46),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
