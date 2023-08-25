import 'package:emba/model/get_collage_response.dart';
import 'package:emba/model/get_program_model.dart';
import 'package:emba/model/get_school_response.dart';
import 'package:emba/model/get_skills_response.dart';
import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/module/signup/other_details_verification/setup_network_details.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../../../../widget/common/common_button.dart';
import '../../../../../widget/common/common_text_field.dart';
import '../../../model/bool_text.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/snackbar.dart';
import 'other_detail_presenter.dart';


class SetupOrganizationDetailScreen extends StatefulWidget {
  EducationModel? educationModel;
  SetupOrganizationDetailScreen({Key? key,this.educationModel}) : super(key: key);
  @override
  _SetupOrganizationDetailScreen createState() => _SetupOrganizationDetailScreen();
}

class _SetupOrganizationDetailScreen extends State<SetupOrganizationDetailScreen> implements OtherDetailVerificationInterface{
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  String industryController="";
  String jobFunctionController="";
  String jobLevelController="";
  List <String> industry=[];
  List <String> jobFunction=[];
  List <String> level=[];
  OtherDetailVerificationPresenter?  otherDetailVerificationPresenter;
  bool isLoading = true;
@override
  void initState() {
  otherDetailVerificationPresenter=OtherDetailVerificationPresenter(this);
  otherDetailVerificationPresenter!.doGetSetPrefrences();
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width:size.width,
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
                          Utils.mediumHeadingNormalText(text: UtilStrings.Set_up_your_Organizational_Details,
                              fontWeight: FontWeight.w600,textSize: 16
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Utils.mediumHeadingNormalText(text: UtilStrings.Enter_this_details_and_get_the_most_out_of_it,
                          textSize: 14,color: AppColor.grey
                      ),
                      const SizedBox(height: 24,),
                      CommonTextField(hint: UtilStrings.Enter_Job_Title,controller: jobTitleController,image: "ic_job_title.png",),
                      const SizedBox(height: 20,),
                      CommonTextField(hint: UtilStrings.Enter_Company_Name,controller: companyNameController,image: "company.png",),
                      const SizedBox(height: 20,),
                      Container(
                        height: 45,width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Row(children: [
                          const SizedBox(width: 16,),
                          Utils.image(image: "job_level_icon.png",height:18),
                          const SizedBox(width: 16,),
                          SizedBox(
                            width: size.width/1.4,
                            child: DropdownButton(
                                icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                                hint:Utils.mediumHeadingNormalText(
                                    text: UtilStrings.Enter_Job_Level,textSize: 12
                                ),
                                underline: Container(),
                                isExpanded: true,
                                value: jobLevelController.isEmpty?null:jobLevelController,
                                items: level.map((String items){
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,style: const TextStyle(fontSize: 14),));
                                }).toList(),
                                onChanged: (String? value){
                                  setState((){
                                    jobLevelController=value!;
                                  });
                                }),
                          )
                        ],),
                      ),
                      const SizedBox(height: 20,),
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
                                    text: UtilStrings.Enter_Industry,textSize: 12
                                ),
                                underline: Container(),
                                isExpanded: true,
                                value: industryController.isEmpty?null:industryController,
                                items: industry.map((String items){
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,style: const TextStyle(fontSize: 14),));
                                }).toList(),
                                onChanged: (String? value){
                                  setState((){
                                    industryController=value!;
                                  });
                                }),
                          )
                        ],),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 45,width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Row(children: [
                          const SizedBox(width: 16,),
                          Utils.image(image: "ic_job_function.png",height:18),
                          const SizedBox(width: 16,),
                          SizedBox(
                            width: size.width/1.4,
                            child: DropdownButton(
                                icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                                hint:Utils.mediumHeadingNormalText(
                                    text: UtilStrings.Enter_Job_Function,textSize: 12
                                ),
                                underline: Container(),
                                isExpanded: true,
                                value: jobFunctionController.isEmpty?null:jobFunctionController,
                                items: jobFunction.map((String items){
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,style: const TextStyle(fontSize: 14),));
                                }).toList(),
                                onChanged: (String? value){
                                  setState((){
                                    jobFunctionController=value!;
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
                          if(widget.educationModel==null){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SetupNetworkScreen(
                              type: 0,
                              industry: industry,
                            )));
                          }else{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SetupNetworkScreen(
                              type: 1,
                              educationModel: widget.educationModel,
                              industry: industry,
                            )));
                          }
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
                          Container(height: 8,width:30,
                            decoration: BoxDecoration(
                                color: AppColor.appGreen,
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),const SizedBox(width:6,),
                          Container(height: 8,width:8,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.appGreen),
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
          ],
        ),
      ),
    );
  }
  validation(){
    if(jobTitleController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_job_title);
    }else if(companyNameController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_company_name);
    }else if(jobLevelController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_job_level);
    }else if(industryController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_industry);
    }else if(jobFunctionController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_job_function);
    }else{
      OrganizationDetailsModel organizationDetails=OrganizationDetailsModel(
          jobTitle: jobTitleController.text, companyName: companyNameController.text,
          jobLevel: jobLevelController, industry: industryController, jobFunction: jobFunctionController);

      if(widget.educationModel==null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SetupNetworkScreen(
          type: 2,
          industry: industry,
          organizationDetails:organizationDetails,
        )));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SetupNetworkScreen(
          educationModel: widget.educationModel!=null? widget.educationModel:null,
          organizationDetails:organizationDetails,
          type: 3,
          industry: industry,
        )));
      }

    }
  }
  @override
  onError(String msg, int status) {
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showErrorSnackBar(context,message: msg);
  }
  @override
  onSucessGetPrefrences(GetSetPrefrencess response) {
  if(response.status==200){
    for(int i=0;i<response.data!.industries!.length;i++){
      setState(() {
        industry.add(response.data!.industries![i].toString());
      });
      }
    for(int i=0;i<response.data!.jobFunctions!.length;i++){
      setState(() {
        jobFunction.add(response.data!.jobFunctions![i].toString());
      });
      }
    for(int i=0;i<response.data!.levels!.length;i++){
      setState(() {
        level.add(response.data!.levels![i].toString());
      });
      }
    }
  setState(() {
    isLoading=false;
  });
  }
  @override
  onSuccessGetCollage(GetCollageResponse response) {}
  @override
  onSuccessGetSchool(GetSchoolResponse response) {}
  @override
  onSuccessRespnse(SuccessResponse response) {}

  @override
  onSucessGetSkills(GetSkillsResponse response) {

  }

  @override
  onSucessGetProgram(GetProgramResponse response) {

  }

}

