import 'package:flutter/material.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';

class CreatorWidgetScreen extends StatelessWidget {
  const CreatorWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  SizedBox(
      width: size.width,
      child: Column(children: [
        const SizedBox(height: 20,),
        Container(height: 60,width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color:AppColor.orage)
          ),
          child: Utils.image(image: "member_image.png"),
        ),
        const SizedBox(height: 8,),
        Utils.mediumHeadingNormalText(text: "#1 Cody Fisher",fontWeight: FontWeight.w600,textSize: 14),
        const SizedBox(height: 8,),
        Container(height: 20,width:110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.grey2)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.image(image: "expert.png",height: 12,width: 12),
              const SizedBox(width: 8),
              Utils.mediumHeadingNormalText(text: "Group Leader",textSize:8,
                  color: AppColor.black_2)
            ],),
        ),
        const SizedBox(height: 8,),
        Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",textSize: 12,
            color: AppColor.grey),
        const SizedBox(height: 8,),
        Container(
          height: 35,width: 80,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.appGreen),
              borderRadius: BorderRadius.circular(25)
          ),
          child:  Center(
            child: Utils.mediumHeadingNormalText(text:UtilStrings.Connect,textSize: 12,
                color: AppColor.appGreen,fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height:30,),
        ListView.builder(
            shrinkWrap: true,
            itemCount: Constants.influencerList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context,int index){
              int count=index+2;
              return Padding(
                padding: const EdgeInsets.only(bottom:20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20,right:20,bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  const EdgeInsets.only(top:18),
                            child: Utils.mediumHeadingNormalText(text:"#$count",fontWeight: FontWeight.w600,textSize: 14),
                          ),
                          const SizedBox(width: 16,),
                          Container(height: 48,width:48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color:AppColor.grey)
                            ),
                            child: Utils.image(image:  Constants.influencerList[index].imageUrl),
                          ),
                          const SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 3,),
                              Utils.mediumHeadingNormalText(text:  Constants.influencerList[index].text,fontWeight: FontWeight.w600,textSize: 14),
                              const SizedBox(height:5,),
                              Constants.influencerList[index].value==true?
                              Container(height: 20,width:110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColor.grey2)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Utils.image(image: "expert.png",height: 12,width: 12),
                                    const SizedBox(width: 8),
                                    Utils.mediumHeadingNormalText(text: "Group Leader",textSize:8,
                                        color: AppColor.black_2)
                                  ],),
                              )
                                  :Container(),

                              SizedBox(height:Constants.influencerList[index].value==true?5:0,),
                              Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",textSize: 10,
                                  color: AppColor.grey),
                            ],),
                          const Spacer(),
                          Constants.influencerList[index].value==true?
                          Container(
                            height: 35,width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.appGreen),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child:  Center(
                              child: Utils.mediumHeadingNormalText(text:UtilStrings.Connect,textSize: 12,
                                  color: AppColor.appGreen,fontWeight: FontWeight.w600),
                            ),
                          ):Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Utils.image(image: "ic_comment.png",height: 22,width: 22),
                          ),
                        ],),
                    ),
                    Utils.customDivider(),
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Container(
            width:size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.white_light
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:12,right: 12,top: 8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.image(image: "null_icon.png",height: 16,width: 16),
                      const SizedBox(width: 12,),
                      Utils.mediumHeadingNormalText(text:UtilStrings.How_we_rank,
                          textSize: 14,fontWeight: FontWeight.w600),
                      const Spacer(),
                      const Icon(Icons.close,color: AppColor.grey,size:18,)
                    ],),
                  const SizedBox(height:2,),
                  Utils.mediumHeadingNormalText(text:UtilStrings.Influencer_DES,
                      textSize: 12,color: AppColor.grey),
                  const SizedBox(height:10,),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16,)
      ],),
    );
  }
}
