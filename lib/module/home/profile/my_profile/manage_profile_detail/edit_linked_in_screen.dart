import 'package:emba/model/profile/profile_upload_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/utils/snackbar.dart';
import 'package:emba/widget/common/common_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../../../../widget/common/common_button.dart';
import 'edit_presenter/edit_linkedin_presenter.dart';

class EditLinkedInScreen extends StatefulWidget {
  String? url;
   EditLinkedInScreen({Key? key,this.url}) : super(key: key);
  @override
  _EditLinkedInScreenState createState() => _EditLinkedInScreenState();
}

class _EditLinkedInScreenState extends State<EditLinkedInScreen>implements EditLinkedinInterface{
  TextEditingController linkController = TextEditingController();
  bool isLoading =false;
  EditProfilePresenter? editLinkedInPresenter;
  @override
  void initState() {
    linkController.text=widget.url!;
    editLinkedInPresenter=EditProfilePresenter(this);
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
        appBar:  PreferredSize(
          preferredSize:  const Size(double.infinity, kToolbarHeight),
          child:CommonAppBar(title:UtilStrings.Edit_LinkedIn,action: false),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(width:size.width,height: size.height,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16,),
                    CommonTextField(controller: linkController,),
                    const SizedBox(height: 16,),
                  ],),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 30,left: 20,right: 20),
                child: CommonButton(text: "Save",
                onTap: (){
                 validation();
                  },
                )),
            Utils.progressDialog(context, isLoading)
          ],
        ),
      ),
    );
  }
  validation(){
    if(linkController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_enter_linkedln_url);
    }else{
     setState(() {
       isLoading=true;
       editLinkedInPresenter!.doEditLinkdin(linkController.text);

     });
    }
  }

  @override
  onSuccessResponse(SuccessResponse response) {
   if(response.status==200){
     Navigator.pop(context);
   }
   setState(() {
     isLoading=false;
   });
   CustomSnackBar.showSuccessSnackBar(context,message: response.message);
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
  onProfileUploadResponse(ProfileUploadResponse response) {
  }
}
