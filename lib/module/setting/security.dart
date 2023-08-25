import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Security,),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Utils.settingCommanWidget("key.png", UtilStrings.Password,(){
            Navigator.pushNamed(context, RouteName.password);
          },AppColor.TITLE_COLOR),
          SizedBox(height: 20,),
          Utils.settingCommanWidget("location.png", UtilStrings.Login_Activity,  (){
            Navigator.pushNamed(context, RouteName.login_activity);
          },AppColor.TITLE_COLOR),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}
