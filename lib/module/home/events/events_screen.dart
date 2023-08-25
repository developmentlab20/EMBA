import 'package:emba/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/string_utils.dart';
import '../../../widget/common/appbar/common_appBar.dart';
import '../../../widget/common/common_text_field.dart';
import 'event_details.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  bool public=true;
  bool private=false;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButton: GestureDetector(
        onTap: (){
          createEventBottomSheet();
        },
        child: Container(
          height: 45,width: 45,
          decoration: BoxDecoration(
            color: AppColor.appGreen,
            borderRadius: BorderRadius.circular(8)
          ),
         child: Center(child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Utils.image(image: "ic_event.png",height: 25,width:25),
           ],
         )),
        ),
      ),
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Events,events: true,),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20,top:30),
          child: SingleChildScrollView(
            child: Column(
              children: [
             Row(children: [
               Utils.mediumHeadingNormalText(text: UtilStrings.Recommended,textSize: 16,fontWeight: FontWeight.w700),
               const Spacer(),
               GestureDetector(
                 onTap: (){

                 },
                 child: Utils.mediumHeadingNormalText(text: UtilStrings.View_More,color: AppColor.grey,
                     fontWeight: FontWeight.w400,textSize:14),
               ),
               const SizedBox(width: 8,),
               const Icon(Icons.arrow_forward_rounded,color: AppColor.grey,)
             ],),
              const SizedBox(height:20,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding: const EdgeInsets.only(bottom:16),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailsScreen(type: 0,)));
                    },
                    child: Container(width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColor.grey2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10,right: 10,top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Utils.image(image: Constants.image[index]),
                              Positioned(
                                right: 10,top: 8  ,
                                child: GestureDetector(
                                       onTap: (){
                                         bottomSheet();
                                       },
                                  child: Container(
                                    height: 35,width: 35,
                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Icon(Icons.more_vert),
                                  ),
                                ),
                              )
                            ]),
                            const SizedBox(height:20,),
                            Row(children: [
                              Utils.image(image: "timer_icon.png",height: 18,width: 18),
                              const SizedBox(width:8,),
                              Utils.mediumHeadingNormalText(text:"Feb 23, Fri, 11:30 PM",color: AppColor.grey,
                                  fontWeight: FontWeight.w400,textSize:14),
                              const SizedBox(width:12,),
                              Icon(Icons.location_on_outlined,color: AppColor.grey,),
                              const SizedBox(width:2,),
                              Utils.mediumHeadingNormalText(text:"Online",color: AppColor.grey,
                                  fontWeight: FontWeight.w400,textSize:14),
                            ],),
                            const SizedBox(height:16,),
                            Utils.mediumHeadingNormalText(text: UtilStrings.Private_Equity_Understanding,
                                textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
                            const SizedBox(height:20,),
                            Utils.customDivider(),
                            const SizedBox(height:20,),
                            Row(
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
                            const SizedBox(height:16,),
                            Container(
                              width: size.width/1.2,
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
                            const SizedBox(height:20,),
                          ],),
                      ),
                    ),
                  ),
                );
              }),
                const SizedBox(height:20,),
                Row(children: [
                  Utils.mediumHeadingNormalText(text: UtilStrings.Events_I_Created,textSize: 16,fontWeight: FontWeight.w700),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.View_More,color: AppColor.grey,
                        fontWeight: FontWeight.w400,textSize:14),
                  ),
                  const SizedBox(width: 8,),
                  const Icon(Icons.arrow_forward_rounded,color: AppColor.grey,)
                ],),
                const SizedBox(height:20,),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom:16),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailsScreen(type: 0,)));
                          },
                          child: Container(width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColor.grey2)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left:10,right: 10,top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(children: [
                                    Utils.image(image:"event_image_2.png"),
                                    Positioned(
                                      right: 10,top: 8  ,
                                      child: GestureDetector(
                                        onTap: (){
                                          bottomSheet();
                                        },
                                        child: Container(
                                          height: 35,width: 35,
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Icon(Icons.more_vert),
                                        ),
                                      ),
                                    )
                                  ]),
                                  const SizedBox(height:20,),
                                  Row(children: [
                                    Utils.image(image: "timer_icon.png",height: 18,width: 18),
                                    const SizedBox(width:8,),
                                    Utils.mediumHeadingNormalText(text:"Feb 23, Fri, 11:30 PM",color: AppColor.grey,
                                        fontWeight: FontWeight.w400,textSize:14),
                                    const SizedBox(width:12,),
                                    Icon(Icons.location_on_outlined,color: AppColor.grey,),
                                    const SizedBox(width:2,),
                                    Utils.mediumHeadingNormalText(text:"Online",color: AppColor.grey,
                                        fontWeight: FontWeight.w400,textSize:14),
                                  ],),
                                  const SizedBox(height:16,),
                                  Utils.mediumHeadingNormalText(text: UtilStrings.Private_Equity_Understanding,
                                      textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
                                  const SizedBox(height:20,),
                                  Utils.customDivider(),
                                  const SizedBox(height:20,),
                                  Row(
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
                                  const SizedBox(height:16,),
                                  Container(
                                    width: size.width/1.2,
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
                                                Utils.image(image: "share_icon.png",height: 18,width: 18)
                                              ],
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height:20,),
                                ],),
                            ),
                          ),
                        ),
                      );
                    }),
                Row(children: [
                  Utils.mediumHeadingNormalText(text: UtilStrings.Events_I_Joined,textSize: 16,fontWeight: FontWeight.w700),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.View_More,color: AppColor.grey,
                        fontWeight: FontWeight.w400,textSize:14),
                  ),
                  const SizedBox(width: 8,),
                  const Icon(Icons.arrow_forward_rounded,color: AppColor.grey,)
                ],),
                const SizedBox(height:20,),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom:16),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailsScreen()));
                          },
                          child: Container(width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColor.grey2)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left:10,right: 10,top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(children: [
                                    Utils.image(image: Constants.image[index]),
                                    Positioned(
                                      right: 10,top: 8  ,
                                      child: GestureDetector(
                                        onTap: (){
                                          bottomSheet();
                                        },
                                        child: Container(
                                          height: 35,width: 35,
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Icon(Icons.more_vert),
                                        ),
                                      ),
                                    )
                                  ]),
                                  const SizedBox(height:20,),
                                  Row(children: [
                                    Utils.image(image: "timer_icon.png",height: 18,width: 18),
                                    const SizedBox(width:8,),
                                    Utils.mediumHeadingNormalText(text:"Feb 23, Fri, 11:30 PM",color: AppColor.grey,
                                        fontWeight: FontWeight.w400,textSize:14),
                                    const SizedBox(width:12,),
                                    Icon(Icons.location_on_outlined,color: AppColor.grey,),
                                    const SizedBox(width:2,),
                                    Utils.mediumHeadingNormalText(text:"Online",color: AppColor.grey,
                                        fontWeight: FontWeight.w400,textSize:14),
                                  ],),
                                  const SizedBox(height:16,),
                                  Utils.mediumHeadingNormalText(text: UtilStrings.Private_Equity_Understanding,
                                      textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
                                  const SizedBox(height:20,),
                                  Utils.customDivider(),
                                  const SizedBox(height:20,),
                                  Row(
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
                                  const SizedBox(height:16,),
                                  Container(
                                    width: size.width/1.2,
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
                                  const SizedBox(height:20,),
                                ],),
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(height:20,),
            ],),
          ),
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
      return SizedBox(height: 135,
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
            const SizedBox(height: 16,),
          ],),
        ),
      );
    });
  }
  createEventBottomSheet(){
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
                  Utils.mediumHeadingNormalText(text: UtilStrings.Create_Event,fontWeight: FontWeight.w600,
                      color: AppColor.grey,textSize: 14)
                ],),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Event_Title,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(hint: UtilStrings.Name_of_youe_event,height: 50,),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Event_Type,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          private=false;
                          public=true;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child:Row(children: [
                          const SizedBox(width: 10,),
                          Utils.image(image: public?"raise_full.png":"raise_outline.png",height: 18,width: 18),
                          const SizedBox(width: 10,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.Online,
                              color: AppColor.grey
                          ),
                        ],),),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          private=true;
                          public=false;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child:Row(children: [
                          const SizedBox(width: 10,),
                          Utils.image(image:private?"raise_full.png":"raise_outline.png",height: 18,width: 18),
                          const SizedBox(width: 10,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.In_Person,
                              color: AppColor.grey),
                        ],),),
                    ),
                  ),
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Panel_members,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(hint: UtilStrings.Name_of_panel_members,height: 50,),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Date_time,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(hint:"Feb,17 2023 10:30 AM",height: 50,),
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
