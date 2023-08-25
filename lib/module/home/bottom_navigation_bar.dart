import 'dart:io';

import 'package:emba/model/sucess_response.dart';
import 'package:emba/utils/sharedpref/preferences.dart';
import 'package:emba/utils/sharedpref/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/snackbar.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/home_app_bar.dart';
import '../groups/groups_screen.dart';
import '../jobs/job_main.dart';
import '../login/login_screen.dart';
import '../network/network_main_screen.dart';
import 'home_screen.dart';
import 'interface/logout_presenter.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreen();
}

class _BottomNavigationBarScreen extends State<BottomNavigationBarScreen>implements LogoutInterface {
  int pageIndex = 0;
  bool isLoading =false;
  List <Widget> item= [
    const HomeScreen(),
    const GroupsScreen(),
    Container(color: Colors.grey,),
    const NetworkMainScreen(),
    const JobViewScreen(),
  ];
  LogoutPresenter ? logoutPresenter;
  @override
  void initState() {
   logoutPresenter=LogoutPresenter(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
        if(Platform.isAndroid){
          SystemNavigator.pop();
        }
        return true;
      },
      child: Scaffold(
        appBar:  PreferredSize(
          preferredSize:  const Size(double.infinity, kToolbarHeight),
          child:AppBarHomeScreen(image: "demo_image.png",),
        ),
        endDrawer: Drawer(
            elevation: 16.0,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Container(height: 70,width: 70,
                          decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Utils.image(image: "demo_image.png",fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left:16),
                        child: Utils.mediumHeadingNormalText(text:SessionManager.getString(Preferences.USER_NAME),color: AppColor.black,fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RouteName.ViewProfileScreen);
                            },
                            child: Utils.mediumHeadingNormalText(text:UtilStrings.View_Profile,color: AppColor.black,textSize: 12,underline: true)),
                      ),
                      const SizedBox(height: 24,),
                      Utils.customDivider(),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 12,bottom: 14),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.LeaderBoardScreen);
                          },
                          child: Row(
                            children: [
                              Utils.image(image: "cup_icon.png",height: 18),
                              const SizedBox(width: 10,),
                              Utils.mediumHeadingNormalText(text:UtilStrings.Leaderboard,color:AppColor.grey,textSize: 14),
                              const Spacer(),
                              const Icon(Icons.arrow_forward,size: 18,color: AppColor.grey,)
                            ],
                          ),
                        ),
                      ),
                      Utils.customDivider(),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 12,bottom: 14),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.ResourcesScreen);
                          },
                          child: Row(
                            children: [
                              Utils.image(image: "resources_icon.png",height: 18),
                              const SizedBox(width: 10,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Resources,color:AppColor.grey,textSize: 14),
                              const Spacer(),
                              const Icon(Icons.arrow_forward,size: 18,color: AppColor.grey,)
                            ],
                          ),
                        ),
                      ),
                      Utils.customDivider(),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                        Navigator.pushNamed(context, RouteName.setting);
                      },
                        child: Padding(
                          padding: const EdgeInsets.only(left:20,right: 20,top: 12,bottom: 14),
                          child: Row(
                            children: [
                              Utils.image(image: "seeting_icon.png",height: 18),
                              const SizedBox(width: 10,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Settings,color:AppColor.grey,textSize: 14),
                              const Spacer(),
                              const Icon(Icons.arrow_forward,size: 18,color: AppColor.grey,)
                            ],
                          ),
                        ),
                      ),
                      Utils.customDivider(),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, RouteName.NotificationSettingScreen);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left:20,right: 20,top: 12,bottom: 14),
                          child: Row(
                            children: [
                              Utils.image(image: "notification_icon.png",height: 18),
                              const SizedBox(width: 10,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Notification_Settings,color:AppColor.grey,textSize: 14),
                              const Spacer(),
                              const Icon(Icons.arrow_forward,size: 18,color: AppColor.grey,)
                            ],
                          ),
                        ),
                      ),
                      Utils.customDivider(),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 12,bottom: 14),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.ScheduledScreen);
                          },
                          child: Row(
                            children: [
                              Utils.image(image: "schedule_icon.png",height: 18),
                              const SizedBox(width: 10,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Scheduled_Meetings,color:AppColor.grey,textSize: 14),
                              const Spacer(),
                              const Icon(Icons.arrow_forward,size: 18,color: AppColor.grey,)
                            ],
                          ),
                        ),
                      ),
                      Utils.customDivider(),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 12,bottom: 14),
                        child: Row(
                          children: [
                            Utils.mediumHeadingNormalText(text: UtilStrings.Resume_Analysis_Tool,color:AppColor.appGreen,textSize: 14),
                            const Spacer(),
                            Utils.image(image: "resume_icon.png",height: 18),
                          ],
                        ),
                      ),
                      Utils.customDivider(),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 12,bottom: 14),
                        child: Row(
                          children: [

                            Utils.mediumHeadingNormalText(text: UtilStrings.Salary_Analysis_Tool,color:AppColor.appGreen,textSize: 14),
                            const Spacer(),
                            Utils.image(image: "resume_icon.png",height: 18),
                          ],
                        ),
                      ),
                      Utils.customDivider(),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 12,bottom: 14),
                        child: GestureDetector(
                          onTap: (){
                            popDialog();
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:6),
                                child: Utils.image(image: "logout_icon.png",height: 18,width:18),
                              ),
                              const SizedBox(width: 16,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Log_Out,color:AppColor.red,textSize: 14),
                            ],
                          ),
                        ),
                      ),
                      Utils.customDivider(),
                      const SizedBox(height: 26,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height:75,width:200,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffD9D9D9),
                            ),
                            child: Center(child: Utils.mediumHeadingNormalText(text:UtilStrings.Banner,fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      const SizedBox(height:20,),
                    ],),
                  Utils.progressDialog(context, isLoading)
                  ],
              ),
            )
        ),
          bottomNavigationBar: Container(
            width:size.width,
            height: 65,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(28),topRight: Radius.circular(28)),
              border: Border.all(color:Colors.white),
              boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0,0.10),blurRadius:14)]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:20,right: 20,bottom:6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      pageIndex=0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Utils.image(image: "home_icon.png",height:18,color: pageIndex==0?AppColor.appGreen:AppColor.grey),
                    Utils.mediumHeadingNormalText(text: UtilStrings.Home,textSize: 10,color: pageIndex==0?AppColor.black:AppColor.grey,
                        fontWeight: FontWeight.w700)
                  ],),
                ),GestureDetector(
                    onTap: (){
                      setState(() {
                        pageIndex=1;
                      });
                    },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Utils.image(image: "group_icon.png",height:20,color: pageIndex==1?AppColor.appGreen:AppColor.grey),
                        Utils.mediumHeadingNormalText(text: UtilStrings.Groups,textSize: 10,color: pageIndex==1?AppColor.black:AppColor.grey,
                        fontWeight: FontWeight.w700
                        )

                      ],),
                ),GestureDetector(
                    onTap: (){
                      setState(() {
                        pageIndex=2;
                      });
                    },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Utils.image(image: "icon_post.png",height:18,color: pageIndex==2?AppColor.appGreen:AppColor.grey),
                        Utils.mediumHeadingNormalText(text: UtilStrings.Post,textSize: 10,color: pageIndex==2?AppColor.black:AppColor.grey,
                            fontWeight: FontWeight.w700)

                      ],),
                ),GestureDetector(
                    onTap: (){
                      setState(() {
                        pageIndex=3;
                      });
                    },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Utils.image(image: "export_icon.png",height:18,color: pageIndex==3?AppColor.appGreen:AppColor.grey),
                        Utils.mediumHeadingNormalText(text: UtilStrings.Network,textSize: 10,color: pageIndex==3?AppColor.black:AppColor.grey,
                            fontWeight: FontWeight.w700)

                      ],),
                ),GestureDetector(
                    onTap: (){
                      setState(() {
                        pageIndex=4;
                      });
                    },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Utils.image(image: "jobs_icon.png",height:18,color: pageIndex==4?AppColor.appGreen:AppColor.grey),
                        Utils.mediumHeadingNormalText(text: UtilStrings.Jobs,textSize: 10,color: pageIndex==4?AppColor.black:AppColor.grey,
                            fontWeight: FontWeight.w700)
                      ],),
                ),
              ],),
            ),
          ),
          body: item[pageIndex],

      ),
    );
  }
  popDialog(){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Stack(
          children: [
            Column(children: [
              Utils.image(image: "logout_icon.png",height: 24,width: 24),
              const SizedBox(height: 20,),
              Utils.mediumHeadingNormalText(text:UtilStrings.Are_you_sure_you_want_to_logout,
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
                      logoutPresenter!.doLogout();
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
            Utils.progressDialog(context, isLoading)
          ],
        ),
      );
    });
  }

  @override
  onError(String msg, int status) {
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showErrorSnackBar(context, message: msg);
    if(status==401){
      Utils.sessionExpire(context);
    }
  }

  @override
  onSuccessRespnse(SuccessResponse response) {
    if(response.status==200){
      CustomSnackBar.showSuccessSnackBar(context, message: response.message);
      Utils.sessionExpire(context);
    }
  }
}
