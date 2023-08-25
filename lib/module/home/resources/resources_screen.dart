import 'dart:io';

import 'package:emba/module/home/resources/widgets/resume_templates_screen.dart';
import 'package:emba/utils/constants/constants.dart';
import 'package:emba/utils/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/common/appbar/common_appBar.dart';
import '../../../widget/common/common_text_field.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Resources,searchAction: true,
        color: AppColor.black,
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GridView.builder(
                  itemCount: Constants.resources.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: (){
                      if(index==0){
                        addResourcesBottomSheet();
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumeTemplatesScreen(
                          name: Constants.resources[index].text,
                        )));
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Utils.image(image: Constants.resources[index].image,width:160,height: 160),
                          index==0?Positioned.fill(child: Utils.image(image: "circle_add_icon.png",width:50,height: 50)):
                              Container()
                          ],
                        ),
                        SizedBox(
                          width:120,
                          child: Utils.mediumHeadingNormalText(text: Constants.resources[index].text,
                              fontWeight: FontWeight.w600,
                              textSize: 12,overflow: TextOverflow.ellipsis),
                        )
                      ],),
                  );
                })
            ],),
          ),
        ),
      ),
    );
  }
  addResourcesBottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(25),
            topStart: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        context: context, builder: (ctxt){
      return StatefulBuilder(builder: (context,setState){
        return Container(
          height: MediaQuery.of(context).size.height-80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12,),
              Align(
                alignment: Alignment.center,
                child: Container(height: 8,width: 100,
                  decoration: BoxDecoration(
                      color: AppColor.grey_light,
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  const Icon(Icons.arrow_back,color: AppColor.grey,),
                  const SizedBox(width: 10,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Add_Resources,fontWeight: FontWeight.w600,
                      color: AppColor.grey,textSize: 14)
                ],),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Category,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(hint: UtilStrings.Startup_Discussion,height: 50,),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Tags,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Container(
                  height: 45,width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:AppColor.grey),
                  ),
                  child:Row(children: [
                    const SizedBox(width: 30,),
                    Container(height: 25,
                    width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color:AppColor.grey2),
                      ),
                      child: Center(
                        child: Utils.mediumHeadingNormalText(text: "CEO Resume",textSize: 12,
                        color: AppColor.grey),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Container(height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color:AppColor.grey2),
                      ),
                      child: Center(
                        child: Utils.mediumHeadingNormalText(text: "Latest",textSize: 12,
                            color: AppColor.grey),
                      ),
                    ),
                  ],) ,
                )
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Share_Link,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Container(height: 45,
                width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:AppColor.grey),
                  ),
                  child: const TextField(
                    cursorColor: AppColor.black,
                    style: TextStyle(fontSize: 14,),
                    decoration: InputDecoration(
                      hintText: "Type or paste any link",
                        contentPadding: EdgeInsets.only(bottom:6,right: 16,left: 16),
                        hintStyle: TextStyle(
                            fontSize: 12
                        ),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Description,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(height: 100,hint: UtilStrings.Create_Group_DES,length: 60,lines: 3,),
              ),
              const Spacer(),
              Utils.customDivider(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                          color: AppColor.appGreen,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Utils.mediumHeadingNormalText(text: UtilStrings.Done,
                            color: AppColor.white,textSize: 14,fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],),
              ),
              const SizedBox(height: 20,),
            ],),
        );
      });
    });
  }
}
