import 'package:emba/model/get_collage_response.dart';
import 'package:emba/model/get_program_model.dart';
import 'package:emba/model/get_school_response.dart';
import 'package:emba/model/get_skills_response.dart';
import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/snackbar.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../../../../widget/common/common_button.dart';
import '../../../../../widget/common/common_text_field.dart';
import '../../../../signup/other_details_verification/other_detail_presenter.dart';


class EditNetworkScreen extends StatefulWidget {
  String? lookingFor,helpOther,experience,skills;
  int? type;
   EditNetworkScreen({Key? key,this.lookingFor,this.experience,this.helpOther,this.skills,this.type}) : super(key: key);

  @override
  _EditNetworkScreenState createState() => _EditNetworkScreenState();
}

class _EditNetworkScreenState extends State<EditNetworkScreen>implements OtherDetailVerificationInterface {
  TextEditingController lookingForController = TextEditingController();
  TextEditingController helpController = TextEditingController();
  String industryExperienceController="";
  String skillsController="";
  OtherDetailVerificationPresenter? otherDetailVerificationPresenter;
  bool isLoading =false;
  List <String> industry=[];
  List <String> skills=[];
  @override
  void initState() {
    otherDetailVerificationPresenter=OtherDetailVerificationPresenter(this);
    otherDetailVerificationPresenter!.doGetSetPrefrences();
    otherDetailVerificationPresenter!.doGetSkills();
    isLoading=true;
    if(widget.type==1){
      lookingForController.text=widget.lookingFor.toString();
      helpController.text=widget.helpOther.toString();
      industryExperienceController=widget.experience.toString();
      skillsController=widget.skills.toString();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Edit_networking_details,action: false),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: SizedBox(width:size.width,height: size.height/1.2,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16,),
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
                              items: industry.map((String items){
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

                    const SizedBox(height: 16,)
                  ],),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: CommonButton(text: "Save",onTap: (){
                validation();
              },)),
        Utils.progressDialog(context, isLoading)
        ],
      ),
    );
  }
 validation(){
   if(lookingForController.text.trim().isEmpty){
     CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_job_title);
   }else if(helpController.text.trim().isEmpty){
     CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_company_name);
   }else if(industryExperienceController.isEmpty){
     CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_job_level);
   }else if(skillsController.isEmpty){
     CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_industry);
   }else{
     setState(() {
       isLoading=true;
     });

     List<String> skills=[];
     List<String> industry=[];
      skills.add(skillsController);
      industry.add(industryExperienceController);

     otherDetailVerificationPresenter!
         .doEditNetwork(
         lookingForController.text,
         helpController.text, industry, skills,);
   }
 }
  @override
  onError(String msg, int status) {
    if(status==401){
      Utils.sessionExpire(context);
    }
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showErrorSnackBar(context,message:msg.toString());
  }

  @override
  onSuccessRespnse(SuccessResponse response) {
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showSuccessSnackBar(context,message: response.message);
    if(response.status==200){
      Navigator.pop(context);
    }
  }

  @override
  onSuccessGetCollage(GetCollageResponse response) {

  }

  @override
  onSuccessGetSchool(GetSchoolResponse response) {

  }

  @override
  onSucessGetPrefrences(GetSetPrefrencess response) {
    if(response.status==200){
      for(int i=0;i<response.data!.industries!.length;i++){
        setState(() {
          industry.add(response.data!.industries![i].toString());
        });
      }
    }
    setState(() {
      isLoading=false;
    });
  }

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
