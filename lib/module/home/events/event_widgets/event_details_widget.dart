import 'package:flutter/material.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';

class EventDetailsWidgetScreen extends StatelessWidget {
  const EventDetailsWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  SizedBox(
        width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Utils.mediumHeadingNormalText(text: UtilStrings.About,
              textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
        ),
          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20),
            child: Utils.mediumHeadingNormalText(text: UtilStrings.GROUP_DETAILS_DES,
              textSize: 14,fontWeight: FontWeight.normal,textAlign: TextAlign.start),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20),
            child: Utils.mediumHeadingNormalText(text: UtilStrings.Panel_Members,
                textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
          ),
          const SizedBox(height: 16,),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.only(bottom:16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20,right: 20),
                    child: SizedBox(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Utils.image(image: "member_image.png",height: 50,width:50),
                          const SizedBox(width: 16,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6,),
                              Utils.mediumHeadingNormalText(text:"Glady",
                                  textSize: 14,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
                              const SizedBox(height: 6,),
                              Utils.mediumHeadingNormalText(text:UtilStrings.Panel_Members,
                                  textSize: 12,color: AppColor.grey,textAlign: TextAlign.start),
                              const SizedBox(height: 8,),
                              Utils.customDivider(),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Spacer(),
                          const Icon(Icons.more_vert)
                        ],),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Utils.customDivider(),
                ],
              ),
            );
          }),
          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20),
            child: Utils.mediumHeadingNormalText(text:UtilStrings.Date_time,
                textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20,top:10),
            child: Utils.mediumHeadingNormalText(text:"Feb 23, Friday at 11:00 AM",
                textSize: 14,textAlign: TextAlign.start),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20),
            child: Utils.mediumHeadingNormalText(text:UtilStrings.Location,
                textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20,top:10),
            child: Utils.mediumHeadingNormalText(text:"Melbourne Aus Canada Usa, Chiana",
                textSize: 14,textAlign: TextAlign.start),
          ),
          const SizedBox(height: 20,),
      ],),
    );
  }
}
