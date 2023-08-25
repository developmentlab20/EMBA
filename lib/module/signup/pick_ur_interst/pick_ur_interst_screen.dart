import 'package:emba/model/get_collage_response.dart';
import 'package:emba/model/get_interest_response.dart';
import 'package:emba/model/get_school_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/module/signup/signup_presenter.dart';
import 'package:flutter/material.dart';
import '../../../model/bool_text.dart';
import '../../../model/signup_response.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/route/route_name.dart';
import '../../../utils/sharedpref/preferences.dart';
import '../../../utils/sharedpref/shared_prefrence.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/common/common_button.dart';
import '../../home/profile/my_profile/manage_profile_detail/edit_education.dart';
import '../other_details_verification/setup_education_details.dart';

class PickInterstScreen extends StatefulWidget {
  String? name,schoolName,email,password,collageName,linkdln;
   PickInterstScreen({Key? key,this.name,this.email,this.password,this.schoolName,this.collageName,this.linkdln}) : super(key: key);
  @override
  State<PickInterstScreen> createState() => _PickInterstScreenState();
}
class _PickInterstScreenState extends State<PickInterstScreen> implements SignupInterface{
  SignupPresenter? signupPresenter;
  bool isLoading=false;
  // List<Data>? interstList;
  List<PickupYourInterstModel> interstList=[];
  List<String> setDataInterst=[];
  @override
  void initState() {
    signupPresenter=SignupPresenter(this);
      isLoading=true;
    signupPresenter!.doGetInterest("20","1");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(left:20,right: 20),
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
                      child: Utils.mediumHeadingNormalText(text: UtilStrings.Pick_your_interest,
                          fontWeight: FontWeight.bold,textSize:16),
                    ),
                  ],
                ),
                const SizedBox(height:2,),
                Padding(
                  padding: const EdgeInsets.only(left:30),
                  child: Utils.mediumHeadingNormalText(text: UtilStrings.Select_up_to_3_topics,
                      color: AppColor.grey,textSize:12,textAlign:TextAlign.start),
                ),
                  const SizedBox(height:16,),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: interstList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing:16,
                          crossAxisSpacing:12,
                          crossAxisCount: 2,
                          childAspectRatio:3), itemBuilder: (BuildContext context,int index){
                    return GestureDetector(onTap: (){
                      if(interstList[index].value==false){
                        setState((){
                          interstList[index].value=true;
                        });
                      }else{
                        setState(() {
                          interstList[index].value=false;
                        });
                      }
                    },
                      child: Container(
                             decoration: BoxDecoration(
                               color:interstList[index].value==true?AppColor.light_green:AppColor.white,
                               border: Border.all(
                                 color: interstList[index].value==true?AppColor.appGreen:AppColor.grey,),
                               borderRadius: BorderRadius.circular(8)
                             ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.mediumHeadingNormalText(text:interstList[index].text,
                                color:interstList[index].value==true?
                            AppColor.black:AppColor.grey,textSize: 12,fontWeight:interstList[index].value==true?
                                FontWeight.w600:FontWeight.w500),
                            SizedBox(width: interstList[index].value==true?8:0,),
                            interstList[index].value==true?
                            Icon(Icons.check,color: AppColor.appGreen,size: 16,):SizedBox()
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height:30,),
                  CommonButton(text: UtilStrings.Confirm,onTap: (){
                    validation();
                  },),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 8,width:8,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.appGreen),
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      const SizedBox(width:6,),
                      Container(height: 8,width:30,
                        decoration: BoxDecoration(
                            color: AppColor.appGreen,
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ],),
                  const SizedBox(height: 20,),
              ],),
            ),
          ),
          Utils.progressDialog(context, isLoading)
        ],
      ),
      floatingActionButton: GestureDetector(onTap: (){

      },
        child: Container(
          height: 50,width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.14),blurRadius: 50)]
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.image(image: "arrow_down_icon.png",height:20),
            ],
          ),
        ),
      )
    );
  }
  validation(){
    for(int i=0;i<interstList.length;i++){
        if(interstList[i].value==true){
          setState(() {
            setDataInterst.add(interstList[i].id.toString());
          });
        }
      }
       if(setDataInterst.isEmpty){
         CustomSnackBar.showErrorSnackBar(context, message: UtilStrings.Please_Select_your_interst);
       }else{
         setState(() {
           isLoading=true;
         });
         signupPresenter!.doRegister(false, widget.email.toString(), widget.name.toString(), "00",widget.linkdln.toString(),
             widget.password.toString(), widget.schoolName.toString(), widget.collageName.toString(),
             setDataInterst);
       }
    }



  @override
  onError(String msg, int status) {
    setState(() {
      setDataInterst.clear();
      isLoading=false;
    });
    CustomSnackBar.showErrorSnackBar(context,message: msg);
    if(status==401){
      Utils.sessionExpire(context);
    }
  }

  @override
  onSuccessInterest(GetInterestResponse response) {
  if(response.status==200){
   setState(() {
   for(var data in response.data!){
     PickupYourInterstModel interstModel =PickupYourInterstModel(text: data.name.toString(), value: false,id:data.sId);
     interstList.add(interstModel);
   }
     isLoading=false;
    });
   }
  }

  @override
  onSuccessRespnse(SignupResponse response) {
    setState(() {
      isLoading=false;
    });
    // signupPresenter!.doEditDes();
    if(response.status==200){
      SessionManager.setString(Preferences.ACCESS_TOKEN, response.jwtToken.toString());
      SessionManager.setBoolean(Preferences.USER_LOGIN, true);
      SessionManager.setString(Preferences.USER_NAME, widget.name.toString());
      SessionManager.setString(Preferences.EMAIL, widget.email.toString());
      CustomSnackBar.showSuccessSnackBar(context,message: response.message);
      Navigator.pushNamed(context, RouteName.SetudEducationsDetailsScreen);
    }
  }

  @override
  onSuccess(SuccessResponse response) {

  }

  @override
  onSuccessGetCollage(GetCollageResponse response) {

  }

  @override
  onSuccessGetSchool(GetSchoolResponse response) {

  }
}
