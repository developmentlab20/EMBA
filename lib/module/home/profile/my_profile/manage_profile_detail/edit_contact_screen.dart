import 'package:email_validator/email_validator.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/snackbar.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../../../../widget/common/common_button.dart';
import 'edit_presenter/edit_manage_contact_presenter.dart';

class EditContactScreen extends StatefulWidget {
  String? phone,email,city,state;
   EditContactScreen({Key? key,this.phone,this.email,this.state,this.city}) : super(key: key);

  @override
  _EditContactScreenState createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen>implements EditManageContactInterface {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityPasswordController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  bool isLoading =false;
  EditManageContactPresenter? editManageContactPresenter;
  @override
  void initState() {
    editManageContactPresenter=EditManageContactPresenter(this);
    phoneNumberController.text=widget.phone!=null?widget.phone.toString():"";
    emailController.text=widget.email!=null?widget.email.toString():"";
    cityPasswordController.text=widget.city!=null?widget.city.toString():"";
    stateController.text=widget.state!=null?widget.state.toString():"";
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
        resizeToAvoidBottomInset: false,
        appBar:  PreferredSize(
          preferredSize:  const Size(double.infinity, kToolbarHeight),
          child:CommonAppBar(title:UtilStrings.Edit_Contact,action: false),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: SizedBox(width:size.width,height: size.height,
                child: Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16,),
                      Utils.customTextFeildSetting(context,
                          UtilStrings.Phone_No,
                          UtilStrings.Phone_No,
                          phoneNumberController, false,
                          false,1),
                      const SizedBox(height: 16,),
                      Utils.customTextFeildSetting(context,
                          UtilStrings.Email,
                          UtilStrings.Email,
                          emailController, false,
                          false,1),
                      const SizedBox(height: 16,),
                      Utils.customTextFeildSetting(context,
                          UtilStrings.City,
                          UtilStrings.Enter_city,
                          cityPasswordController, false,
                          false,1),
                      const SizedBox(height: 16,),
                      Utils.customTextFeildSetting(context,
                          UtilStrings.State,
                          UtilStrings.Enter_State,
                          stateController, false,
                          false,1),
                    ],),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30,left: 20,right: 20),
                child: CommonButton(text: "Save",onTap: (){
                  validation();
                },)),
            Utils.progressDialog(context, isLoading)
          ],
        ),
      ),
    );
  }
  validation(){
    if(phoneNumberController.text.trim().toString().isEmpty){
       CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Enter_phone_no);
    }else if(phoneNumberController.text.length<10||phoneNumberController.text.length>15){
      CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Enter_valid_phone_no);
    }else if(emailController.text.toString().trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_email_name);
    }else if (!EmailValidator.validate(emailController.text.toString().trim())){
      CustomSnackBar.showErrorSnackBar(
          context, message: UtilStrings.ENTER_YOUR_VALID_EMAIL);
    }else if(cityPasswordController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_city);
    }else if(stateController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_enter_state);
    }else {
      setState(() {
        isLoading=true;
      });
     editManageContactPresenter!.doEditProfile(phoneNumberController.text, emailController.text,
     cityPasswordController.text,stateController.text
     );
    }
  }

  @override
  onError(String msg, int status) {
    if (status == 401) {
      Utils.sessionExpire(context);
    }
    setState(() {
      isLoading = false;
    });
    CustomSnackBar.showSuccessSnackBar(context, message: msg.toString());
  }
  @override
  onSuccessResponse(SuccessResponse response) {
    CustomSnackBar.showSuccessSnackBar(context,message: response.message);
    setState(() {
     isLoading=false;
   });
   Navigator.pop(context);

  }
}
