import 'package:emba/model/profile/get_profile_response.dart';
import 'package:emba/model/profile/profile_percentage_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/route/route_name.dart';
import '../../../../utils/snackbar.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/common/appbar/common_appBar.dart';
import '../../../../widget/common/common_button.dart';
import '../profile_presenter.dart';


class OtherProfileDetailScreen extends StatefulWidget {
  const OtherProfileDetailScreen({Key? key}) : super(key: key);

  @override
  _OtherProfileDetailScreenState createState() => _OtherProfileDetailScreenState();
}

class _OtherProfileDetailScreenState extends State<OtherProfileDetailScreen>
    implements ProfileInterface{
  ScrollController scrollController1=ScrollController();
  ScrollController scrollController2=ScrollController();
  ScrollController scrollController3=ScrollController();
  ScrollController scrollController4=ScrollController();
  ProfilePresenter? profilePresenter;
  var getProfileResponse;
  bool isLoading=true;
  @override
  void initState() {
    profilePresenter=ProfilePresenter(this);
    profilePresenter!.doGetProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Profile_Details,action:true,onTap: (){
          bottomSheet();
        },),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController1,
            child: SizedBox(width:size.width,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 70,width: 70,
                          decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Utils.image(image: "demo_image.png",fit: BoxFit.cover)),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.PostScreen);
                          },
                          child: Column(children: [
                            Utils.mediumHeadingNormalText(text:"100+",textSize: 14,fontWeight: FontWeight.w700),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Posts,textSize: 12,color: AppColor.grey,fontWeight: FontWeight.w500),
                          ],),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top:8),
                          child: SizedBox(height:24,
                            child: VerticalDivider(
                              color: AppColor.grey,),),
                        ),      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.OtherGroupScreen);
                          },
                          child: Column(children: [
                            Utils.mediumHeadingNormalText(text:"20+",textSize: 14,fontWeight: FontWeight.w700),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Groups,textSize: 12,color: AppColor.grey,fontWeight: FontWeight.w500),
                          ],),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: SizedBox(height:24,
                            child: VerticalDivider(
                              color: AppColor.grey,),),
                        ),     GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.JobScreen);
                          },
                          child: Column(children: [
                            Utils.mediumHeadingNormalText(text:"12",textSize: 14,fontWeight: FontWeight.w700),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Jobs_posted,textSize: 12,color: AppColor.grey,fontWeight: FontWeight.w500),
                          ],),
                        ),
                      ],
                    ),
                    Utils.mediumHeadingNormalText(text:"Naman Rastogi",
                        textSize: 14,color: AppColor.black,fontWeight: FontWeight.w700),
                    SizedBox(height:16,),
                    Row(
                      children: [
                        Container(height: 25,width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.grey2)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Utils.image(image: "expert.png",height: 14,width: 14),
                              const SizedBox(width:8,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Financial_Expert,textSize:10)
                            ],),
                        ),
                        const SizedBox(width:4,),
                        Container(height: 25,width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.grey2)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Utils.image(image: "leader.png",height: 14,width: 14),
                              const SizedBox(width:8,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Community_Leader,textSize: 10)
                            ],),
                        ),
                      ],),
                    const SizedBox(height:12,),
                    Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",textSize:12,fontWeight: FontWeight.w500),
                    const SizedBox(height:10,),
                    Utils.mediumHeadingNormalText(text:UtilStrings.PROFILE_TITLE,textSize: 11,fontWeight: FontWeight.w500,
                        color: AppColor.grey,textAlign: TextAlign.start),
                    const SizedBox(height:14,),
                    Container(width: size.width,height:50,
                      decoration:BoxDecoration(
                          color: AppColor.profile_grey,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:8,right:8),
                        child: Row(children:[
                          ImageStack(
                            imageList: Constants.imageStackList,
                            totalCount: Constants.imageStackList.length ,
                            imageRadius:20,
                            imageCount: 3,
                            imageBorderWidth:0,
                          ),
                          const SizedBox(width:8,),
                          Expanded(
                            child: Container(
                              child: Utils.mediumHeadingNormalText(text:UtilStrings.IMAGE_STACK_TITLE,textSize: 11,fontWeight: FontWeight.w500,
                                  color: AppColor.grey,textAlign: TextAlign.start),
                            ),
                          ),
                          const SizedBox(width:30,),
                          GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, RouteName.OtherConnectionScreen);
                              },
                              child: const Icon(Icons.arrow_forward_ios,size:18,))
                        ],),
                      ),
                    ),
                    const SizedBox(height:20,),
                    Utils.customDivider(),
                    const SizedBox(height:10,),
                    Utils.mediumHeadingNormalText(text:UtilStrings.You_both_attended,textSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,textAlign: TextAlign.start),
                    const SizedBox(height:10,),
                    Container(
                      height: 50,
                      width: size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CommonButton(
                            width: 100,
                            text:UtilStrings.Connect,onTap: (){
                          },),
                          Utils.borderButton(UtilStrings.Message, AppColor.appGreen, AppColor.appGreen, 100, 45),
                          Utils.borderButton(UtilStrings.Schedule_a_meet, AppColor.grey, AppColor.grey, 110, 45),
                        ],
                      ),
                    ),
                    const SizedBox(height:10,),
                    Row(
                      children: [
                        Utils.mediumHeadingNormalText(text:UtilStrings.Similarities ,textSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,textAlign: TextAlign.start),
                        SizedBox(width: 10,),
                        Utils.image(image: "ic_similarities.png",height: 14,width: 14),
                        SizedBox(width: 4,),
                        Utils.mediumHeadingNormalText(text:"4",textSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.appGreen,textAlign: TextAlign.start),
                        Spacer(),
                        Utils.mediumHeadingNormalText(text:UtilStrings.View_All,textSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,textAlign: TextAlign.start),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RouteName.SimilariteisScreen);
                            },
                            child: Icon(Icons.arrow_forward,color: AppColor.grey,)),
                      ],
                    ),
                    const SizedBox(height:10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColor.grey.withOpacity(0.6)
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.mediumHeadingNormalText(text:"You both studied in MIT ",textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.black,textAlign: TextAlign.start),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height:10,),
                    Utils.customDivider(),
                    const SizedBox(height:10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColor.grey.withOpacity(0.6)
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: size.width/1.5,
                              child: Utils.mediumHeadingNormalText(text:"You both attended Private Equity - Understanding the landscape with Sanjeev Malik",textSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height:10,),
                    Utils.customDivider(),
                    const SizedBox(height:10,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Utils.mediumHeadingNormalText(text:UtilStrings.Organizational_Details,textSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,textAlign: TextAlign.start),
                        Spacer(),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.OtherOrganizationScreen);
                          },
                          child: Row(
                            children: [
                              Utils.mediumHeadingNormalText(text:UtilStrings.Show_all,textSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey,textAlign: TextAlign.start),
                              Icon(Icons.arrow_forward,color: AppColor.grey,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: size.height/8,
                      width: size.width,
                      child: ListView.builder(
                          controller: scrollController2,
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (BuildContext context,int index){
                            return    Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColor.grey
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Utils.mediumHeadingNormalText(text:"Job title",textSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black,textAlign: TextAlign.start),
                                    Row(
                                      children: [
                                        Utils.mediumHeadingNormalText(text:"Company name",textSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.grey,textAlign: TextAlign.start),
                                        const SizedBox(width: 10,),
                                        Container(
                                          height: 6,
                                          width: 6,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: AppColor.grey.withOpacity(0.6)
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Utils.mediumHeadingNormalText(text:"Industry",textSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.grey,textAlign: TextAlign.start),
                                      ],
                                    ),
                                    Utils.mediumHeadingNormalText(text:"Job Level",textSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.grey,textAlign: TextAlign.start),
                                    Utils.mediumHeadingNormalText(text:"Job Function",textSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.grey,textAlign: TextAlign.start),
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),

                  ],),
              ),
            ),
          ),
          Utils.progressDialog(context, isLoading)
        ],
      ),
    );
  }

  bottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height: 230,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
            const SizedBox(height: 20,),
            Row(children: [
              Utils.image(image: "share_profile.png",height: 18),
              const SizedBox(width: 16,),
              Utils.mediumHeadingNormalText(text: UtilStrings.Share_profile_via_message,
                  color: AppColor.grey,fontWeight: FontWeight.w500)
            ],),
            const SizedBox(height: 20,),
            Row(children: [
              Utils.image(image: "share_profile_icon.png",height: 18),
              const SizedBox(width: 16,),
              Utils.mediumHeadingNormalText(text: UtilStrings.Share_profile_via_message,
                  color: AppColor.grey,fontWeight: FontWeight.w500),
            ],),
            const SizedBox(height: 20,),
            Row(children: [
              Utils.image(image: "ic_report.png",height: 18),
              const SizedBox(width: 16,),
              Utils.mediumHeadingNormalText(text: UtilStrings.Report,
                  color: AppColor.grey,fontWeight: FontWeight.w500),
            ],),
            const SizedBox(height: 20,),
            Row(children: [
              Utils.image(image: "ic_block.png",height: 18),
              const SizedBox(width: 16,),
              Utils.mediumHeadingNormalText(text: UtilStrings.Block,
                  color: AppColor.grey,fontWeight: FontWeight.w500),
            ],),
          ],),
        ),
      );
    });
  }

  @override
  onError(String msg, int status) {
    if (status == 401) {
      Utils.sessionExpire(context);
    }
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showSuccessSnackBar(context, message: msg.toString());
  }

  @override
  onProfileRespnse(GetProfileResponse response) {
    if (response.status == 200) {
      setState(() {
        getProfileResponse=response.data!;
        isLoading=false;
      });
      CustomSnackBar.showSuccessSnackBar(context,
          message: response.message.toString());
    }
  }

  @override
  onUpdateProfile(SuccessResponse response) {}

  @override
  onUploadProfile(SuccessResponse response) {}

  @override
  onProfilePercentage(GetProfilePercentage response) {

  }

}
