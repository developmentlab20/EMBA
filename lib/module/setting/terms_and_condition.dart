import 'package:emba/model/term_condition_response.dart';
import 'package:emba/utils/snackbar.dart';
import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';
import 'interface/term_condition_interface.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  _TermsAndConditionScreenState createState() => _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen>implements TermConditionInterface {
  bool isLoading=false;
  TermConditionPresenter? termConditionPresenter;
  String termCondition="";
  @override
  void initState() {
    isLoading=true;
    termConditionPresenter=TermConditionPresenter(this);
    termConditionPresenter!.doTermCondition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Terms_condition,),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20,),
             Container(
               margin: const EdgeInsets.only(left: 20,right: 20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Utils.mediumHeadingNormalText(
                       text: UtilStrings.Heading,
                       textSize: 14,
                       fontWeight: FontWeight.w500,
                       color: AppColor.black),
                   const SizedBox(height: 22,),
                   Utils.mediumHeadingNormalTextHeight(
                       text: termCondition,
                       textSize: 14,
                       fontWeight: FontWeight.normal,
                       textAlign: TextAlign.left,
                       color: AppColor.black),

                 ],
               ),
             )
            ],
          ),
          Utils.progressDialog(context, isLoading)
        ],
      ),
    );
  }

  @override
  onError(String msg, int status) {
    if(status==401){
      Utils.sessionExpire(context);
    }
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showErrorSnackBar(context,message: msg.toString());
  }

  @override
  onSuccessRespnse(TermConditionResponse response) {
   if(response.status==200){
     setState(() {
       termCondition=response.data!.metaValue.toString();
       isLoading=false;
     });
   }
  }
}
