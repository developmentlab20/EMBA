import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/route/route_name.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/common/common_button.dart';
import '../../../widget/common/common_text_field.dart';

class OtpScreen extends StatefulWidget {
  String? otp;
   OtpScreen({Key? key,this.otp}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController confirmPasswordController =TextEditingController();
  bool passwordVisibility =true;
  bool newPasswordVisibility =true;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height:70,),
              Utils.image(image: "splash_icon.png",height:100,width:100),
              Utils.mediumHeadingNormalText(text: UtilStrings.Otp_Des,textSize:16),
              const SizedBox(height:12,),
              Container(height: 50,width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.grey2
              ),
                child: Center(child: Utils.mediumHeadingNormalText(text: widget.otp)),
              ),
              const SizedBox(height:24,),
              Utils.mediumHeadingNormalText(text: UtilStrings.Otp_Title,textSize:14,),
              const SizedBox(height:22,),
              CommonTextField(hint: UtilStrings.Enter_Otp,controller: emailController,image: "msg_icon.png",),
              const SizedBox(height:22,),
              CommonTextField(hint: UtilStrings.Enter_password,controller: passwordController,image: "lock_icon.png",obscureText: passwordVisibility,
                showPasswordEye: true,visibility: (){
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
              const SizedBox(height:22,),
              CommonTextField(hint: UtilStrings.Enter_confirm_password,controller: confirmPasswordController,image: "lock_icon.png",obscureText: newPasswordVisibility,
                showPasswordEye: true,visibility: (){
                  setState(() {
                    if(newPasswordVisibility){
                      setState(() {
                        newPasswordVisibility=false;
                      });
                    }else{
                      setState(() {
                        newPasswordVisibility=true;
                      });
                    }
                  });
                },
              ),
              const SizedBox(height:28,),
              CommonButton(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.LoginScreen);
                },
                text: UtilStrings.Change_Password,),
              const SizedBox(height:16,),

            ],),
          ),
        ),
      ),
    );
  }
  validation(){
    if(passwordController.text.trim().isEmpty){

    }else if(confirmPasswordController.text.trim().isEmpty){

    }else if(passwordController.text!=confirmPasswordController){

    }else{
      Navigator.pushNamed(context, RouteName.LoginScreen);
    }
  }
}
