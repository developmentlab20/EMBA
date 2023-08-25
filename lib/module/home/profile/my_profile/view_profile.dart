import 'package:emba/model/profile/get_profile_response.dart';
import 'package:emba/model/profile/profile_percentage_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/route/route_name.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/common/appbar/common_appBar.dart';
import '../profile_presenter.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen>
    implements ProfileInterface {
  ProfilePresenter? profilePresenter;
  ProfileData getProfileResponse = ProfileData();
  bool isLoading = true;
  int profilePercentage=0;
  @override
  void initState() {
    profilePresenter = ProfilePresenter(this);
    profilePresenter!.doGetProfile();
    profilePresenter!.doProfilePercentage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CommonAppBar(
          title: UtilStrings.My_Profile,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            child: Container(
              color: AppColor.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: AppColor.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Utils.image(
                              image: "demo_image.png", fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Utils.mediumHeadingNormalText(
                        text: getProfileResponse.fullname,
                        fontWeight: FontWeight.w600,
                        textSize: 16,
                        color: AppColor.black),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 25,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.grey2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Utils.image(
                                  image: "expert.png", height: 14, width: 14),
                              SizedBox(width: 8),
                              Utils.mediumHeadingNormalText(
                                  text: UtilStrings.Financial_Expert,
                                  textSize: 10)
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          height: 25,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.grey2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Utils.image(
                                  image: "leader.png", height: 14, width: 14),
                              SizedBox(width: 8),
                              Utils.mediumHeadingNormalText(
                                  text: UtilStrings.Community_Leader,
                                  textSize: 10)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Utils.mediumHeadingNormalText(
                        text: getProfileResponse.role!=null?getProfileResponse.role:"N/A",
                        textSize: 12,
                        fontWeight: FontWeight.w600),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.MyConnectionScreen);
                            },
                            child: Column(
                              children: [
                                Utils.mediumHeadingNormalText(
                                    text:getProfileResponse.totalConnections!=null?getProfileResponse.totalConnections.toString():"",
                                    textSize: 14,
                                    fontWeight: FontWeight.w700),
                                Utils.mediumHeadingNormalText(
                                    text: UtilStrings.Connections,
                                    textSize: 12,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: SizedBox(
                              height: 24,
                              child: VerticalDivider(
                                color: AppColor.grey,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.PostScreen);
                            },
                            child: Column(
                              children: [
                                Utils.mediumHeadingNormalText(
                                    text:getProfileResponse.totalPosts!=null?getProfileResponse.totalPosts.toString():"",
                                    textSize: 14,
                                    fontWeight: FontWeight.w700),
                                Utils.mediumHeadingNormalText(
                                    text: UtilStrings.Post,
                                    textSize: 12,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              height: 24,
                              child: VerticalDivider(
                                color: AppColor.grey,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.JionedGroupScreen);
                            },
                            child: Column(
                              children: [
                                Utils.mediumHeadingNormalText(
                                    text:getProfileResponse.totalGroups!=null?getProfileResponse.totalGroups.toString():"",
                                    textSize: 14,
                                    fontWeight: FontWeight.w700),
                                Utils.mediumHeadingNormalText(
                                    text: UtilStrings.Groups,
                                    textSize: 12,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              height: 24,
                              child: VerticalDivider(
                                color: AppColor.grey,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pushNamed(context, RouteName.JobScreen);
                            },
                            child: Column(
                              children: [
                                Utils.mediumHeadingNormalText(
                                    text: getProfileResponse.totalJobs!=null?getProfileResponse!.totalJobs.toString():"",
                                    textSize: 14,
                                    fontWeight: FontWeight.w700),
                                Utils.mediumHeadingNormalText(
                                    text: UtilStrings.Jobs_posted,
                                    textSize: 12,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20,top: 6),
                          child: Utils.mediumHeadingNormalText(
                              text: getProfileResponse.description!=null?
                              getProfileResponse.description
                                  :"N/A",
                              textSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColor.grey,
                              textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Utils.customDivider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Utils.mediumHeadingNormalText(
                              text: UtilStrings.Profile_Complete,
                              textSize: 14,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start),
                          const Spacer(),
                          Utils.mediumHeadingNormalText(
                              text: profilePercentage.toString()+"%",
                              textSize: 14,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                              color: AppColor.appGreen),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, top: 8),
                      child: LinearPercentIndicator(
                        barRadius: const Radius.circular(8),
                        width: MediaQuery.of(context).size.width - 20,
                        animation: true,
                        lineHeight: 10,
                        animationDuration: 2000,
                        percent: 0.8,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: AppColor.appGreen,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Utils.customDivider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteName.ManageProfileDetailScreen);
                        },
                        child: Row(
                          children: [
                            Utils.image(image: "edit_icon.png", height: 14),
                            const SizedBox(
                              width: 16,
                            ),
                            Utils.mediumHeadingNormalText(
                                text: UtilStrings.Manage_Profile_Details,
                                textSize: 14,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.start),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColor.grey,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Utils.customDivider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(
                              context, RouteName.ManageContactScreen);
                        },
                        child: Row(
                          children: [
                            Utils.image(image: "phone_icon.png", height: 18),
                            const SizedBox(
                              width: 16,
                            ),
                            Utils.mediumHeadingNormalText(
                                text: UtilStrings.Manage_Contact,
                                textSize: 14,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.start),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColor.grey,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Utils.customDivider(),
                  ],
                ),
              ),
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
  onProfileRespnse(GetProfileResponse response) {
    if (response.status == 200) {
      setState(() {
        getProfileResponse = response.data!;
        isLoading = false;
      });
     /* CustomSnackBar.showSuccessSnackBar(context,
          message: response.message.toString());*/
    }
  }

  @override
  onUpdateProfile(SuccessResponse response) {}

  @override
  onUploadProfile(SuccessResponse response) {}

  @override
  onProfilePercentage(GetProfilePercentage response) {
    if(response.status==200){
      setState(() {
        profilePercentage=response.data!.profilePercentage!;
      });
    }
  }

}
