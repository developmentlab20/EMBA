import 'package:emba/model/profile/get_manage_contact_response.dart';
import 'package:emba/model/profile/profile_upload_response.dart';
import 'package:emba/module/home/profile/my_profile/manage_profile_detail/edit_contact_screen.dart';
import 'package:emba/utils/sharedpref/preferences.dart';
import 'package:emba/utils/sharedpref/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/route/route_name.dart';
import '../../../../../utils/snackbar.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import 'edit_presenter/manage_contact_presenter.dart';

class ManageContactScreen extends StatefulWidget {
  const ManageContactScreen({Key? key}) : super(key: key);

  @override
  _ManageContactScreenState createState() => _ManageContactScreenState();
}

class _ManageContactScreenState extends ResumableState<ManageContactScreen> implements GetManageContactInterface {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  GetManageContactPresenter ? getManageContactPresenter;
  bool isLoading=true;
  @override
  void initState() {
    getManageContactPresenter=GetManageContactPresenter(this);
    getManageContactPresenter!.doGetManageContact();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Manage_Contact,action: true,imageUrl: 'icon_edit.png',onTap: (){
         push(context, MaterialPageRoute(builder: (context)=>EditContactScreen(
            email: emailController.text,
            phone: phoneNumberController.text,
            city:  cityController.text,
            state: stateController.text,
          )));
        },),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(width:size.width,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16,),
                   Container(
                     padding: EdgeInsets.all(12),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color: AppColor.grey.withOpacity(0.3),
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Utils.mediumHeadingNormalText(text:SessionManager.getString(Preferences.USER_NAME),textSize: 14,
                                 fontWeight: FontWeight.w600,
                                 color: AppColor.black,textAlign: TextAlign.start),
                             Spacer(),
                             Utils.image(image: "icon_profile_share.png",height: 26,width: 26)
                           ],
                         ),
                         Utils.mediumHeadingNormalText(text:
                         phoneNumberController.text.isEmpty?
                         "Phone: N/A":
                         "Phone: "+phoneNumberController.text,textSize: 14,
                             fontWeight: FontWeight.w400,
                             color: AppColor.black,textAlign: TextAlign.start),
                         Utils.mediumHeadingNormalText(text:emailController.text.isEmpty?
                         "email: N/A":
                         "email: "+emailController.text,textSize: 14,
                             fontWeight: FontWeight.w400,
                             color: AppColor.black,textAlign: TextAlign.start),
                         Utils.mediumHeadingNormalText(text:
                         cityController.text.isEmpty?
                         "Address: N/A":
                         "Address: "+cityController.text+","+stateController.text,textSize: 14,
                             fontWeight: FontWeight.w400,
                             color: AppColor.black,textAlign: TextAlign.start),
                       ],
                     ),
                   ),
                    const SizedBox(height: 16,),
                    Utils.customTextFeildSetting(context,
                        UtilStrings.Phone_No,
                        UtilStrings.Phone_No,
                        phoneNumberController, false,
                        true,1),
                    const SizedBox(height: 16,),
                    Utils.customTextFeildSetting(context,
                        UtilStrings.Email,
                        UtilStrings.Email,
                        emailController, false,
                        true,1),
                    const SizedBox(height: 16,),
                    Utils.customTextFeildSetting(context,
                        UtilStrings.City,
                        UtilStrings.Enter_Here,
                        cityController, false,
                        true,1),
                    const SizedBox(height: 16,),
                    Utils.customTextFeildSetting(context,
                        UtilStrings.State,
                        UtilStrings.Enter_Here,
                        stateController, false,
                        true,1),
                  ],),
              ),
            ),
          ),
          Utils.progressDialog(context, isLoading),
        ],
      ),
    );
  }

  @override
  onError(String msg, int status) {
    if (status == 401) {
      Utils.sessionExpire(context);
    }
    setState(() {
      isLoading = false;
    });
    if(status==404){

    }else {
      CustomSnackBar.showSuccessSnackBar(context, message: msg.toString());
    }
  }
  @override
  onSuccessResponse(GetManageContactResponse response) {
    if(response.status==200){
      setState(() {
        phoneNumberController.text =response.data!.phone.toString();
        emailController.text = response.data!.email.toString();
        cityController.text=response.data!.city.toString();
        stateController.text= response.data!.state.toString();
        isLoading=false;
      });
    }
  }
  @override
  void onResume() {
    getManageContactPresenter!.doGetManageContact();
    super.onResume();
  }
}
