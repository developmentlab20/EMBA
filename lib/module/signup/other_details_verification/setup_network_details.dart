import 'package:emba/model/get_collage_response.dart';
import 'package:emba/model/get_program_model.dart';
import 'package:emba/model/get_school_response.dart';
import 'package:emba/model/get_skills_response.dart';
import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/utils/constants/constants.dart';
import 'package:emba/utils/route/route_name.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../widget/common/common_button.dart';
import '../../../../../widget/common/common_text_field.dart';
import '../../../model/bool_text.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/utils.dart';
import 'other_detail_presenter.dart';


class SetupNetworkScreen extends StatefulWidget {
  EducationModel? educationModel;
  OrganizationDetailsModel? organizationDetails;
  int? type;
  List <String>? industry;

  SetupNetworkScreen({Key? key,this.educationModel,this.organizationDetails,this.type,this.industry}) : super(key: key);

  @override
  _SetupNetworkScreen createState() => _SetupNetworkScreen();
}

class _SetupNetworkScreen extends State<SetupNetworkScreen> implements OtherDetailVerificationInterface{
  TextEditingController lookingForController = TextEditingController();
  TextEditingController helpController = TextEditingController();
  String industryExperienceController="";
  String skillsController="";
  OtherDetailVerificationPresenter?otherDetailVerificationPresenter;
  bool isLoading=false;
  NetworkingDetailsModel? networkingDetailsModel;
  String schoolName="";
  String collegeName="";
  String graduationYear="";
  String program="";
  String jobTitle="";
  String companyName="";
  String jobLevel="";
  String industry="";
  String jobFunction="";
  List <String> skills=[];
  @override
  void initState() {
    otherDetailVerificationPresenter=OtherDetailVerificationPresenter(this);
    isLoading=true;
    otherDetailVerificationPresenter!.doGetSkills();
    if(widget.educationModel!=null){
      schoolName=widget.educationModel!.schoolName;
      collegeName=widget.educationModel!.collegeName;
      graduationYear=widget.educationModel!.graduationYear;
      program=widget.educationModel!.program;
    }
    if(widget.organizationDetails!=null){
      jobTitle=widget.organizationDetails!.jobTitle ?? "";
      companyName=widget.organizationDetails!.companyName ?? "";
      jobLevel=widget.organizationDetails!.jobLevel ?? "";
      industry=widget.organizationDetails!.industry ?? "";
      jobFunction=widget.organizationDetails!.jobFunction ?? "";
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          SingleChildScrollView(
            child: SizedBox(width:size.width,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60,),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back)),
                        const SizedBox(width: 8,),
                        Utils.mediumHeadingNormalText(text: UtilStrings.Set_up_your_Networking_Details,
                            fontWeight: FontWeight.w600,textSize: 16
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Utils.mediumHeadingNormalText(text: UtilStrings.Enter_this_details_and_get_the_most_out_of_it,
                        textSize: 14,color: AppColor.grey
                    ),
                    const SizedBox(height: 24,),
                    CommonTextField(hint: UtilStrings.I_Am_Looking_for,controller: lookingForController,image: "search.png",),
                    const SizedBox(height: 16,),
                    CommonTextField(hint: UtilStrings.I_Can_Help_Others_with,controller: helpController,image: "help.png",),
                    const SizedBox(height: 16,),
                    Container(
                      height: 45,width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Row(children: [
                        const SizedBox(width: 16,),
                        Utils.image(image: "ic_industry.png",height:18),
                        const SizedBox(width: 16,),
                        SizedBox(
                          width: size.width/1.4,
                          child: DropdownButton(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                              hint:Utils.mediumHeadingNormalText(
                                  text: UtilStrings.Additional_Industries_Experience,textSize: 12
                              ),
                              underline: Container(),
                              isExpanded: true,
                              value: industryExperienceController.isEmpty?null:industryExperienceController,
                              items: widget.industry!.map((String items){
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,style: const TextStyle(fontSize: 14),));
                              }).toList(),
                              onChanged: (String? value){
                                setState((){
                                  industryExperienceController=value!;
                                });
                              }),
                        )
                      ],),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      height: 45,width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Row(children: [
                        const SizedBox(width: 16,),
                        Utils.image(image: "ic_skill.png",height:18),
                        const SizedBox(width: 16,),
                        SizedBox(
                          width: size.width/1.4,
                          child: DropdownButton(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                              hint:Utils.mediumHeadingNormalText(
                                  text: UtilStrings.Additional_Skills,textSize: 12
                              ),
                              underline: Container(),
                              isExpanded: true,
                              value: skillsController.isEmpty?null:skillsController,
                              items: skills.map((String items){
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,style: const TextStyle(fontSize: 14),));
                              }).toList(),
                              onChanged: (String? value){
                                setState((){
                                  skillsController=value!;
                                });
                              }),
                        )
                      ],),
                    ),


                    const SizedBox(height: 50,),
                    CommonButton(text: "Next",onTap: (){
                      validation();
                    },),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        skip();
                      },
                      child: Utils.mediumHeadingNormalText(text: UtilStrings.Skip_Now,
                          fontWeight: FontWeight.w600,textSize: 14
                      ),
                    ),
                    const SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 8,width:8,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.appGreen),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),const SizedBox(width:6,),
                        Container(height: 8,width:8,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.appGreen),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),const SizedBox(width:6,),
                        Container(height: 8,width:30,
                          decoration: BoxDecoration(
                              color: AppColor.appGreen,
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ],),
                    const SizedBox(height: 20,),
                  ],),
              ),
            ),
          ),
          Utils.progressDialog(context, isLoading)
        ],)
      ),
    );
  }
  popDialog(){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          const SizedBox(height: 16,),
          Utils.image(image: "icon_person_null.png",height: 30,width: 30),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text: UtilStrings.Fill_up_this_information,
              color: AppColor.black,textSize: 14,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 10,),
          Utils.mediumHeadingNormalText(text: UtilStrings.Information_DES,
              color: AppColor.grey,textSize: 12,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 20,),
          Utils.customDivider(),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  apiHit();
                },
                child: Container(height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColor.appGreen,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.Continue,color: AppColor.white,textSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 34,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, RouteName.BottomNavigationBarScreen);
                },
                child: Container(height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.Later,color: AppColor.grey,textSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],)
        ],),
      );
    });
  }
  validation(){
    if(lookingForController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_looking_for);
    }else if(helpController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_help_other);
    }else if(industryExperienceController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_industries_experience);
    }else if(skillsController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_additional_skills);
    }else{
      setState(() {

        networkingDetailsModel =NetworkingDetailsModel(
            lookingFor: lookingForController.text, helpOther: helpController.text,
            additionalExperience: industryExperienceController, additionalSkills: skillsController);
      });
       popDialog();

    }
  }
  apiHit(){
  setState(() {
    isLoading=true;
  });
  List<String> industryExperience=[];
  List<String> skills=[];
  if(widget.type==0){
    // 4


    industryExperience.add(industryExperienceController);
    skills.add(skillsController);
    otherDetailVerificationPresenter!.doVerification(collegeName,schoolName, graduationYear, program, jobTitle, companyName,
        jobLevel, industry, jobFunction,lookingForController.text,helpController.text,
        industryExperience,skills,4);

  }else if(widget.type==1) {
    // 5
    otherDetailVerificationPresenter!.doVerification(collegeName,schoolName, graduationYear, program, jobTitle, companyName,
        jobLevel, industry, jobFunction,lookingForController.text,helpController.text,
        industryExperience,skills,5);

   }else if(widget.type==2){
    //6
    otherDetailVerificationPresenter!.doVerification(collegeName,schoolName, graduationYear, program, jobTitle, companyName,
        jobLevel, industry, jobFunction,lookingForController.text,helpController.text,
        industryExperience,skills,6);
  }else if(widget.type==3){
    //7
    otherDetailVerificationPresenter!.doVerification(collegeName,schoolName, graduationYear, program, jobTitle, companyName,
        jobLevel, industry, jobFunction,lookingForController.text,helpController.text,
        industryExperience,skills,7);
   }
  }
  skip(){
  setState(() {
    isLoading=true;
  });
  List<String> industryExperience=[];
  List<String> skills=[];
  if(widget.type==0){
    Navigator.pushNamed(context, RouteName.BottomNavigationBarScreen);
  }else if(widget.type==1){
    otherDetailVerificationPresenter!.doVerification(collegeName,schoolName, graduationYear, program, jobTitle, companyName,
        jobLevel, industry, jobFunction,lookingForController.text,helpController.text,
        industryExperience,skills,1);
   }else if (widget.type==2){
    otherDetailVerificationPresenter!.doVerification(collegeName,schoolName, graduationYear, program, jobTitle, companyName,
        jobLevel, industry, jobFunction,lookingForController.text,helpController.text,
        industryExperience,skills,2);
   }else if(widget.type==3){
    otherDetailVerificationPresenter!.doVerification(collegeName,schoolName, graduationYear, program, jobTitle, companyName,
        jobLevel, industry, jobFunction,lookingForController.text,helpController.text,
        industryExperience,skills,3);
   }
  }

  @override
  onError(String msg, int status) {
    setState(() {
      isLoading=false;
      CustomSnackBar.showErrorSnackBar(context,message: msg);
      if(status==401){
        Utils.sessionExpire(context);
      }
    });
  }

  @override
  onSuccessRespnse(SuccessResponse response) {
    if(response.status==200){
      setState(() {
        isLoading=false;
        CustomSnackBar.showSuccessSnackBar(context,message: response.message);
        // Navigator.pushNamed(context, RouteName.BottomNavigationBarScreen);
        thanksDialog();
        Future.delayed(Duration(seconds:2),(){
          Navigator.pushReplacementNamed(context, RouteName.BottomNavigationBarScreen);
        });
      });
    }
  }
  thanksDialog(){
    showDialog(
      barrierDismissible: false,
        context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          const SizedBox(height: 16,),
          Utils.image(image: "hand_icon.png",height: 30,width: 30),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text: UtilStrings.Thank_You,
              color: AppColor.black,textSize: 14,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 10,),
          Utils.mediumHeadingNormalText(text: UtilStrings.We_are_processing_your,
              color: AppColor.grey,textSize: 12,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 20,),
          Utils.customDivider(),
          const SizedBox(height: 20,),
        ],),
      );
    });
  }

  @override
  onSuccessGetCollage(GetCollageResponse response) {}

  @override
  onSuccessGetSchool(GetSchoolResponse response) {}

  @override
  onSucessGetPrefrences(GetSetPrefrencess response) {}

  @override
  onSucessGetSkills(GetSkillsResponse response) {
    if(response.status==200){
      for(int i=0;i<response.data!.length;i++){
        setState(() {
          isLoading=false;
          skills.add(response.data![i].tagname.toString());
        });
      }
    }else{
      setState(() {
        isLoading=false;
        CustomSnackBar.showErrorSnackBar(context,message: response.message);
      });
    }
  }

  @override
  onSucessGetProgram(GetProgramResponse response) {

  }
}
