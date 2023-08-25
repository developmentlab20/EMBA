import 'package:emba/model/notification/get_notification_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/module/setting/interface/notification_presenter.dart';
import 'package:emba/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

  @override
  _NotificationSettingScreenState createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen>implements GetNotificationInterface {
  bool pauseAll=false;
  bool isSwitchGroups=false;
  bool isSwitchConnection=false;
  bool isSwitchPostLikeComments=false;
  bool isSwitchMessage=false;
  bool isSwitchEvents=false;
  GetNotificationPresenter? getNotificationPresenter;
  bool isLoading =true;
  @override
  void initState() {
   getNotificationPresenter=GetNotificationPresenter(this);
   getNotificationPresenter!.doGetNotification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Notification_Settings,),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18,),
                      GestureDetector(
                          onTap: (){
                            // Navigator.pushNamed(context, RouteName.login_activity);
                          },
                          child: Utils.mediumHeadingNormalText(text:UtilStrings.Push_Notification,textSize: 14)),
                      const SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Utils.mediumHeadingNormalText(text:UtilStrings.Pause_all,textSize: 14),
                          Utils.switchButton(value: pauseAll,
                              activeTrackColor: AppColor.switch_color, inactiveTrackColor:
                              AppColor.grey, inactiveThumbColor: AppColor.white, activeColor: AppColor.switch_color,
                              onChanged: (value){
                                setState(() {
                                  pauseAll=value;
                                  updateNotification();
                                });
                              })
                        ],
                      ),
                      const SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Utils.mediumHeadingNormalText(text:UtilStrings.Groups,textSize: 14),
                          Utils.switchButton(value: isSwitchGroups,
                              activeTrackColor: AppColor.switch_color, inactiveTrackColor:
                              AppColor.grey, inactiveThumbColor: AppColor.white, activeColor: AppColor.switch_color,
                              onChanged: (value){
                                setState(() {
                                  isSwitchGroups=value;
                                  updateNotification();
                                });
                              })
                        ],
                      ),
                      const SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Utils.mediumHeadingNormalText(text:UtilStrings.Connections,textSize: 14),
                          Utils.switchButton(value: isSwitchConnection,
                              activeTrackColor: AppColor.switch_color, inactiveTrackColor:
                              AppColor.grey, inactiveThumbColor: AppColor.white, activeColor: AppColor.switch_color,
                              onChanged: (value){
                                setState(() {
                                  isSwitchConnection=value;
                                  updateNotification();
                                });
                              })
                        ],
                      ),
                      const SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Utils.mediumHeadingNormalText(text:UtilStrings.Post_Likes_Comments,textSize: 14),
                          Utils.switchButton(value: isSwitchPostLikeComments,
                              activeTrackColor: AppColor.switch_color, inactiveTrackColor:
                              AppColor.grey, inactiveThumbColor: AppColor.white, activeColor: AppColor.switch_color,
                              onChanged: (value){
                                setState(() {
                                  isSwitchPostLikeComments=value;
                                  updateNotification();
                                });
                              })
                        ],
                      ),

                      const SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Utils.mediumHeadingNormalText(text:UtilStrings.Messages,textSize: 14),
                          Utils.switchButton(value: isSwitchMessage,
                              activeTrackColor: AppColor.switch_color, inactiveTrackColor:
                              AppColor.grey, inactiveThumbColor: AppColor.white, activeColor: AppColor.switch_color,
                              onChanged: (value){
                                setState(() {
                                  isSwitchMessage=value;
                                  updateNotification();
                                });
                              })
                        ],
                      ),
                      const SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Utils.mediumHeadingNormalText(text:UtilStrings.Events,textSize: 14),
                          Utils.switchButton(value: isSwitchEvents,
                              activeTrackColor: AppColor.switch_color, inactiveTrackColor:
                              AppColor.grey, inactiveThumbColor: AppColor.white, activeColor: AppColor.switch_color,
                              onChanged: (value){
                            setState(() {
                              isSwitchEvents=value;
                              updateNotification();
                            });
                              })
                        ],
                      ),
                      const SizedBox(height: 18,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Utils.progressDialog(context, isLoading)
        ],
      ),
    );
  }

  @override
  onError(String msg, int status) {
    if (status == 401) {
      Utils.sessionExpire(context);
    }
    setState(() {
      isLoading = false;
    });
    CustomSnackBar.showSuccessSnackBar(context, message: msg.toString());
  }


  @override
  onSuccessRespnse(GetNotificationResponse response) {
    if(response.status==200){
      setState(() {
        pauseAll=response.data!.pauseAll!;
        isSwitchGroups=response.data!.groups!;
        isSwitchConnection=response.data!.post!;
        isSwitchPostLikeComments=response.data!.comments!;
        isSwitchMessage=response.data!.message!;
        isSwitchEvents=response.data!.events!;
        isLoading=false;
      });
    }
  }
  @override
  onSuccessUpdateRespnse(SuccessResponse response) {
   getNotificationPresenter!.doGetNotification();
  }
  updateNotification(){
    setState(() {
      isLoading=true;
    });
    getNotificationPresenter!.doUpdateNotification(pauseAll, isSwitchGroups, isSwitchConnection, isSwitchPostLikeComments, isSwitchMessage, isSwitchEvents);
  }
}
