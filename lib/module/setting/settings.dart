import 'package:emba/model/sucess_response.dart';
import 'package:emba/module/setting/setting_presenter.dart';
import 'package:emba/utils/sharedpref/preferences.dart';
import 'package:emba/utils/sharedpref/shared_prefrence.dart';
import 'package:emba/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> implements SettingInterface{
  SettingPresenter? settingPresenter;
  bool isLoading=false;
  @override
  void initState() {
settingPresenter=SettingPresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:  PreferredSize(
          preferredSize:  const Size(double.infinity, kToolbarHeight),
          child:CommonAppBar(title:UtilStrings.Settings,),
        ),
        body: Stack(children: [
          Column(
            children: [
              const SizedBox(height: 22,),
              Utils.settingCommanWidget("key.png", UtilStrings.Change_Password,
                      (){
                    Navigator.pushNamed(context, RouteName.security);
                  },AppColor.TITLE_COLOR),
              const SizedBox(height: 26,),
              Utils.settingCommanWidget("invite.png", UtilStrings.Invite_to_EMBA  ,(){
                Utils.share();
              },AppColor.TITLE_COLOR),
              const SizedBox(height: 26,),
              Utils.settingCommanWidget("about.png", UtilStrings.About_Us,  (){
                Navigator.pushNamed(context, RouteName.about_us);
              },AppColor.TITLE_COLOR),
              const SizedBox(height: 26,),
              /* Utils.settingCommanWidget("about.png", UtilStrings.Security,  (){
              Navigator.pushNamed(context, RouteName.security);
            },AppColor.TITLE_COLOR),
            const SizedBox(height: 26,),*/
              Utils.settingCommanWidget("document.png", UtilStrings.Terms_condition,  (){
                Navigator.pushNamed(context, RouteName.terms_condition);
              },AppColor.TITLE_COLOR),
              const SizedBox(height: 26,),
              Utils.settingCommanWidget("delete.png", UtilStrings.Delete,(){
                popDialog(UtilStrings.Are_you_sure_you_want_to_delete_this, 1);
              },AppColor.red),
              const SizedBox(height: 26,),
              Utils.settingCommanWidget("delete.png", UtilStrings.Deactivate,(){
                popDialog(UtilStrings.Are_you_sure_you_want_to_deactive_this, 2);
              },AppColor.red),
            ],
          ),
          Utils.progressDialog(context, isLoading)
        ],)
      ),
    );
  }
  //1=delete 2=deactive
  popDialog(String msg,int type){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          Utils.image(image: "ic_delete.png",height: 24,width: 24),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text:msg,
              fontWeight: FontWeight.w400),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                    isLoading=true;
                  });
                  if(type==1){
                    settingPresenter!.doDelete();
                  }else{

                    settingPresenter!.doActiveDeactive(false);
                  }
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

  @override
  onError(String msg, int status) {
    setState(() {
      isLoading=false;
    });
  if(status==400){
    CustomSnackBar.showSuccessSnackBar(context,message:msg);
    Utils.sessionExpire(context);
   }else{
    CustomSnackBar.showErrorSnackBar(context,message:msg);
   }
  }

  @override
  onSuccessActiveRespnse(SuccessResponse response) {
    setState(() {
      isLoading=false;
    });
    if(response.status==200){
      Navigator.pushReplacementNamed(context, RouteName.LoginScreen);
      CustomSnackBar.showSuccessSnackBar(context,message: response.message);
    }
  }

  @override
  onSuccessRespnse(SuccessResponse response) {
    setState(() {
      isLoading=false;
    });
   if(response.status==200){
     Utils.sessionExpire(context);
     CustomSnackBar.showSuccessSnackBar(context,message: response.message);
   }
  }

  @override
  onSuccessNotificationRespnse(SuccessResponse response) {

  }
}
