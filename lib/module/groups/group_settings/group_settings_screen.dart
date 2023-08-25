
import 'package:flutter/material.dart';

import '../../../../utils/string_utils.dart';
import '../../../../widget/common/appbar/common_appBar.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/route/route_name.dart';
import '../../../utils/utils.dart';

class GroupSettingsScreen extends StatefulWidget {
  const GroupSettingsScreen({Key? key}) : super(key: key);

  @override
  State<GroupSettingsScreen> createState() => _GroupSettingsScreenState();
}

class _GroupSettingsScreenState extends State<GroupSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Settings,),
      ),
      body: SizedBox(
        width:size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
            const SizedBox(height: 30,),
               ListView.builder(
                   itemCount: Constants.groupSettings.length,
                   shrinkWrap: true,
                   itemBuilder: (BuildContext context,int index){
                 return Padding(
                   padding: const EdgeInsets.only(bottom:30),
                   child: GestureDetector(
                     onTap: (){
                       if(index==0){
                       Navigator.pushNamed(context, RouteName.EditGroupDetailsScreen);
                       }else if(index==1){
                         Navigator.pushNamed(context, RouteName.PendingApprovalsScreen);
                       }else if(index==2){
                         Navigator.pushNamed(context, RouteName.ReportPostsScreen);
                       }else if(index==3){
                         Navigator.pushNamed(context, RouteName.ChangePrivacyScreen);
                       }else if(index==4){
                         deleteDialog();
                       }
                     },
                     child: SizedBox(
                       width: size.width,
                       child: Row(children: [
                         Utils.image(image: Constants.groupSettings[index].image,height: 20,width: 20),
                       const SizedBox(width: 20,),
                         Utils.mediumHeadingNormalText(text:Constants.groupSettings[index].text,color: AppColor.grey,
                         fontWeight: FontWeight.w400,textSize: 14
                         )
                       ],),
                     ),
                   ),
                 );
               })
          ],),
        ),
      ),
    );
  }
  deleteDialog(){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          Utils.image(image: "delete_group_icon.png",height: 24,width: 24),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text:UtilStrings.Are_you_sure_you_want_to_delete_this,
              fontWeight: FontWeight.w400),
          const SizedBox(height: 14,),
          Utils.customDivider(),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(height: 35,
              width: 90,
                decoration: BoxDecoration(
                  color: AppColor.appGreen,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Center(
                  child: Utils.mediumHeadingNormalText(text: UtilStrings.Yes,color: AppColor.white,textSize: 14,
                  fontWeight: FontWeight.w500),
                ),
              ),
            ),
              const SizedBox(width: 34,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(height: 35,
            width: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.grey),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Center(
                  child: Utils.mediumHeadingNormalText(text: UtilStrings.Cancel,color: AppColor.grey,textSize: 14,
                  fontWeight: FontWeight.w500),
                ),
            ),
              ),
          ],)
        ],),
      );
    });
  }
}
