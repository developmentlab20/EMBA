import 'package:email_validator/email_validator.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/module/home/bottom_navigation_bar.dart';
import 'package:emba/utils/sharedpref/preferences.dart';
import 'package:emba/utils/sharedpref/shared_prefrence.dart';
import 'package:flutter/material.dart';
import '../../model/login_response.dart';
import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/snackbar.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/common_button.dart';
import '../../widget/common/common_text_field.dart';
import 'login_presenter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginInterface {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool passwordVisibility=true;
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

    return  GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: size.height,
                    child: Column(children: [
                      const SizedBox(height:70,),
                      Utils.mediumHeadingNormalText(text: UtilStrings.Welcome_to,fontWeight: FontWeight.bold,textSize:22),
                      Utils.image(image: "splash_icon.png",height:100,width:100),
                      const SizedBox(height:30,),
                      CommonTextField(hint: UtilStrings.Enter_email_id,controller: emailController,image: "msg_icon.png",),
                      const SizedBox(height:20,),
                      CommonTextField(hint: UtilStrings.Enter_password,controller: passwordController,image: "lock_icon.png",obscureText: passwordVisibility,
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
                      const SizedBox(height:12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        GestureDetector(onTap: () {
                          Navigator.pushNamed(context,RouteName.ForgotPasswordScreen);
                        },
                          child: Utils.mediumHeadingNormalText(text: UtilStrings.Forgot_Password,fontWeight: FontWeight.bold,textSize:12,
                          underline: true
                          ),
                        ),
                      ],),
                      const SizedBox(height:24,),
                      CommonButton(text:UtilStrings.Login,onTap: (){
                        validation();
                        // Navigator.pushReplacementNamed(context, RouteName.BottomNavigationBarScreen);
                      },),
                      const SizedBox(height:14,),
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
                      CommonButton(border: true,text:UtilStrings.Login_with_Linkedin,
                        borderColor:AppColor.blue,textColor: AppColor.blue,
                      image: "linked_icon.png",
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, RouteName.SignupScreen);
                        },
                        child: RichText(text: TextSpan(
                          text: UtilStrings.Dont_have_an_account_Signup,
                          style: TextStyle(color: AppColor.black,fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                            text: UtilStrings.Sign_Up,
                            style: TextStyle(color: AppColor.appGreen,fontWeight: FontWeight.bold),
                            )
                          ]
                        )),
                      ),
                      const SizedBox(height:20,),
                    ],),
                  ),
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
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_email_name);
    }else if (!EmailValidator.validate(emailController.text.toString().trim())){
      CustomSnackBar.showErrorSnackBar(
          context, message: UtilStrings.ENTER_YOUR_VALID_EMAIL);
    } else if(passwordController.text.toString().trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_password);
    }else{
   setState(() {
     isLoading=true;
   });
   loginPresenter!.doLogin(emailController.text.toString(), passwordController.text.toString());
    }
  }

  @override
  onError(String msg, int status) {
   setState(() {
     isLoading=false;
   });
   CustomSnackBar.showErrorSnackBar(context, message:msg);
   if(status==401){
     Utils.sessionExpire(context);
   }
  }

  @override
  onSuccessRespnse(LoginResponse response) {
    setState(() {
      isLoading=false;
    });
    if(response.status==200){
      setState(() {
        emailController.text="";
        passwordController.text="";
      });
      Utils.hideKeyBoard(context);
      CustomSnackBar.showSuccessSnackBar(context, message: response.message);
      SessionManager.setString(Preferences.USER_NAME, response.data!.fullname.toString());
      SessionManager.setString(Preferences.EMAIL, response.data!.email.toString());
      SessionManager.setString(Preferences.ACCESS_TOKEN, response.jwtToken.toString());
      SessionManager.setBoolean(Preferences.USER_LOGIN, true);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      const BottomNavigationBarScreen()), (Route<dynamic> route) => false);
      Navigator.pushReplacementNamed(context, RouteName.BottomNavigationBarScreen);
    }else  if(response.status==403){
      CustomSnackBar.showErrorSnackBar(context, message: response.message);
    }
  }

  @override
  onSuccessForgotRespnse(SuccessResponse response) {
    Utils.hideKeyBoard(context);
  }
}
