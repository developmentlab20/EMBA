import 'package:flutter/material.dart';

import '../../../../../../utils/color_utils.dart';
import '../../../../../../utils/constants/constants.dart';
import '../../../../../../utils/string_utils.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../../widget/common/appbar/common_appBar.dart';

class JobsDetailScreen extends StatefulWidget {
  const JobsDetailScreen({Key? key}) : super(key: key);

  @override
  State<JobsDetailScreen> createState() => _JobsDetailScreenState();
}

class _JobsDetailScreenState extends State<JobsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return  Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Jobs_Details,action: true,),
      ),
      body:  SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20,top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppColor.grey_light,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.image(image: "bag_icon.png",height: 24,width: 24)
                          ],
                        )
                    ),
                    const SizedBox(width: 16,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height:6,),
                        Utils.mediumHeadingNormalText(text:"Product Designer L3",textSize:14,
                            fontWeight: FontWeight.w500),
                        const SizedBox(height: 4,),
                        Row(children: [
                          const Icon(Icons.location_on_outlined,color: AppColor.grey,size:20,),
                          const SizedBox(width: 6,),
                          Utils.mediumHeadingNormalText(text:"Atlanta,2972 Web Bridge",textSize:12,
                              color: AppColor.grey,fontWeight: FontWeight.w500),
                        ],),
                        const SizedBox(height: 6,),
                        Row(children: [
                          Utils.image(image: "ic_timer.png",height: 14,width:14 ),
                          const SizedBox(width:9,),
                          Utils.mediumHeadingNormalText(text:"Full - Time",textSize:12,
                              color: AppColor.grey,fontWeight: FontWeight.w500),
                          const SizedBox(width: 8,),
                          Container(height:10,width: 2,
                            color: AppColor.grey,
                          ),
                          const SizedBox(width: 8,),
                          Utils.mediumHeadingNormalText(text:"On - Site",textSize:12,
                              color: AppColor.grey,fontWeight: FontWeight.w500),
                        ],),
                        const SizedBox(height: 6,),
                        Row(children: [
                          Utils.image(image: "person_icon.png",height: 14,width:14),
                          const SizedBox(width: 9,),
                          Utils.mediumHeadingNormalText(text:"Posted",textSize:12,
                              color: AppColor.grey,fontWeight: FontWeight.w500),
                          const SizedBox(width: 4,),
                          Utils.mediumHeadingNormalText(text:"17h ago",textSize:12,
                              color: AppColor.grey,fontWeight: FontWeight.w500),
                        ]
                        ),
                        const SizedBox(height: 16,),
                        GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            width: size.width/1.5,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: AppColor.appGreen,
                                        )
                                    ),
                                    child: Center(
                                      child: Utils.mediumHeadingNormalText(text:UtilStrings.Interested,textSize:14,
                                          color: AppColor.appGreen,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(width:10,),
                                Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: AppColor.grey_light,
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Utils.image(image: "m_icon.png",height: 18,width: 18)
                                      ],
                                    )
                                ),
                                const SizedBox(width:10,),
                                Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: AppColor.grey_light,
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Utils.image(image: "share_icon.png",height: 18,width: 18)
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],),
                    const Spacer(),
                    const Icon(Icons.more_vert)
                  ],),
              ),
              const SizedBox(height: 20,),
              Utils.customDivider(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text:"Posted by",textSize:16,
                    color: AppColor.black,fontWeight: FontWeight.w700),
              ),
        Padding(
          padding: const EdgeInsets.only(bottom:12),
          child: Column(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){


                },
                child: Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Column(
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: (){

                              },
                              child: const Icon(Icons.more_vert,size:20,))
                        ],),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Utils.image(image:"demo_image.png",height:60,width:60)),
                          const SizedBox(width: 16,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height:8 ,),
                              Utils.mediumHeadingNormalText(text:"Naman Rastogi",
                                fontWeight: FontWeight.w600,),
                              const SizedBox(height:3,),
                              SizedBox(
                                width: size.width/1.5,
                                child: Row(children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width/1.5,
                                        child: Row(
                                          children: [
                                        
                                            Container(height: 25,width:110,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  border: Border.all(color: AppColor.grey2)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Utils.image(image: "shield_icon.png",height: 12,width: 12),
                                                  const SizedBox(width: 8),
                                                  Utils.mediumHeadingNormalText(text: "Group Leader",textSize:8,
                                                      color: AppColor.black_2)
                                                ],),
                                            ),
                                            const SizedBox(width: 10,),
                                            
                                            Container(height: 25,width: 110,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  border: Border.all(color: AppColor.grey2)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Utils.image(image: "expert.png",height: 12,width: 12),
                                                  const SizedBox(width: 8),
                                                  Utils.mediumHeadingNormalText(text:UtilStrings.Financial_Expert+" +2",textSize:8,
                                                      color: AppColor.black_2)
                                                ],),
                                            )
                                           
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height:6,),
                               
                                      Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",
                                          fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey),
                                    ],),

                                ],),
                              )
                            ],)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Utils.customDivider()
            ],
          ),
        ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text:UtilStrings.Description,textSize:16,
                    color: AppColor.black,fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text:UtilStrings.Group_Details_Des,textSize:16,
                    color: AppColor.black,fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
     ),
    );
  }
}
