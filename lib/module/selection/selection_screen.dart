import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/common_button.dart';
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width:size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              children:  [
              const SizedBox(height:65,),
              Utils.mediumHeadingNormalText(text: UtilStrings.Welcome_to,fontWeight: FontWeight.bold,textSize:22),
                Utils.image(image: "splash_icon.png",height:100,width:100),
                Utils.mediumHeadingNormalText(text: UtilStrings.An_Exclusive_Network_of_Executive_MBAs,fontWeight: FontWeight.bold,textSize:14),
                const SizedBox(height:24,),
                CommonButton(border: true,text: UtilStrings.Sign_Up,onTap: (){
                  Navigator.pushNamed(context, RouteName.SignupScreen);
                },),
                const SizedBox(height:16,),
                Row(children: [
                  const Expanded(child: Divider(color:AppColor.grey,)),
                  const SizedBox(width:6,),
                  Padding(
                    padding: const EdgeInsets.only(bottom:6),
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.or,fontWeight: FontWeight.bold,textSize:14),
                  ),
                  const SizedBox(width:6,),
                  const Expanded(child: Divider(color:AppColor.grey,)),
                ],),
                const SizedBox(height:16,),
                CommonButton(text:UtilStrings.Login,onTap: (){
                  Navigator.pushNamed(context, RouteName.LoginScreen);
                },),
                const SizedBox(height:30,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Top_Executives_from,fontWeight: FontWeight.bold,textSize:14),
                const SizedBox(height:30,),
                Utils.image(image: "top_school_1.png"),
                const SizedBox(height:20,),
                Utils.image(image: "top_school_2.png"),
                const SizedBox(height:20,),
                Utils.image(image: "top_school_3.png"),
                const SizedBox(height:20,),
                Utils.mediumHeadingNormalText(text: UtilStrings.More_Schools,fontWeight: FontWeight.bold,textSize:14),
                const SizedBox(height:16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
