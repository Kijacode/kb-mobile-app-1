import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/modules/intervention_selection/intervention_selection.dart';
import 'package:kb_mobile_app/modules/login/login.dart';
import 'package:kb_mobile_app/modules/splash/components/splash_implementer_list.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  
  @override
  void initState() {
    super.initState();
    AppUtil.setStatusBarColor(CustomColor.defaultPrimaryColor);
    UserService().getCurrentUser().then((CurrentUser user) {
      bool isUserLoginIn = user != null ? user.isLogin : false;
      setLandingPage(isUserLoginIn);
    });
  }

  void setLandingPage(bool isUserLoginIn) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isUserLoginIn ? InterventionSelection() : Login())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
                  child: Column(children: [
      Container(
          decoration: BoxDecoration(color: CustomColor.defaultPrimaryColor),
          height: size.height * 0.83,
          child: CircularProcessLoader(
              color: CustomColor.defaultSecondaryColor, size: 2.0),
      ),
      SplashImplementingPartnerList(),
    ]),
        ));
  }
}