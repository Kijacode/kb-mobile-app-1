import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OvcInterventionChilrens extends StatelessWidget {
  bool editService, editReferral, editEnrollment, addExit;
  bool showChild = false;

  OvcInterventionChilrens(
      {@required this.editService,
      @required this.editReferral,
      @required this.editEnrollment,
      @required this.addExit});



  List<String> childrenList = [
    "Tebello Ramatla",
    "Pula Tihokomelo",
    "Bertha Nyakallo"
  ];


  void onView() {
    print("on View");
  }

  void onEdit() {
    print("on Edit");
  }

  void onRefferal() {
    print("on Refferal");
  }

  void onAdd() {
    print("on Add");
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
          padding: EdgeInsets.only(right: 0, top: 2),
      
        child: ListView.builder(
          padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: childrenList.length,
            itemBuilder: (context, index) {
              return  Row(
                  children: [
                    Text("         "),
                    Expanded(
                      child: Container(
                        child: Text((index + 1).toString() + ".",
                            style: TextStyle(
                              //Color.fromRGBO(26, 53, 24, 0.75)
                                color: Color(0x1a3518ff),
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(childrenList[index],
                            style: TextStyle(
                                color: Color(0x1a3518ff),
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ),
                      flex: editReferral ? 5 : 6,
                    ),
                    Expanded(
                      child: Container(
                        child: addExit || editService || editEnrollment
                            ? MaterialButton(
                              onPressed: ()=>onView(),
                                                        child: Text(
                                  "VIEW",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0x1a3518ff)),
                                ),
                            )
                            : Text(""),
                      ),
                      flex: editReferral ? 0 : 4,
                    ),
                    Expanded(
                      child: Container(
                        child: addExit
                            ? MaterialButton(
                              onPressed: ()=>onAdd(),
                                                        child: Text(
                                  "ADD",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:Color(0x1a3518ff)),
                                ),
                            )
                            : editReferral
                                ? MaterialButton(
                                  onPressed: () => onRefferal(),
                                                                child: Text(
                                      "REFERRAL",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0x1a3518ff)),
                                    ),
                                )
                                : MaterialButton(
                                  onPressed: ()=>onEdit(),
                                                                child: Text(
                                      "EDIT",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0x1a3518ff)),
                                    ),
                                ),
                      ),
                      flex:4,
                    ),
                  ],
                
              );
            }),
      ),
    );
  }
}
