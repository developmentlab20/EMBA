import 'package:emba/model/term_condition_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import '../../utils/snackbar.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';
import 'interface/term_condition_interface.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> implements TermConditionInterface {
  bool isLoading=false;
  TermConditionPresenter? termConditionPresenter;
  String aboutUs="";
  @override
  void initState() {
    isLoading=true;
    termConditionPresenter=TermConditionPresenter(this);
    termConditionPresenter?.doAboutUS();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.About_Us,),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
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
                      Utils.mediumHeadingNormalText(
                          text: aboutUs,
                          textSize: 14,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.normal,
                          color: AppColor.black),
                    ],
                  ),
              ),
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
        aboutUs=response.data!.metaValue.toString();
        isLoading=false;
      });
    }
    //CustomSnackBar.showSuccessSnackBar(context,message: response.message.toString());
  }
}
