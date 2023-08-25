import 'dart:io';

import 'package:emba/model/bool_text.dart';
import 'package:emba/model/get_collage_response.dart';
import 'package:emba/model/get_program_model.dart';
import 'package:emba/model/get_school_response.dart';
import 'package:emba/model/get_skills_response.dart';
import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/module/signup/other_details_verification/setup_organizational_details.dart';
import 'package:emba/utils/constants/constants.dart';
import 'package:emba/utils/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/common_button.dart';
import '../../../../../widget/common/common_text_field.dart';
import '../../../utils/snackbar.dart';
import 'other_detail_presenter.dart';

class SetudEducationsDetailsScreen extends StatefulWidget {
  const SetudEducationsDetailsScreen({Key? key}) : super(key: key);

  @override
  _SetudEducationsDetailsScreen createState() => _SetudEducationsDetailsScreen();
}

class _SetudEducationsDetailsScreen extends State<SetudEducationsDetailsScreen> implements OtherDetailVerificationInterface{
  String schoolNameControllar="";
  String collageNameControllar="";
  String selectGradutionController="";
  String programController="";
  bool isLoading=true;
  List <String> collageName=[];
  List <String> id=[];
  List <String> schoolList=[];
  List <String> gradutionYear=[];
  List <String> program=[];
  OtherDetailVerificationPresenter?  otherDetailVerificationPresenter;
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
    return WillPopScope(
      onWillPop: ()async{
        if(Platform.isAndroid){
          SystemNavigator.pop();
        }
        return true;
      },
      child: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
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
                                  Navigator.pushNamed(context, RouteName.BottomNavigationBarScreen);
                                },
                                child: const Icon(Icons.arrow_back)),
                            const SizedBox(width: 8,),
                            Utils.mediumHeadingNormalText(text: UtilStrings.Set_up_your_Educational_Details,
                            fontWeight: FontWeight.w600,textSize: 16
                            ),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Utils.mediumHeadingNormalText(text: UtilStrings.Enter_this_details_and_get_the_most_out_of_it,
                            textSize: 14,color: AppColor.grey
                        ),
                        const SizedBox(height: 24,),
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
                        const SizedBox(height: 50,),
                        CommonButton(text: "Next",onTap: (){
                          validation();
                        },),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SetupOrganizationDetailScreen()));
                          },
                          child: Utils.mediumHeadingNormalText(text: UtilStrings.Skip_Now,
                              fontWeight: FontWeight.w600,textSize: 14
                          ),
                        ),
                        const SizedBox(height: 24,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
      ),
    );
  }
  validation(){
    if(collageNameControllar.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_select_colleage_name);
    }else if(schoolNameControllar.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_school_name);
    }else if(selectGradutionController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_qualification_year);
    }else if(programController.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_select_program);
    }else{
      EducationModel educationModel =EducationModel(
        collegeName: collageNameControllar,
        schoolName: schoolNameControllar,
        graduationYear: selectGradutionController,
        program: programController,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SetupOrganizationDetailScreen(
        educationModel: educationModel,
      )));
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
  onSuccessRespnse(SuccessResponse response) {}
  getId(){
    setState(() {
      isLoading=true;
      String collageId="";
      for(int i=0;i<collageName.length;i++){
        if(collageName[i].toString()==collageNameControllar.toString()){
          collageId=id[i].toString();
          break;
        }
      }
      otherDetailVerificationPresenter!.doGetSchool(collageId);
    });
  }

  @override
  onSucessGetPrefrences(GetSetPrefrencess response) {}

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
