import 'package:emba/utils/string_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utils.dart';

class RequestWidgetScreen extends StatelessWidget {
  const RequestWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  SizedBox(
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20,bottom: 16),
            child: Utils.mediumHeadingNormalText(text:UtilStrings.Received_Requests,textSize: 14,fontWeight: FontWeight.w700),
          ),
          Utils.customDivider(),
          const SizedBox(height: 20,),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int index){
                return  SizedBox(width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(height: 50,width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColor.black,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Utils.image(image: "member_image.png",fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(height: 16,width: 16,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.grey),
                                    borderRadius: BorderRadius.circular(25),
                                    color: AppColor.white
                                  ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Utils.image(image: "arrow_down_app_green.png",height: 7,width: 7),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width/1.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 10,),
                                      Utils.mediumHeadingNormalText(text:"Robert Alwas",textSize: 14,fontWeight: FontWeight.w700),
                                      const Spacer(),
                                      SizedBox(
                                        height: 22,width: 22,
                                        child: PopupMenuButton(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          position: PopupMenuPosition.under,
                                          iconSize: 20,
                                          itemBuilder: (ctx) => [
                                            // _buildPopupMenuItem("report_icon.png",UtilStrings.Report,(){},),
                                            // _buildPopupMenuItem("block_icon.png",UtilStrings.Block_this_person,(){},),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:10,top: 4),
                                  child: Container(height: 20,width: 130,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: AppColor.grey2)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Utils.image(image: "expert.png",height: 12,width: 12),
                                        const SizedBox(width: 8),
                                        Utils.mediumHeadingNormalText(text: "${UtilStrings.Financial_Expert} +2",
                                            textSize:9,
                                            color: AppColor.black_2)
                                      ],),
                                  ),
                                ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10,top: 6),
                                      child: Utils.mediumHeadingNormalText(text: " Atlanta,2972 Web Bridge",
                                          textSize:10,textAlign:TextAlign.start,
                                          fontWeight: FontWeight.w400,color: Colors.grey),
                                    ),
                                const SizedBox(height: 12,),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: AppColor.appGreen)
                                      ),
                                      child: Center(
                                        child: Utils.mediumHeadingNormalText(text:UtilStrings.Accept,color: AppColor.appGreen,
                                            fontWeight: FontWeight.w600,textSize: 12),
                                      ),
                                    ),
                                    const SizedBox(width:12,),
                                    Container(
                                      height: 35,width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColor.profile_grey,
                                      ),
                                      child: Center(
                                        child: Utils.mediumHeadingNormalText(text:UtilStrings.Decline,color: AppColor.grey,
                                            fontWeight: FontWeight.w600,textSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],)
                          ],),
                      ),
                      const SizedBox(height:20,),
                      Utils.customDivider(),
                      const SizedBox(height:16,),

                    ],),
                );
              }),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,bottom: 16,top: 4),
              child: Utils.mediumHeadingNormalText(text:UtilStrings.Sent_Requests,textSize: 14,fontWeight: FontWeight.w700),
            ),
            Utils.customDivider(),
            const SizedBox(height:20,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context,int index){
                  return  SizedBox(width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.only(left:20,right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(height: 50,width: 50,
                                    decoration: BoxDecoration(
                                        color: AppColor.black,
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Utils.image(image: "member_image.png",fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(height: 16,width: 16,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: AppColor.grey),
                                          borderRadius: BorderRadius.circular(25),
                                          color: AppColor.white
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Utils.image(image: "arrow_down_app_green.png",height: 7,width: 7),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width/1.4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 10,),
                                        Utils.mediumHeadingNormalText(text:"Robert Alwas",textSize: 14,fontWeight: FontWeight.w700),
                                        const Spacer(),
                                        SizedBox(
                                          height: 22,width: 22,
                                          child: PopupMenuButton(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            position: PopupMenuPosition.under,
                                            iconSize: 20,
                                            itemBuilder: (ctx) => [
                                              // _buildPopupMenuItem("report_icon.png",UtilStrings.Report,(){},),
                                              // _buildPopupMenuItem("block_icon.png",UtilStrings.Block_this_person,(){},),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:10,top: 4),
                                    child: Container(height: 20,width: 130,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.image(image: "expert.png",height: 12,width: 12),
                                          const SizedBox(width: 8),
                                          Utils.mediumHeadingNormalText(text: "${UtilStrings.Financial_Expert} +2",
                                              textSize:9,
                                              color: AppColor.black_2)
                                        ],),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:10,top: 6),
                                    child: Utils.mediumHeadingNormalText(text: " Atlanta,2972 Web Bridge",
                                        textSize:10,textAlign:TextAlign.start,
                                        fontWeight: FontWeight.w400,color: Colors.grey),
                                  ),
                                  const SizedBox(height: 12,),
                                  SizedBox(
                                    width: size.width/1.6,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: AppColor.profile_grey,
                                            ),
                                            child: Center(
                                              child: Utils.mediumHeadingNormalText(text:UtilStrings.Cancel_Request,color: AppColor.grey,
                                                  fontWeight: FontWeight.w600,textSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],)
                            ],),
                        ),
                        const SizedBox(height:20,),
                        Utils.customDivider(),
                        const SizedBox(height:16,),

                      ],),
                  );
                }),
        ],),
      ),
    );
  }
}
