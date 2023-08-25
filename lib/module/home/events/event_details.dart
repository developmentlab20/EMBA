import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/common/appbar/common_appBar.dart';
import 'event_widgets/event_details_widget.dart';
import 'event_widgets/events_all_widgets_screen.dart';

class EventDetailsScreen extends StatefulWidget {
  int? type;
   EventDetailsScreen({Key? key,this.type}) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Event_Details,searchAction: true,onTap: (){
          bottomSheet();
        },),
      ),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Utils.image(image:"event_image_1.png"),
                ),
                const SizedBox(height:20,),
                Padding(
                  padding: const EdgeInsets.only(left:16,right:16),
                  child: Row(children: [
                    Utils.image(image: "timer_icon.png",height: 18,width: 18),
                    const SizedBox(width:8,),
                    Utils.mediumHeadingNormalText(text:"Feb 23, Fri, 11:30 PM",color: AppColor.grey,
                        fontWeight: FontWeight.w400,textSize:14),
                    const SizedBox(width:12,),
                    const Icon(Icons.location_on_outlined,color: AppColor.grey,),
                    const SizedBox(width:2,),
                    Utils.mediumHeadingNormalText(text:"Online",color: AppColor.grey,
                        fontWeight: FontWeight.w400,textSize:14),
                  ],),
                ),
                const SizedBox(height:16,),
                Padding(
                  padding: const EdgeInsets.only(left:16,right: 16),
                  child: Utils.mediumHeadingNormalText(text: UtilStrings.Private_Equity_Understanding,
                      textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
                ),
                const SizedBox(height:20,),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 22,width: 22,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Utils.image(image: "demo_image.png",fit: BoxFit.contain))),
                      const SizedBox(width:8,),
                      Utils.mediumHeadingNormalText(text:"Sanjay Malik",color: AppColor.grey,
                          fontWeight: FontWeight.w400,textSize:12),
                      const SizedBox(width:14,),
                      SizedBox(
                          height: 16,width: 16,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Utils.image(image: "ic_people.png",fit: BoxFit.contain))),
                      const SizedBox(width:8,),
                      Utils.mediumHeadingNormalText(text:"650 Attendees",color: AppColor.grey,
                          fontWeight: FontWeight.w400,textSize:12),
                    ],
                  ),
                ),
                const SizedBox(height:16,),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Container(
                    width:size.width,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    color: AppColor.grey_light
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:12,right: 12,top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Utils.image(image: "null_icon.png",height: 16,width: 16),
                          const SizedBox(width: 16,),
                          Padding(
                            padding: const EdgeInsets.only(top:6),
                            child: Utils.mediumHeadingNormalText(text:UtilStrings.People_from_your_industry_are_attending,
                            textSize: 12,color: AppColor.grey
                            ),
                          )
                      ],),
                    ),
                  ),
                ),
                const SizedBox(height:16,),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
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
                                child: Utils.mediumHeadingNormalText(text:UtilStrings.Attend,textSize:14,
                                    color: AppColor.appGreen,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
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
                                Utils.image(image: "bell_grey_icon.png",height: 18,width: 18)
                              ],
                            )
                        ),const SizedBox(width: 8,),
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
                const SizedBox(height:20,),
                Utils.customDivider(),
                const SizedBox(height: 22,),
                widget.type==0?
                Container(
                    height: 55,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        boxShadow: [BoxShadow(
                            color:Color.fromRGBO(0, 0, 0, 0.14,),blurRadius:2
                        )]
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20,right:20
                      ),
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 18,),
                                  Utils.mediumHeadingNormalText(text:Constants.eventDetails[0].text,
                                      textSize: 14,fontWeight:FontWeight.w500,
                                      color:AppColor.black,
                                      textAlign: TextAlign.start),
                                  const Spacer(),
                                  Container(height:4,width: 60,
                                    decoration: BoxDecoration(
                                        color: AppColor.appGreen,
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                                    ),
                                  )
                                ],),
                            )
                          ],),
                      ),
                    )
                ): Container(
                    height: 55,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        boxShadow: [BoxShadow(
                            color:Color.fromRGBO(0, 0, 0, 0.14,),blurRadius:2
                        )]
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: Constants.eventDetails.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int index){
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index==0?20:0,right: index==4?20:0
                          ),
                          child: GestureDetector(
                            onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventAllWidgetsScreen(
                              index: index,
                            )));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 80,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 18,),
                                      Utils.mediumHeadingNormalText(text:Constants.eventDetails[index].text,
                                          textSize: 14,fontWeight: Constants.eventDetails[index].value==true?FontWeight.w500:FontWeight.w400,
                                          color:Constants.eventDetails[index].value==true?AppColor.black:AppColor.grey,
                                          textAlign: TextAlign.start),
                                      const Spacer(),
                                      Constants.eventDetails[index].value==true?
                                      Container(height:4,width: 60,
                                        decoration: BoxDecoration(
                                            color: AppColor.appGreen,
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                                        ),
                                      ):const SizedBox(),
                                    ],),
                                )
                              ],),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width:16);
                    },)
                ),
                const SizedBox(height:22,),
              ],),
          ),
            const EventDetailsWidgetScreen(),
          ],),
        ),
      ),
    );
  }
  bottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height: 130,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                dialog(0);
              },
              child: Row(children: [
                Utils.image(image: "block_icon.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Block,
                  color: AppColor.grey,)
              ],),
            ),const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                dialog(1);
              },
              child: Row(children: [
                Utils.image(image: "report_icon.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Report,
                  color: AppColor.grey,)
              ],),
            ),const SizedBox(height: 20,),
            const SizedBox(height: 14,),
          ],),
        ),
      );
    });
  }
  dialog(int type){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          type==0? Utils.image(image: "block_icon.png",height: 24,width: 24,color: AppColor.black):
          Utils.image(image: "report_icon.png",height: 24,width: 24,color: AppColor.black),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text:type==0?UtilStrings.Are_you_sure_you_want_to_block:
          UtilStrings.Are_you_sure_you_want_to_report,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 14,),
          Utils.customDivider(),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      color: AppColor.appGreen,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.Yes,color: AppColor.white,textSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 34,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.Cancel,color: AppColor.grey,textSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],)
        ],),
      );
    });
  }
}
