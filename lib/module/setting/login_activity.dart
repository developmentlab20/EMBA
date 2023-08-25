import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';

class LoginActivityScreen extends StatefulWidget {
  const LoginActivityScreen({Key? key}) : super(key: key);

  @override
  _LoginActivityScreenState createState() => _LoginActivityScreenState();
}

class _LoginActivityScreenState extends State<LoginActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Login_Activity,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const SizedBox(height: 20,),
           Container(
               margin: const EdgeInsets.only(left: 20,right: 20),
               child: Utils.mediumHeadingNormalText(text:UtilStrings.Where_you_re_logged_in,textSize: 14)),
           Expanded(
             child: ListView.builder(
                 itemCount: 1,
                 shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                 itemBuilder:(BuildContext context, int index){
                   return GestureDetector(
                     child:Utils.commanLoginActivity("City, State", "Feb 5, 2022", "Device",context),
                   );
                 }),
           )
         ],
      ),
    );
  }
}
