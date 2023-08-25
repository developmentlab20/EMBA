import 'package:emba/model/profile/get_profile_response.dart';
import 'package:emba/model/profile/profile_percentage_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/module/home/profile/my_profile/manage_profile_detail/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_stack/image_stack.dart';
import 'package:need_resume/need_resume.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/route/route_name.dart';
import '../../../../../utils/snackbar.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../profile_presenter.dart';
import 'add_edit_job_screen.dart';
import 'edit_education.dart';
import 'edit_linked_in_screen.dart';
import 'edit_netwok_detail_screen.dart';

class ManageProfileDetailScreen extends StatefulWidget {
  const ManageProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ManageProfileDetailScreen> createState() => _ManageProfileDetailScreenState();
}

class _ManageProfileDetailScreenState extends ResumableState<ManageProfileDetailScreen>implements ProfileInterface {
  ScrollController scrollController1=ScrollController();
  ScrollController scrollController2=ScrollController();
  ScrollController scrollController3=ScrollController();
  ScrollController scrollController4=ScrollController();
  ProfilePresenter? profilePresenter;
  ProfileData getProfileResponse = ProfileData();
  bool isLoading = true;
  @override
  void initState() {
    profilePresenter = ProfilePresenter(this);
    profilePresenter!.doGetProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.My_Profile,action: true,onTap: (){
          bottomSheet();
        },),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController1,
            child: getProfileResponse==null?Container():SizedBox(width:size.width,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right:20),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height:16,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height:70,width:70,
                          decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius:BorderRadius.circular(50)
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
                            Utils.mediumHeadingNormalText(text:getProfileResponse.totalPosts!=null?getProfileResponse.totalPosts.toString():"",textSize: 14,fontWeight: FontWeight.w700),
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
                            Navigator.pushNamed(context, RouteName.JionedGroupScreen);
                          },
                          child: Column(children: [
                            Utils.mediumHeadingNormalText(text:getProfileResponse.totalGroups!=null?getProfileResponse.totalGroups.toString():"",textSize: 14,fontWeight: FontWeight.w700),
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
                            Utils.mediumHeadingNormalText(text:getProfileResponse.totalPosts!=null?getProfileResponse.totalPosts.toString():"",textSize: 14,fontWeight: FontWeight.w700),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Jobs_posted,textSize: 12,color: AppColor.grey,fontWeight: FontWeight.w500),
                          ],),
                        ),
                      ],
                    ),
                    Utils.mediumHeadingNormalText(text:getProfileResponse.fullname,
                        textSize: 14,color: AppColor.black,fontWeight: FontWeight.w700),
                    const SizedBox(height:16,),
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
                              const SizedBox(width: 8,),
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
                              const SizedBox(width: 8,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Community_Leader,textSize: 10)
                            ],),
                        ),
                      ],),
                    const SizedBox(height:12,),
                    Utils.mediumHeadingNormalText(text:getProfileResponse.role!=null?getProfileResponse.role:"N/A",textSize:12,fontWeight: FontWeight.w500),
                    const SizedBox(height:10,),
                    Utils.mediumHeadingNormalText(text:getProfileResponse.description!=null?
                    getProfileResponse.description
                        :"N/A",textSize: 11,fontWeight: FontWeight.w500,
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
                          const Icon(Icons.arrow_forward_ios,size:18,)
                        ],),
                      ),
                    ),
                    const SizedBox(height:20,),
                    GestureDetector(
                        onTap: (){
                          push(context, MaterialPageRoute(builder: (context)=>
                              EditProfileScreen(
                                email:getProfileResponse.email,
                                name:getProfileResponse.fullname,des:getProfileResponse.description!=null?
                              getProfileResponse.description:"",)));
                        },
                        child: Utils.borderButton(UtilStrings.Edit_Profile_Details,
                            AppColor.appGreen, AppColor.appGreen, size.width,40)),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Utils.mediumHeadingNormalText(text:UtilStrings.Organizational_Details,textSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,textAlign: TextAlign.start),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.OrganizationDetailScreen);
                          },
                          child: Utils.mediumHeadingNormalText(text:UtilStrings.Show_all,textSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,textAlign: TextAlign.start),
                        ),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RouteName.OrganizationDetailScreen);
                            },
                            child: const Icon(Icons.arrow_forward,color: AppColor.grey,)),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: size.width/1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColor.white_light
                            ),
                          ),
                          const SizedBox(width: 10,),
                          orga.isNotEmpty
                              ?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Utils.mediumHeadingNormalText(text:getProfileResponse.organizationDetails!=null||
                                  getProfileResponse.organizationDetails!.length>0
                                  ?
                              getProfileResponse.organizationDetails![0].jobTitle:"N/A",
                                  textSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,textAlign: TextAlign.start),
                              const SizedBox(height:2,),
                              Row(
                                children: [
                                  Utils.mediumHeadingNormalText(text:getProfileResponse.organizationDetails!=null||
                                      getProfileResponse.organizationDetails!.isNotEmpty?
                                  getProfileResponse.organizationDetails![0].companyName.toString():"N/A",textSize: 12,
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
                                  Utils.mediumHeadingNormalText(text:getProfileResponse.organizationDetails!=null||
                                      getProfileResponse.organizationDetails!.isNotEmpty?
                                  getProfileResponse.organizationDetails![0].industry.toString():"N/A",textSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grey,textAlign: TextAlign.start),
                                ],
                              ),
                              const SizedBox(height:2,),
                              Utils.mediumHeadingNormalText(text:getProfileResponse.organizationDetails!=null||
                                  getProfileResponse.organizationDetails!.isNotEmpty?
                              getProfileResponse.organizationDetails![0].jobLevel.toString():"N/A",textSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey,textAlign: TextAlign.start),
                              const SizedBox(height:2,),
                              Utils.mediumHeadingNormalText(text:getProfileResponse.organizationDetails!=null||
                                  getProfileResponse.organizationDetails!.isNotEmpty?
                              getProfileResponse.organizationDetails![0].jobFunction.toString():"N/A",textSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey,textAlign: TextAlign.start),
                            ],
                          ):Padding(
                            padding: const EdgeInsets.only(top:14),
                            child: Utils.mediumHeadingNormalText(text: "N/A"),
                          ),
                          const Spacer(),
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: (){
                                if(getProfileResponse.organizationDetails==null||
                                    getProfileResponse.organizationDetails!.isEmpty){
                                  push(context, MaterialPageRoute(builder: (context)=>AddEditJobScreen(type: 2,
                                  )));
                                }else{
                                  push(context, MaterialPageRoute(builder: (context)=>AddEditJobScreen(type: 1,
                                    jobTitle:getProfileResponse.organizationDetails![0].jobTitle.toString(),
                                    companyName: getProfileResponse.organizationDetails![0].companyName.toString(),
                                    jobLevel: getProfileResponse.organizationDetails![0].jobLevel.toString(),
                                    industry: getProfileResponse.organizationDetails![0].industry.toString(),
                                    jobFunction: getProfileResponse.organizationDetails![0].jobFunction.toString(),
                                  )));
                                }
                              },
                              child: Utils.image(image: "icon_edit.png",height: 14,width: 14)),
                          SizedBox(width: 16,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    const Divider(thickness: 1,),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            push(context, MaterialPageRoute(builder: (context)=>AddEditJobScreen(type: 0)));
                          },
                          child: Utils.mediumHeadingNormalText(text:UtilStrings.Add_Organizational_Details,
                              textSize: 14,fontWeight: FontWeight.w500,
                              color: AppColor.appGreen,textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    const Divider(thickness: 1,),
                    const SizedBox(height: 20,),
                    Utils.mediumHeadingNormalText(text:UtilStrings.Education,textSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,textAlign: TextAlign.start),
                    const SizedBox(height: 20,),
                    Container(
                      width: size.width/1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColor.white_light
                            ),
                          ),
                          const SizedBox(width: 10,),
                          getProfileResponse.educationDetails!=null?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Utils.mediumHeadingNormalText(text:getProfileResponse.educationDetails!=null?
                              getProfileResponse.educationDetails!.collegeName:"",
                                  textSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,textAlign: TextAlign.start),
                              const SizedBox(height:2,),
                              Utils.mediumHeadingNormalText(text:getProfileResponse.educationDetails!=null?
                              getProfileResponse.educationDetails!.schoolName:"",textSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey,textAlign: TextAlign.start),
                              const SizedBox(height:4,),
                              Row(
                                children: [
                                  Utils.mediumHeadingNormalText(text:getProfileResponse.educationDetails!=null?
                                  getProfileResponse.educationDetails!.program:"",textSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grey,textAlign: TextAlign.start),
                                  const SizedBox(width: 10,),
                                  /*     Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColor.grey.withOpacity(0.6)
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Utils.mediumHeadingNormalText(text:"Field of study",textSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grey,textAlign: TextAlign.start),*/
                                ],
                              ),
                              const SizedBox(height:2,),
                              Utils.mediumHeadingNormalText(text:getProfileResponse.educationDetails!=null?
                              getProfileResponse.educationDetails!.graduationYear:"",textSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey,textAlign:TextAlign.start),
                            ],
                          ):Padding(
                            padding: const EdgeInsets.only(top:14),
                            child: Utils.mediumHeadingNormalText(text: "N/A"),
                          ),
                          const Spacer(),
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: (){
                                if(getProfileResponse.educationDetails==null || getProfileResponse.educationDetails!.schoolName=="" || getProfileResponse.educationDetails!.collegeName=="" || getProfileResponse.educationDetails!.program==""){
                                  push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          EditEducationScreen(type: 0,)));
                                }else {
                                  push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          EditEducationScreen(
                                            school: getProfileResponse
                                                .educationDetails!.schoolName,
                                            qualification: getProfileResponse
                                                .educationDetails!.collegeName,
                                            specification: getProfileResponse
                                                .educationDetails!.graduationYear,
                                            program: getProfileResponse
                                                .educationDetails!.program,type: 1,
                                          )));
                                }
                              },
                              child: Utils.image(image: "icon_edit.png",height: 14,width: 14)),
                          SizedBox(width: 16,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    const Divider(thickness: 1,),
                    const SizedBox(height: 20,),
                    Utils.mediumHeadingNormalText(text:UtilStrings.Network_Details,textSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,textAlign: TextAlign.start),
                    const SizedBox(height: 20,),
                    /* Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.white_light,
                        ),
                        child: Center(child: Utils.image(image:"search.png",height: 14,width: 14)),
                      ),
                      const SizedBox(width: 12,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width/1.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Utils.mediumHeadingNormalText(text:getProfileResponse.networkingDetails!=null?
                                getProfileResponse.networkingDetails!.lookingFor.toString():"",
                                    textSize: 14,color: Colors.black),
                                const Spacer(),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, RouteName.EditNetworkScreen);
                                    },
                                    child: Utils.image(image: "icon_edit.png",height: 14,width: 14))
                              ],
                            ),
                          ),
                          const SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(height: 25,width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColor.grey2)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Utils.mediumHeadingNormalText(text: "Mentor",textSize:10)
                                  ],),
                              ),
                              const SizedBox(width: 10,),
                              Container(height: 25,width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColor.grey2)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Utils.mediumHeadingNormalText(text: "Architecture",textSize:10)
                                  ],),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  const Divider(thickness: 1,),
                  const SizedBox(height: 12,),*/
                    getProfileResponse.networkingDetails!.lookingFor.toString().isNotEmpty?
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColor.white_light,
                              ),
                              child: Center(child: Utils.image(image:"interest.png",height: 14,width: 14)),
                            ),
                            const SizedBox(width: 12,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width/1.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Utils.mediumHeadingNormalText(text:getProfileResponse.networkingDetails!=null?
                                      getProfileResponse.networkingDetails!.lookingFor.toString():"",
                                          textSize: 14,color: Colors.black),
                                      const Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            push(context, MaterialPageRoute(builder: (context)=>EditNetworkScreen(
                                              lookingFor:getProfileResponse.networkingDetails!.lookingFor.toString(),
                                              helpOther: getProfileResponse.networkingDetails!.helpOther.toString(),
                                              experience: getProfileResponse.networkingDetails!.additionalExperience!.isNotEmpty?getProfileResponse.networkingDetails!.additionalExperience![0].toString():"",
                                              skills: getProfileResponse.networkingDetails!.additionalSkills!.isNotEmpty?getProfileResponse.networkingDetails!.additionalSkills![0].toString():"",
                                              type: 1,
                                            )));
                                          },
                                          child: Utils.image(image: "icon_edit.png",height: 14,width: 14))
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 25,width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Mentor",textSize:10)
                                        ],),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(height: 25,width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Architecture",textSize:10)
                                        ],),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12,),
                        const Divider(thickness: 1,),
                        const SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColor.white_light,
                              ),
                              child: Center(child: Utils.image(image:"help.png",height: 14,width: 14)),
                            ),
                            const SizedBox(width: 12,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width/1.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Utils.mediumHeadingNormalText(text:getProfileResponse.networkingDetails!=null?
                                      getProfileResponse.networkingDetails!.helpOther.toString():"",
                                          textSize: 14,color: Colors.black),
                                      const Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            push(context, MaterialPageRoute(builder: (context)=>EditNetworkScreen(
                                              lookingFor:getProfileResponse.networkingDetails!.lookingFor.toString(),
                                              helpOther: getProfileResponse.networkingDetails!.helpOther.toString(),
                                              experience: getProfileResponse.networkingDetails!.additionalExperience!.isNotEmpty?getProfileResponse.networkingDetails!.additionalExperience![0].toString():"",
                                              skills: getProfileResponse.networkingDetails!.additionalSkills!.isNotEmpty?getProfileResponse.networkingDetails!.additionalSkills![0].toString():"",
                                              type: 1,
                                            )));
                                          },
                                          child: Utils.image(image: "icon_edit.png",height: 14,width: 14))
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 25,width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Mentor",textSize:10)
                                        ],),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(height: 25,width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Architecture",textSize:10)
                                        ],),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12,),
                        const Divider(thickness: 1,),
                        const SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColor.white_light,
                              ),
                              child: Center(child: Utils.image(image:"experience.png",height: 14,width: 14)),
                            ),
                            const SizedBox(width: 12,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width/1.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Utils.mediumHeadingNormalText(text:getProfileResponse.networkingDetails!=null?
                                      getProfileResponse.networkingDetails!.additionalExperience!.isNotEmpty?getProfileResponse.networkingDetails!.additionalExperience![0].toString():"":"",
                                          textSize: 14,color: Colors.black),
                                      const Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            push(context, MaterialPageRoute(builder: (context)=>EditNetworkScreen(
                                              lookingFor:getProfileResponse.networkingDetails!.lookingFor.toString(),
                                              helpOther: getProfileResponse.networkingDetails!.helpOther.toString(),
                                              experience: getProfileResponse.networkingDetails!.additionalExperience!.isNotEmpty?getProfileResponse.networkingDetails!.additionalExperience![0].toString():"",
                                              skills: getProfileResponse.networkingDetails!.additionalSkills!.isNotEmpty?getProfileResponse.networkingDetails!.additionalSkills![0].toString():"",
                                              type: 1,
                                            )));
                                          },
                                          child: Utils.image(image: "icon_edit.png",height: 14,width: 14))
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 25,width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Mentor",textSize:10)
                                        ],),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(height: 25,width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Architecture",textSize:10)
                                        ],),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12,),
                        const Divider(thickness: 1,),
                        const SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColor.white_light,
                              ),
                              child: Center(child: Utils.image(image:"ic_skill.png",height: 14,width: 14)),
                            ),
                            const SizedBox(width: 12,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width/1.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Utils.mediumHeadingNormalText(text:getProfileResponse.networkingDetails!=null?
                                      getProfileResponse.networkingDetails!.additionalSkills!.isNotEmpty?getProfileResponse.networkingDetails!.additionalSkills![0].toString():"":"",
                                          textSize: 14,color: Colors.black),
                                      const Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            push(context, MaterialPageRoute(builder: (context)=>EditNetworkScreen(
                                              lookingFor:getProfileResponse.networkingDetails!.lookingFor.toString(),
                                              helpOther: getProfileResponse.networkingDetails!.helpOther.toString(),
                                              experience: getProfileResponse.networkingDetails!.additionalExperience!.isNotEmpty?getProfileResponse.networkingDetails!.additionalExperience![0].toString():"",
                                              skills: getProfileResponse.networkingDetails!.additionalSkills!.isNotEmpty?getProfileResponse.networkingDetails!.additionalSkills![0].toString():"",
                                              type: 1,
                                            )));
                                          },
                                          child: Utils.image(image: "icon_edit.png",height: 14,width: 14))
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 25,width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Mentor",textSize:10)
                                        ],),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(height: 25,width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Architecture",textSize:10)
                                        ],),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ):
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.white_light,
                          ),
                          child: Center(child: Utils.image(image:"interest.png",height: 14,width: 14)),
                        ),
                        const SizedBox(width: 12,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width/1.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:14),
                                    child: Utils.mediumHeadingNormalText(text:"N/A",
                                        textSize: 14,color: Colors.black),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: (){
                                        push(context, MaterialPageRoute(builder: (context)=>EditNetworkScreen()));
                                      },
                                      child: Utils.image(image: "icon_edit.png",height: 14,width: 14))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    const Divider(thickness: 1,),
                    const SizedBox(height: 12,),
                    Utils.mediumHeadingNormalText(text:UtilStrings.LinkedIn_Details,textSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,textAlign: TextAlign.start),

                    const SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                          width: size.width,
                          child: Row(
                            children: [
                              Utils.image(image: "ic_linkdin_4x.png",height: 40,width:40),
                              SizedBox(width: 16,),
                              Utils.mediumHeadingNormalText(text:UtilStrings.LinkedIn_Details,textSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black,textAlign: TextAlign.start),
                              Spacer(),
                              GestureDetector(
                                  onTap: (){
                                    push(context, MaterialPageRoute(builder: (context)=>EditLinkedInScreen(
                                      url: getProfileResponse.linkedInUrl.toString(),
                                    )));
                                  },
                                  child: Utils.image(image: "icon_edit.png",height: 14,width: 14))
                            ],
                          )),
                    ),
                    const SizedBox(height: 20,),
                  ],),
              ),
            ),
          ),
          Utils.progressDialog(context, isLoading),
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
      return SizedBox(height: 150,
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
      isLoading = false;
    });
    CustomSnackBar.showSuccessSnackBar(context, message: msg.toString());
  }

  List <OrganizationDetails> orga=[];
  @override
  onProfileRespnse(GetProfileResponse response) {
    if (response.status == 200) {
      setState(() {
        getProfileResponse = response.data!;
        for(int i=0;i<response.data!.organizationDetails!.length;i++){
          OrganizationDetails organizationDetails =OrganizationDetails(
            jobTitle: response.data!.organizationDetails![0].jobTitle,
            jobFunction: response.data!.organizationDetails![0].jobFunction,
            jobLevel: response.data!.organizationDetails![0].jobLevel,
            companyName: response.data!.organizationDetails![0].companyName,
            industry: response.data!.organizationDetails![0].industry,
          );
          setState(() {
            orga.add(organizationDetails);
          });
        }
        isLoading = false;
      });
      /*CustomSnackBar.showSuccessSnackBar(context,
          message: response.message.toString());*/
    }
  }

  @override
  onUpdateProfile(SuccessResponse response) {

  }

  @override
  onUploadProfile(SuccessResponse response) {

  }
  @override
  void onResume() {
    setState(() {
      isLoading=true;
      profilePresenter!.doGetProfile();
    });
    super.onResume();
  }

  @override
  onProfilePercentage(GetProfilePercentage response) {

  }

}
