import 'package:flutter/material.dart';

import '../../../../../../utils/color_utils.dart';
import '../../../../../../utils/string_utils.dart';
import '../../../../../../utils/utils.dart';
import 'jobs_details/jobs_detail_screen.dart';

class JobsWidgetScreen extends StatefulWidget {
  const JobsWidgetScreen({Key? key}) : super(key: key);

  @override
  State<JobsWidgetScreen> createState() => _JobsWidgetScreenState();
}

class _JobsWidgetScreenState extends State<JobsWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int index){
            return Column(children: [
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
                          Utils.mediumHeadingNormalText(text:UtilStrings.Posted_by ,textSize:12,
                              color: AppColor.grey,fontWeight: FontWeight.w500),
                          const SizedBox(width: 8,),
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.grey2),
                                borderRadius: BorderRadius.circular(4)
                            ),
                            child: Row(children: [
                              const SizedBox(width: 4,),
                              Utils.image(image: "deco_icon.png",height: 12,width: 12),
                              const SizedBox(width: 4,),
                              Utils.mediumHeadingNormalText(text:"Geniusmesh",textSize:10,
                                  color: AppColor.grey,fontWeight: FontWeight.w500),
                              const SizedBox(width: 4,),
                            ],),
                          ),
                          const SizedBox(width: 4,),
                          Padding(
                            padding: const EdgeInsets.only(left:6,right: 6),
                            child: Container(height: 4,width: 4,
                              decoration: BoxDecoration(
                                  color: AppColor.grey,borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                          const SizedBox(width: 4,),
                          Utils.mediumHeadingNormalText(text:"17h ago",textSize:12,
                              color: AppColor.grey,fontWeight: FontWeight.w500),
                        ]
                        ),
                        const SizedBox(height: 16,),
                        Container(
                          width: size.width/1.5,
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>const JobsDetailScreen()));
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: AppColor.appGreen,
                                        )
                                    ),
                                    child: Center(
                                      child: Utils.mediumHeadingNormalText(text:UtilStrings.View,textSize:14,
                                          color: AppColor.appGreen,fontWeight: FontWeight.w500),
                                    ),
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

                      ],),
                    const Spacer(),
                    const Icon(Icons.more_vert)
                  ],),
              ),
              const SizedBox(height: 20,),
              Utils.customDivider(),
            ],);
          }),
          SizedBox(height: 50,),
        ],
      )
    );
  }
}
