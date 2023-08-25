import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
class OtherOrganizationScreen extends StatefulWidget {
  const OtherOrganizationScreen({Key? key}) : super(key: key);

  @override
  _OtherOrganizationScreenState createState() => _OtherOrganizationScreenState();
}

class _OtherOrganizationScreenState extends State<OtherOrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Organizational_Details,action: false),
      ),
      body: SizedBox(width:size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (BuildContext context,int index){
                      return    Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColor.grey.withOpacity(0.4)
                                ),
                              ),
                              const SizedBox(width:10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Utils.mediumHeadingNormalText(text:"Job title",textSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.black,textAlign: TextAlign.start),
                                  Row(
                                    children: [
                                      Utils.mediumHeadingNormalText(text:"Company name",textSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.grey,textAlign: TextAlign.start),
                                      const SizedBox(width:10,),
                                      Container(
                                        height: 6,
                                        width: 6,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: AppColor.grey.withOpacity(0.6)
                                        ),
                                      ),
                                      const SizedBox(width:10,),
                                      Utils.mediumHeadingNormalText(text:"Industry",textSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.grey,textAlign: TextAlign.start),
                                    ],
                                  ),
                                  Utils.mediumHeadingNormalText(text:"Job Level",textSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grey,textAlign: TextAlign.start),
                                  Utils.mediumHeadingNormalText(text:"Job Function",textSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grey,textAlign: TextAlign.start),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height:10,),
                          const Divider(thickness: 1,),
                          const SizedBox(height:10,),
                        ],
                      );
                    }),
              ),
            ],),
        ),
      ),
    );
  }
}