import 'package:emba/utils/route/route_name.dart';
import 'package:emba/widget/common/common_button.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool checkBoxOne=false;
  bool checkBoxTwo=false;
  bool locationCheckBoxOne=false;
  bool locationCheckBoxTwo=false;
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
              padding: const EdgeInsets.only(left:20),
              child: Utils.mediumHeadingNormalText(text: UtilStrings.Badges,
                  fontWeight: FontWeight.bold,textSize:16),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.filterBadges.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing:16,
                      crossAxisSpacing:12,
                      crossAxisCount: 2,
                      childAspectRatio:3), itemBuilder: (BuildContext context,int index){
                return GestureDetector(onTap: (){
                  if(Constants.filterBadges[index].value==false){
                    setState((){
                      Constants.filterBadges[index].value=true;
                    });
                  }else{
                    setState(() {
                      Constants.filterBadges[index].value=false;
                    });
                  }
                },
                  child: Container(
                    decoration: BoxDecoration(
                        color:Constants.filterBadges[index].value==true?AppColor.light_green:AppColor.white,
                        border: Border.all(
                          color: Constants.filterBadges[index].value==true?AppColor.appGreen:AppColor.grey,),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Utils.mediumHeadingNormalText(text:Constants.filterBadges[index].text,
                            color:Constants.filterBadges[index].value==true?
                            AppColor.black:AppColor.grey,textSize: 12,fontWeight:Constants.filterBadges[index].value==true?
                            FontWeight.w600:FontWeight.w500),
                        SizedBox(width: Constants.filterBadges[index].value==true?8:0,),
                        Constants.filterBadges[index].value==true?
                        Icon(Icons.check,color: AppColor.appGreen,size: 16,):SizedBox()
                      ],
                    ),
                  ),
                );
              }),
            ),
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
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonButton(
                  text: UtilStrings.Apply,
                  onTap: (){
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
