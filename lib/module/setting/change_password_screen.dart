import 'package:email_validator/email_validator.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/utils/route/route_name.dart';
import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import '../../utils/snackbar.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';
import '../../widget/common/common_button.dart';
import '../../widget/common/common_seetinng_text_field.dart';
import '../../widget/common/common_text_field.dart';
import '../login/login_presenter.dart';
import 'interface/change_password_presenter.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>implements ChangePassswordInterface {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading=false;
  bool newPassword=true;
  bool confirm=true;
  bool old=true;
  ChangePassswordPresenter? changePassswordPresenter;
  @override
  void initState() {
    changePassswordPresenter=ChangePassswordPresenter(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Password,),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Utils.mediumHeadingNormalText(text:UtilStrings.New_Password,textSize:14,fontWeight: FontWeight.w500,
                      color: AppColor.grey),
                      const SizedBox(height: 6,),
                      CommonSeetingTextFieldTextField(hint: UtilStrings.New_Password,controller:newPasswordController,obscureText:newPassword,
                        visibility: (){
                          setState(() {
                            if(newPassword){
                              setState(() {
                                newPassword=false;
                              });
                            }else{
                              setState(() {
                                newPassword=true;
                              });
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20,),
                      Utils.mediumHeadingNormalText(text:UtilStrings.Confirm_New_Password,textSize:14,fontWeight: FontWeight.w500,
                          color: AppColor.grey),
                      const SizedBox(height: 6,),
                      CommonSeetingTextFieldTextField(hint: UtilStrings.New_password_again,controller:confirmPasswordController,
                        obscureText:confirm,
                        visibility: (){
                          setState(() {
                            if(confirm){
                              setState(() {
                                confirm=false;
                              });
                            }else{
                              setState(() {
                                confirm=true;
                              });
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20,),
                      Utils.mediumHeadingNormalText(text:UtilStrings.Old_Password,textSize:14,fontWeight: FontWeight.w500,
                          color: AppColor.grey),
                      const SizedBox(height: 6,),
                      CommonSeetingTextFieldTextField(hint: UtilStrings.Old_Password,controller:currentPasswordController,
                        obscureText:old,
                        visibility: (){
                          setState(() {
                            if(old){
                              setState(() {
                                old=false;
                              });
                            }else{
                              setState(() {
                                old=true;
                              });
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.ForgotPasswordScreen);
                          },
                          child: Utils.mediumHeadingNormalText(text: UtilStrings.Forgot_your_password,underline: true,textSize: 12)),
                      const SizedBox(height: 40,),
                      CommonButton(text: "Change Password",onTap: (){
                        validation(context);
                      },),
                    ],
                  ),
                )
              ],),
          ),
          Utils.progressDialog(context, isLoading)
        ],
      ),
    );
  }
  void validation(BuildContext context) {
   if (newPasswordController.text.trim().isEmpty) {
      CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_enter_password);
    } else if (confirmPasswordController.text.trim().isEmpty) {
      CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_enter_confirm_password);
    } else if (confirmPasswordController.text.toString() != newPasswordController.text) {
      CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Password_do_not_matched);
    } else if(currentPasswordController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_enter_old_password);
    }else if(!Utils.validateStructure(confirmPasswordController.text.toString())){
     CustomSnackBar.showErrorSnackBar(context,message:UtilStrings.password_must_contain_at_least);
   }else {
      setState(() {
        isLoading=true;
      });
      changePassswordPresenter!.doChangePassword(
        currentPasswordController.text.trim().toString(), newPasswordController.text.trim().toString(),
        confirmPasswordController.text.toString());
    }
  }

  @override
  onError(String msg, int status) {
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showErrorSnackBar(context,message: msg);
    if(status==401){
      Utils.sessionExpire(context);
    }
  }
  @override
  onSuccessRespnse(SuccessResponse response) {
    setState(() {
      isLoading=false;
    });
    if(response.status==200){
      CustomSnackBar.showSuccessSnackBar(context,message: response.message.toString());
      Navigator.pop(context);
    }
  }
}
