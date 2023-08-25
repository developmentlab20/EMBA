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

class EditEducationScreen extends StatefulWidget {
  String? school,qualification,specification,program;
  int? type;
   EditEducationScreen({Key? key,this.school,this.qualification,this.specification,this.program,this.type}) : super(key: key);

  @override
  _EditEducationScreenState createState() => _EditEducationScreenState();
}

class _EditEducationScreenState extends State<EditEducationScreen>implements OtherDetailVerificationInterface {

  String schoolNameControllar="";
  String collageNameControllar="";
  String selectGradutionController="";
  String programController="";
  List <String> collageName=[];
  List <String> id=[];
  List <String> schoolList=[];
  List <String> gradutionYear=[];
  List <String> program=[];
  OtherDetailVerificationPresenter? otherDetailVerificationPresenter;
  bool isLoading =true;
  @override
  void initState() {
    otherDetailVerificationPresenter=OtherDetailVerificationPresenter(this);
    otherDetailVerificationPresenter!.doGetCollage();
    otherDetailVerificationPresenter!.doGetProgram();
    for(int i=1975;i<=2023;i++){
      gradutionYear.add(i.toString());
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Edit_Education,action: false),
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
                    Container(
                      height: 45,width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Row(children: [
                        const SizedBox(width: 16,),
                        Utils.image(image: "bank_icon.png",height:18),
                        const SizedBox(width: 16,),
                        SizedBox(
                          width: size.width/1.4,
                          child: DropdownButton(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                              hint:Utils.mediumHeadingNormalText(
                                  text: UtilStrings.Select_university,textSize: 12
                              ),
                              underline: Container(),
                              isExpanded: true,
                              value: collageNameControllar.isEmpty?null:collageNameControllar,
                              items: collageName.map((String items){
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,style: const TextStyle(fontSize: 14),));
                              }).toList(),
                              onChanged: (String? value){
                                setState((){
                                  collageNameControllar=value!;
                                  schoolNameControllar="";
                                  getId();
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
                        Utils.image(image: "school_icon.png",height:13),
                        const SizedBox(width: 16,),
                        SizedBox(
                          width: size.width/1.4,
                          child: DropdownButton(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                              hint:Utils.mediumHeadingNormalText(
                                  text: UtilStrings.Select_School,textSize: 12
                              ),
                              underline: Container(),
                              isExpanded: true,
                              value: schoolNameControllar.isEmpty?null:schoolNameControllar,
                              items: schoolList.map((String items){
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,style: const TextStyle(fontSize: 14),));
                              }).toList(),
                              onChanged: (String? value){
                                setState((){
                                  schoolNameControllar=value!;
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
                        Utils.image(image: "ic_degree.png",height:14),
                        const SizedBox(width: 16,),
                        SizedBox(
                          width: size.width/1.4,
                          child: DropdownButton(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                              hint:Utils.mediumHeadingNormalText(
                                  text: UtilStrings.Select_Graduation_Year,textSize: 12
                              ),
                              underline: Container(),
                              isExpanded: true,
                              value: selectGradutionController.isEmpty?null:selectGradutionController,
                              items: gradutionYear.map((String items){
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,style: const TextStyle(fontSize: 14),));
                              }).toList(),
                              onChanged: (String? value){
                                setState((){
                                  selectGradutionController=value!;
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
                        Utils.image(image: "ic_specification.png",height:14),
                        const SizedBox(width: 16,),
                        SizedBox(
                          width: size.width/1.4,
                          child: DropdownButton(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                              hint:Utils.mediumHeadingNormalText(
                                  text: UtilStrings.Select_Program,textSize: 12
                              ),
                              underline: Container(),
                              isExpanded: true,
                              value: programController.isEmpty?null:programController,
                              items: program.map((String items){
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,style: const TextStyle(fontSize: 14),));
                              }).toList(),
                              onChanged: (String? value){
                                setState((){
                                  programController=value!;
                                });
                              }),
                        )
                      ],),
                    ),
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
    if(collageNameControllar.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_school_name);
    }else if(schoolNameControllar.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_qualification);
    }else if(selectGradutionController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_specification);
    }else if(programController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_school_name);
    }else{
    setState(() {
      isLoading=true;
    });
    otherDetailVerificationPresenter!.doVerification(
        collageNameControllar, schoolNameControllar, selectGradutionController,
        programController, "","", "", "", "", "", "", [], [], 1);
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

  onSuccessGetCollage(GetCollageResponse response) {
    setState(() {
      isLoading=false;
    });
    if(response.status==200){
      for(int i=0;i<response.data!.schoolsModel!.length;i++){
        setState(() {
          collageName.add(response.data!.schoolsModel![i].name.toString(),);
          id.add(response.data!.schoolsModel![i].sId.toString(),);
        });
      }
      if(widget.type==1){
        collageNameControllar=widget.qualification.toString();
        schoolNameControllar=widget.school.toString();
        selectGradutionController=widget.specification.toString();
        programController=widget.program.toString();
        print(collageNameControllar);
        print(schoolNameControllar);
        getId();
      }
    }
  }
  @override
  onSuccessGetSchool(GetSchoolResponse response) {
    setState(() {
      isLoading=false;
    });
    if(response.status==200){
      for(int i=0;i<response.data!.schoolsModel![0].programs!.length;i++){
        setState(() {
          schoolList.add(response.data!.schoolsModel![0].programs![i].toString());
        });
      }
    }
  }

  @override
  onSucessGetPrefrences(GetSetPrefrencess response) {}
  getId(){
    setState(() {
      isLoading=true;
      for(int i=0;i<collageName.length;i++){
        if(collageName[i].toString()==collageNameControllar.toString()){
          otherDetailVerificationPresenter!.doGetSchool(id[i].toString());
        }
      }

    });
  }

  @override
  onSucessGetSkills(GetSkillsResponse response) {

  }

  @override
  onSucessGetProgram(GetProgramResponse response) {
    if(response.status==200){
      for(int i=0;i<response.data!.degreeProgram!.length;i++){
        setState(() {
          program.add(response.data!.degreeProgram![i].name.toString());
        });
      }
    }
  }
}
