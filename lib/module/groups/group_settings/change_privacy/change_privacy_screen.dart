import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../../../utils/utils.dart';

class ChangePrivacyScreen extends StatefulWidget {
  const ChangePrivacyScreen({Key? key}) : super(key: key);

  @override
  State<ChangePrivacyScreen> createState() => _ChangePrivacyScreenState();
}

class _ChangePrivacyScreenState extends State<ChangePrivacyScreen> {
  bool public =false;
  bool private =false;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Change_Privacy,),
      ),
      body: SizedBox(
        width: size.width,
        child:  Column(
          children: [
          const SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 40),
              child: Row(
                children: [
                  Utils.mediumHeadingNormalText(text: UtilStrings.Public,fontWeight: FontWeight.w600),
                  Spacer(),
                  SizedBox(height: 10,width: 10,
                    child: Checkbox(
                        activeColor: AppColor.appGreen,
                        value: public,
                        onChanged: (value){
                         setState(() {
                           public=true;
                           private=false;
                         });
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 40),
              child: Row(
                children: [
                  Utils.mediumHeadingNormalText(text: UtilStrings.Private,fontWeight: FontWeight.w600),
                  Spacer(),
                  SizedBox(height: 10,width: 10,
                    child: Checkbox(
                        activeColor: AppColor.appGreen,
                        value: private,
                        onChanged: (value){
                         setState(() {
                           private=true;
                           public=false;
                         });
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32,),
            Utils.customDivider()
        ],),
      ),
    );
  }
}
