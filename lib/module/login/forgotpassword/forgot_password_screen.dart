import 'package:email_validator/email_validator.dart';
import 'package:emba/model/login_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/module/login/login_presenter.dart';
import 'package:emba/utils/route/route_name.dart';
import 'package:emba/utils/snackbar.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/common/common_button.dart';
import '../../../widget/common/common_text_field.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> implements LoginInterface{
  TextEditingController emailController =TextEditingController();
  bool passwordVisibility=true;
  bool confirmPasswordVisibility=true;
  bool isLoading=false;
  LoginPresenter? loginPresenter;
  @override
  void initState() {
    loginPresenter=LoginPresenter(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){FocusManager.instance.primaryFocus!.unfocus();},
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
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
                          child: Utils.mediumHeadingNormalText(text: UtilStrings.Forgot_password,
                              fontWeight: FontWeight.bold,textSize:16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:30,bottom:50),
                      child: Utils.mediumHeadingNormalText(text: UtilStrings.Forgot_Des,textAlign: TextAlign.start,
                          color: AppColor.grey,textSize:12),
                    ),

                      CommonTextField(hint: UtilStrings.Enter_email_id,controller: emailController,image: "msg_icon.png",),

                      const SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left:16,right: 16),
                        child: CommonButton(text:UtilStrings.Send,onTap: (){
                          validation();
                        },),
                      ),
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
    if(emailController.text.toString().trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_enter_email_name);
    }else if (!EmailValidator.validate(emailController.text.toString().trim())){
      CustomSnackBar.showErrorSnackBar(
          context, message: UtilStrings.ENTER_YOUR_VALID_EMAIL);
    }else{
      setState(() {
        isLoading=true;
      });
      loginPresenter!.doForgotPassword(emailController.text.trim().toString());
    }
  }

  @override
  onError(String msg, int status) {
   setState(() {
     isLoading=false;
   });
   if(status==401){
     Utils.sessionExpire(context);
   }
  }

  @override
  onSuccessForgotRespnse(SuccessResponse response) {
    setState(() {
      isLoading=false;
    });
    if(response.status==200){
      CustomSnackBar.showSuccessSnackBar(context,message: response.message);
      Navigator.pushNamed(context, RouteName.LoginScreen);
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(otp: emailController.text,)));
    }else if(response.status==500){
      CustomSnackBar.showErrorSnackBar(context,message: response.message);
    }
  }

  @override
  onSuccessRespnse(LoginResponse response) {

  }
}
