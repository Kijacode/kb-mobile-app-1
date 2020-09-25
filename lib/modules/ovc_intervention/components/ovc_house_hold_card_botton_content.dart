import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';

class OvcHouseHoldCardBottonContent extends StatelessWidget {
  const OvcHouseHoldCardBottonContent({
    Key key,
    @required this.ovcHouseHold,
    @required this.canAddChild,
    @required this.canViewChildInfo,
    @required this.canViewChildService,
    @required this.canViewChildReferral,
    @required this.canViewChildExit,
    @required this.canAddChildExit,
    @required this.canEditChildInfo,
  }) : super(key: key);

  final OvcHouseHold ovcHouseHold;
  final bool canAddChild;
  final bool canViewChildInfo;
  final bool canEditChildInfo;
  final bool canViewChildService;
  final bool canViewChildReferral;
  final bool canViewChildExit;
  final bool canAddChildExit;

  void onEditChildInfo(OvcHouseHoldChild child) {
    print('onEditChildInfo ${child.toString()}');
  }

  void onViewChildInfo(OvcHouseHoldChild child) {
    print('onViewChildInfo ${child.toString()}');
  }

  void onAddNewChild() {
    print('onAddNewChild ');
  }

  void onViewChildService(OvcHouseHoldChild child) {
    print('onViewChildService ${child.toString()}');
  }

  void onViewChildReferral(OvcHouseHoldChild child) {
    print('onViewChildReferral ${child.toString()}');
  }

  void onViewChildExit(OvcHouseHoldChild child) {
    print('onViewChildExit ${child.toString()}');
  }

  void onAddChildExit(OvcHouseHoldChild child) {
    print('onAddChildExit ${child.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child:
                        SvgPicture.asset("assets/icons/children_ovc_icon.svg")),
                Expanded(
                  child: Container(
                    child: Text('Children List',
                        style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0xFF536852),
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: ovcHouseHold.children.map((OvcHouseHoldChild child) {
              int index = ovcHouseHold.children.indexOf(child) + 1;
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        '$index. ${child.toString()}',
                        style: TextStyle().copyWith(
                            fontSize: 14.0,
                            color: Color(0xFF536852),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Visibility(
                      visible: canViewChildService ||
                          canViewChildInfo ||
                          canViewChildExit,
                      child: Container(
                          child: InkWell(
                              onTap: () => canViewChildExit
                                  ? onViewChildExit(child)
                                  : canViewChildInfo
                                      ? onViewChildInfo(child)
                                      : canViewChildService
                                          ? onViewChildService(child)
                                          : null,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'VIEW',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    color: Color(0xFF4B9F46),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))),
                    ),
                    Visibility(
                      visible: canAddChildExit,
                      child: Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: InkWell(
                              onTap: () => onAddChildExit(child),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'ADD',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    color: Color(0xFF4B9F46),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))),
                    ),
                    Visibility(
                      visible: canViewChildReferral,
                      child: Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: InkWell(
                              onTap: () => onViewChildReferral(child),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'REFERRAL',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    color: Color(0xFF4B9F46),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))),
                    ),
                    Visibility(
                      visible: canEditChildInfo,
                      child: Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: InkWell(
                              onTap: () => onEditChildInfo(child),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'EDIT',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    color: Color(0xFF4B9F46),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))),
                    )
                  ])
                ],
              );
            }).toList(),
          ),
          Visibility(
              visible: canAddChild,
              child: Container(
                child: LineSeperator(
                  color: Color(0xFFECF5EC),
                ),
              )),
          Visibility(
              visible: canAddChild,
              child: Container(
                child: InkWell(
                    onTap: () => onAddNewChild(),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'ADD CHILD',
                        style: TextStyle().copyWith(
                          fontSize: 12.0,
                          color: Color(0xFF4B9F46),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}