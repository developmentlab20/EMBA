import 'package:emba/utils/route/route_name.dart';
import 'package:emba/widget/common/common_button.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';

class NetworkFilterScreen extends StatefulWidget {
  const NetworkFilterScreen({Key? key}) : super(key: key);

  @override
  State<NetworkFilterScreen> createState() => _NetworkFilterScreen();
}

class _NetworkFilterScreen extends State<NetworkFilterScreen> {
  bool checkBoxOne=false;
  bool checkBoxTwo=false;
  bool locationCheckBoxOne=false;
  bool locationCheckBoxTwo=false;
  bool schoolOneValue=false;
  bool schoolTwoValue=false;
  bool schoolThreeValue=false;
  bool jobFunctionOne=false;
  bool jobFunctionTwo=false;
  bool jobFunctionThree=false;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Filters,),
      ),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  Utils.mediumHeadingNormalText(text: UtilStrings.Industry,
                      fontWeight: FontWeight.bold,textSize:16),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RouteName.IndustryScreen);
                    },
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.View_More,color: AppColor.grey,
                        fontWeight: FontWeight.w400,textSize:14),
                  ),
                  const SizedBox(width: 8,),
                  const Icon(Icons.arrow_forward_rounded,color: AppColor.grey,)
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  const Icon(Icons.search,color: AppColor.grey,),
                  const SizedBox(width: 12,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Search,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:14),
                ],),
              ),
              const SizedBox(height: 12,),
              Utils.customDivider(),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: checkBoxOne,
                      onChanged: (value){
                        if(checkBoxOne==false){
                          setState(() {
                            checkBoxOne=true;
                          });
                        }else{
                          setState(() {
                            checkBoxOne=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Management_of_Companies_and_Enterprises,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: checkBoxTwo,
                      onChanged: (value){
                        if(checkBoxTwo==false){
                          setState(() {
                            checkBoxTwo=true;
                          });
                        }else{
                          setState(() {
                            checkBoxTwo=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Real_Estate_and_Rental_and_Leasing,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  Utils.mediumHeadingNormalText(text: UtilStrings.Location,
                      fontWeight: FontWeight.bold,textSize:16),
                  const Spacer(),
                  Utils.mediumHeadingNormalText(text: UtilStrings.View_More,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:14),
                  const SizedBox(width: 8,),
                  const Icon(Icons.arrow_forward_rounded,color: AppColor.grey,)
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  const Icon(Icons.search,color: AppColor.grey,),
                  const SizedBox(width: 12,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Search,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:14),
                ],),
              ),
              const SizedBox(height: 12,),
              Utils.customDivider(),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: locationCheckBoxOne,
                      onChanged: (value){
                        if(locationCheckBoxOne==false){
                          setState(() {
                            locationCheckBoxOne=true;
                          });
                        }else{
                          setState(() {
                            locationCheckBoxOne=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Management_of_Companies_and_Enterprises,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: locationCheckBoxTwo,
                      onChanged: (value){
                        if(locationCheckBoxTwo==false){
                          setState(() {
                            locationCheckBoxTwo=true;
                          });
                        }else{
                          setState(() {
                            locationCheckBoxTwo=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Real_Estate_and_Rental_and_Leasing,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),





              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  Utils.mediumHeadingNormalText(text: UtilStrings.School,
                      fontWeight: FontWeight.bold,textSize:16),
                  const Spacer(),
                  Utils.mediumHeadingNormalText(text: UtilStrings.View_More,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:14),
                  const SizedBox(width: 8,),
                  const Icon(Icons.arrow_forward_rounded,color: AppColor.grey,)
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  const Icon(Icons.search,color: AppColor.grey,),
                  const SizedBox(width: 12,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Search,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:14),
                ],),
              ),
              const SizedBox(height: 12,),
              Utils.customDivider(),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: schoolOneValue,
                      onChanged: (value){
                        if(schoolOneValue==false){
                          setState(() {
                            schoolOneValue=true;
                          });
                        }else{
                          setState(() {
                            schoolOneValue=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Management_of_Companies_and_Enterprises,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: schoolTwoValue,
                      onChanged: (value){
                        if(schoolTwoValue==false){
                          setState(() {
                            schoolTwoValue=true;
                          });
                        }else{
                          setState(() {
                            schoolTwoValue=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Real_Estate_and_Rental_and_Leasing,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: schoolThreeValue,
                      onChanged: (value){
                        if(schoolThreeValue==false){
                          setState(() {
                            schoolThreeValue=true;
                          });
                        }else{
                          setState(() {
                            schoolThreeValue=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Arts_Entertainment_and_recreation,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  Utils.mediumHeadingNormalText(text: UtilStrings.Job_Function,
                      fontWeight: FontWeight.bold,textSize:16),
                  const Spacer(),
                  Utils.mediumHeadingNormalText(text: UtilStrings.View_More,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:14),
                  const SizedBox(width: 8,),
                  const Icon(Icons.arrow_forward_rounded,color: AppColor.grey,)
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  const Icon(Icons.search,color: AppColor.grey,),
                  const SizedBox(width: 12,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Search,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:14),
                ],),
              ),
              const SizedBox(height: 12,),
              Utils.customDivider(),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: jobFunctionOne,
                      onChanged: (value){
                        if(jobFunctionOne==false){
                          setState(() {
                            jobFunctionOne=true;
                          });
                        }else{
                          setState(() {
                            jobFunctionOne=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Management_of_Companies_and_Enterprises,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: jobFunctionTwo,
                      onChanged: (value){
                        if(jobFunctionTwo==false){
                          setState(() {
                            jobFunctionTwo=true;
                          });
                        }else{
                          setState(() {
                            jobFunctionTwo=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Real_Estate_and_Rental_and_Leasing,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 8,),
              Utils.customDivider(),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 20),
                child: Row(children: [
                  Checkbox(
                      activeColor: AppColor.appGreen,
                      value: jobFunctionThree,
                      onChanged: (value){
                        if(jobFunctionThree==false){
                          setState(() {
                            jobFunctionThree=true;
                          });
                        }else{
                          setState(() {
                            jobFunctionThree=false;
                          });
                        }
                      }),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Arts_Entertainment_and_recreation,color: AppColor.grey,
                      fontWeight: FontWeight.w400,textSize:12),
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonButton(
                  text: UtilStrings.Apply,
                  onTap:(){
                    Navigator.pushNamed(context, RouteName.NetworkFilterApplyScreen);
                  },
                ),
              ),
              const SizedBox(height: 20,),
            ],),
        ),
      ),
    );
  }
}
