import 'package:emba/utils/sharedpref/preferences.dart';
import 'package:emba/utils/sharedpref/shared_prefrence.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if(SessionManager.getBoolean(Preferences.USER_LOGIN)){
      Future.delayed(Duration(seconds:3),(){
        Navigator.pushReplacementNamed(context, RouteName.BottomNavigationBarScreen);
      });
    }else{
      Future.delayed(Duration(seconds:3),(){
        Navigator.pushReplacementNamed(context, RouteName.SelectionScreen);
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(child: Utils.image(image: "splash_icon.png",height:300,width:300)),
    );
  }
}
