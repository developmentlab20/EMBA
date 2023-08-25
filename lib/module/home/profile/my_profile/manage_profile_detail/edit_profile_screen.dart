import 'dart:convert';
import 'dart:io';

import 'package:emba/model/profile/profile_upload_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/snackbar.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../../../../widget/common/common_button.dart';
import 'edit_presenter/edit_linkedin_presenter.dart';
import 'dart:io' as io;
class EditProfileScreen extends StatefulWidget {
  String? email,name,des;
   EditProfileScreen({Key? key,this.name,this.des,this.email}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>implements EditLinkedinInterface {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ImagePicker imagePicker =ImagePicker();
  var fileImage;
  bool isLoading =false;
  EditProfilePresenter? editProfilePresenter;
  @override
  void initState() {
    editProfilePresenter=EditProfilePresenter(this);
  nameController.text= widget.name!;
  emailController.text= widget.email!;
  descriptionController.text=widget.des!=null?widget.des.toString():"";
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Edit_Profile,action: false),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: SizedBox(width:size.width,height: size.height,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Stack(
                        children: [
                          Container(
                            height: 85,width: 85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColor.white_light
                            ),
                            child: fileImage==null?
                                Icon(Icons.person)
                                : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(fileImage,fit: BoxFit.cover,),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: -34,
                              child: RawMaterialButton(
                                onPressed: () async{
                                  final XFile? image= await imagePicker.pickImage(source: ImageSource.gallery);
                                  if(image!=null){
                                    setState(() {
                                      fileImage=File(image.path);
                                      final bytes = File(image!.path).readAsBytesSync();
                                      String base64Image =  base64Encode(bytes);



                                      setState(() {
                                        isLoading=true;
                                        editProfilePresenter?.doEditProfilePhoto(base64Image.toString());
                                      });

                                    });
                                  }
                                },
                                elevation: 0.0,
                                fillColor: Color(0xFFF5F6F9),
                                child: Utils.image(image: "icon_edit.png",height: 12,width: 12),
                                padding: EdgeInsets.all(8.0),
                                shape: CircleBorder(),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Utils.customTextFeildSetting(context,
                        UtilStrings.Name,
                        UtilStrings.Name,
                        nameController, false,
                        false,1),
                    const SizedBox(height: 16,),
                    Utils.customTextFeildSetting(context,
                        UtilStrings.Email,
                        UtilStrings.Email,
                        emailController, false,
                        true,1),
                    const SizedBox(height: 16,),
                    Utils.customTextFeildSetting(context,
                        UtilStrings.Description,
                        UtilStrings.Description,
                        descriptionController, false,
                        false,6),
                    const SizedBox(height: 16,),
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
    );
  }
  validation(){
    if(nameController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context,message:UtilStrings.Please_enter_name);

    }else if(descriptionController.text.trim().isEmpty){
      CustomSnackBar.showErrorSnackBar(context,message:UtilStrings.Enter_Description);
    }else {
      setState(() {
        isLoading=true;
      });
    editProfilePresenter!.doEditProfile(nameController.text, descriptionController.text);
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
    if(response.status==200){
      CustomSnackBar.showSuccessSnackBar(context, message: response.message.toString());
    }
  }
}
