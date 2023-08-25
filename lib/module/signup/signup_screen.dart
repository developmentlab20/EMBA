import 'package:emba/model/get_collage_response.dart';
import 'package:emba/model/get_interest_response.dart';
import 'package:emba/model/get_school_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/model/signup_response.dart';
import 'package:emba/module/signup/pick_ur_interst/pick_ur_interst_screen.dart';
import 'package:emba/module/signup/signup_presenter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/bool_text.dart';
import '../../utils/color_utils.dart';
import '../../utils/constants/constants.dart';
import '../../utils/snackbar.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/common_button.dart';
import '../../widget/common/common_text_field.dart';
import 'package:email_validator/email_validator.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> implements SignupInterface{
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController referralController =TextEditingController();
  TextEditingController linkdinReferralController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  String schoolNameControllar="";
  String collageNameControllar="";
  bool passwordVisibility=true;
  bool isLoading=false;
  SignupPresenter? signupPresenter;
  List <String> collageName=[];
  List <String> id=[];
  List <String> schoolList=[];
   @override
  void initState() {
     signupPresenter=SignupPresenter(this);
     signupPresenter!.doGetCollage();
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  GestureDetector(onTap: (){
      FocusManager.instance.primaryFocus!.unfocus();
    },
      child: Scaffold(
         body: Stack(
           children: [
             SizedBox(width: size.width,
             child: Padding(
               padding: const EdgeInsets.only(left:20,right:20),
               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   const SizedBox(height:70,),
                   Row(
                     children: [
                       GestureDetector(
                           onTap: (){
                             Navigator.pop(context);
                           },
                           child: const Icon(Icons.arrow_back_sharp,color: AppColor.black,)),
                       const SizedBox(width: 6,),
                       Padding(
                         padding: const EdgeInsets.only(bottom:6),
                         child: Utils.mediumHeadingNormalText(text: UtilStrings.Set_up_your_profile,
                             fontWeight: FontWeight.bold,textSize:16),
                       ),
                     ],
                   ),
                     const SizedBox(height:2,),
                     Padding(
                       padding: const EdgeInsets.only(left:30),
                       child: Utils.mediumHeadingNormalText(text: UtilStrings.Create_your_account_get_started,
                           color: AppColor.grey,textSize:12),
                     ),
                     const SizedBox(height: 24,),
                     CommonTextField(hint: UtilStrings.Enter_full_name,image: "person_icon.png",controller:nameController,),
                     const SizedBox(height: 20,),
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
                                   text: UtilStrings.Enter_college_name,textSize: 12
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
                               text: UtilStrings.Enter_school_name,textSize: 12
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
                     CommonTextField(hint: UtilStrings.Enter_email_id,image: "msg_icon.png",controller:emailController,),
                     const SizedBox(height: 20,),
                     CommonTextField(hint: UtilStrings.Referral_Code_for_faster_approval,image: "referral_icon.png",controller:referralController,),
                     const SizedBox(height: 20,),
                     CommonTextField(hint: UtilStrings.Set_Password,image: "lock_icon.png",controller:passwordController,obscureText: passwordVisibility,
                       showPasswordEye: true,
                       visibility: (){
                         setState(() {
                           if(passwordVisibility){
                             setState(() {
                               passwordVisibility=false;
                             });
                           }else{
                             setState(() {
                               passwordVisibility=true;
                             });
                           }
                         });
                       },
                     ),
                     const SizedBox(height: 20,),
                     Row(
                       children: [
                         Container(
                           width: size.width/1.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(color:AppColor.grey),
                           ),
                           child: TextField(
                             cursorColor: AppColor.black,
                             style: TextStyle(fontSize: 14,),
                             controller:linkdinReferralController,
                             decoration: InputDecoration(
                               border: InputBorder.none,
                               contentPadding: EdgeInsets.only(left: 18,right: 14),
                               hintText: UtilStrings.LinkedIn_if_you_dont_have_referral_code,
                               hintStyle: TextStyle(
                                   fontSize: 12
                               ),
                             ),
                           ),
                         ),
                         Spacer(),
                         GestureDetector(
                             onTap:(){
                               print("Banish");
                               launch('Linkdien.com');
                             },
                             child: Utils.image(image: "ic_linkdin_4x.png",height: 35,width: 35))
                       ],
                     ),
                     const SizedBox(height: 24,),
                     CommonButton(text:UtilStrings.Next,onTap: (){
                       validation();
                     },),
                     const SizedBox(height: 16,),
                     Row(children: [
                       const Expanded(child: Divider(color:AppColor.grey,)),
                       const SizedBox(width:6,),
                       Padding(
                         padding: const EdgeInsets.only(bottom:6),
                         child: Utils.mediumHeadingNormalText(text: UtilStrings.or,fontWeight: FontWeight.bold,textSize:14),
                       ),
                       const SizedBox(width:6,),
                       const Expanded(child: Divider(color:AppColor.grey,)),
                     ],),
                     const SizedBox(height:16,),
                     CommonButton(border: true,
                       text:UtilStrings.Login_with_Linkedin,borderColor:AppColor.blue,
                       textColor: AppColor.blue,
                       image: "linked_icon.png",
                       onTap: (){
                       },
                     ),
                     const SizedBox(height: 20,),
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
    if(nameController.text.trim().toString().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_name);
    }else if(nameController.text.trim().length<8){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.fullname_length_must_be_at_least_characters_long);
    }else if(collageNameControllar.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_select_colleage_name);
    }else if(schoolNameControllar.isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_school_name);
    }else if(emailController.text.trim().toString().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_email_name);
    }else if (!EmailValidator.validate(emailController.text.toString().trim())){
      CustomSnackBar.showErrorSnackBar(
          context, message: UtilStrings.ENTER_YOUR_VALID_EMAIL);
    }/*else if(referralController.text.trim().toString().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_referral_code);
    }*/
    else if(linkdinReferralController.text.trim().toString().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_linkedin_url);
    }else if(passwordController.text.trim().toString().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_password);
    }
    else if(!Utils.validateStructure(passwordController.text.toString())){
      CustomSnackBar.showErrorSnackBar(context,message:UtilStrings.password_must_contain_at_least);
    }else if(passwordController.text.length<8){
      CustomSnackBar.showErrorSnackBar(context,message:UtilStrings.password_length_must_be_at_least_characters_long);
    }else{
      setState(() {
        isLoading=true;
        signupPresenter!.doEmailExist(emailController.text);
      });
    }
  }

  @override
  onError(String msg, int status) {
    setState(() {
      isLoading=false;
      CustomSnackBar.showErrorSnackBar(context,message: msg);
    });
  }

  @override
  onSuccess(SuccessResponse response) {
    setState(() {
      isLoading=false;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PickInterstScreen(
      name: nameController.text,
      collageName: collageNameControllar,
      schoolName: schoolNameControllar,
      email: emailController.text,
      password: passwordController.text,
      linkdln: linkdinReferralController.text,
    )));
  }

  @override
  onSuccessInterest(GetInterestResponse response) {

  }

  @override
  onSuccessRespnse(SignupResponse response) {
    setState(() {
      isLoading=false;
    });
  }

  @override
  onSuccessGetCollage(GetCollageResponse response) {
   /* setState(() {
      isLoading=false;
    });*/
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
       signupPresenter!.doGetSchool(collageId);
     });
  }
}
