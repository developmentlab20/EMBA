import 'package:emba/model/get_collage_response.dart';
import 'package:emba/model/get_program_model.dart';
import 'package:emba/model/get_school_response.dart';
import 'package:emba/model/get_skills_response.dart';
import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/snackbar.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../../../../widget/common/common_button.dart';
import '../../../../../widget/common/common_text_field.dart';
import '../../../../signup/other_details_verification/other_detail_presenter.dart';


class AddEditJobScreen extends StatefulWidget {
  int type;
  String? jobTitle,companyName,jobLevel,industry,jobFunction;
  AddEditJobScreen({required this.type,this.jobFunction,this.jobLevel,this.industry
  ,this.companyName,this.jobTitle});
  @override
  _AddEditJobScreenState createState() => _AddEditJobScreenState();
}

class _AddEditJobScreenState extends State<AddEditJobScreen>implements OtherDetailVerificationInterface{
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  String jobLevelController="";
  String industryController="";
  String jobFunctionController="";
  List <String> industry=[];
  List <String> jobFunction=[];
  List <String> level=[];

  OtherDetailVerificationPresenter? otherDetailVerificationPresenter;
  bool isLoading =true;
  @override
  void initState() {
    otherDetailVerificationPresenter=OtherDetailVerificationPresenter(this);
    otherDetailVerificationPresenter!.doGetSetPrefrences();

      if(widget.type==1){
        jobTitleController.text=widget.jobTitle!;
        companyNameController.text=widget.companyName!;
        jobLevelController=widget.jobLevel!;
        industryController=widget.industry!;
        jobFunctionController=widget.jobFunction!;
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
        appBar:  PreferredSize(
          preferredSize:  const Size(double.infinity, kToolbarHeight),
          child:CommonAppBar(title:widget.type==1?UtilStrings.Edit_job:UtilStrings.Add_job,action: false),
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
                      const SizedBox(height: 30,),
                      CommonTextField(hint: UtilStrings.Enter_Job_Title,controller: jobTitleController,image: "ic_job_title.png",),
                      const SizedBox(height: 16,),
                      CommonTextField(hint: UtilStrings.Enter_Company_Name,controller: companyNameController,image: "company.png",),
                      const SizedBox(height: 16,),
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
                          Utils.image(image: "ic_job_function.png",height:16),
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
                    ],),
                ),
              ),
            ),
            Utils.progressDialog(context, isLoading),
            Positioned(
              left: 20,right: 20,bottom: 20,
              child: CommonButton(text: "Save",onTap: (){
                validation();
              },),
            ),
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
      setState(() {
        isLoading=true;
      });
      otherDetailVerificationPresenter!.doEditJob(jobTitleController.text, companyNameController.text,
        jobLevelController, industryController, jobFunctionController,
         );
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
  onSuccessRespnse(SuccessResponse response) {
    CustomSnackBar.showSuccessSnackBar(context,message: response.message);
    Navigator.pop(context);
  }

  @override
  onSucessGetSkills(GetSkillsResponse response) {

  }

  @override
  onSucessGetProgram(GetProgramResponse response) {

  }
}

