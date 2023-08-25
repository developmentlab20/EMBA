import 'package:emba/module/groups/group_details/feed_jobs_detail/widgets/feed_widget_screen.dart';
import 'package:emba/module/groups/group_details/feed_jobs_detail/widgets/jobs_widget_screen.dart';
import 'package:emba/module/groups/group_details/feed_jobs_detail/widgets/my_activity_widget_screen.dart';
import 'package:emba/module/groups/group_details/feed_jobs_detail/widgets/pool_widget_screen.dart';
import 'package:emba/module/groups/group_details/feed_jobs_detail/widgets/resoures_widget_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import 'discussion_widget_screen.dart';
import 'event_attendees_widget.dart';
import 'event_details_widget.dart';

class EventAllWidgetsScreen extends StatefulWidget {
  String? name;
  int? index;
  EventAllWidgetsScreen({Key? key,this.name,this.index}) : super(key: key);

  @override
  State<EventAllWidgetsScreen> createState() => _EventAllWidgetsScreen();
}

class _EventAllWidgetsScreen extends State<EventAllWidgetsScreen> {
  String dropDownValue="Recent";
  int listIndex=0;
  List <Widget> _listwidget=[];
  @override
  void initState() {
    listIndex=widget.index!;
    fetchValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listwidget=[
      EventDetailsWidgetScreen(),
      EventAttendeesWidget(),
      DiscussionWidgetScreen(),
      ResourcesWidgetScreen(),

    ];
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Event_Details,
          searchAction: true,color: AppColor.black,onTap: (){
          bottomSheet(1);
          },
        ),
      ),
      floatingActionButton: Container(
        height: 50,width: 50,
        decoration: BoxDecoration(
            color: AppColor.appGreen,
            borderRadius: BorderRadius.circular(8)
        ),
        child: const Center(child:Icon(Icons.add,color: AppColor.white,)),
      ),
      body: SizedBox(
        width:size.width,
        child: Column(children: [
          Container(
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
                        if(index==0){
                          setState(() {
                            listIndex=index;
                          });
                          fetchValue();
                        }else{
                          setState(() {
                            listIndex=index;
                          });
                          fetchValue();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width:80,
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
          const SizedBox(height: 6,),
          Padding(
            padding: const EdgeInsets.only(right:16,top:8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Utils.mediumHeadingNormalText(text:dropDownValue,fontWeight:FontWeight.w600,textSize: 14,color: AppColor.grey),
                const SizedBox(width: 6,),
                GestureDetector(
                    onTap: (){
                      bottomSheet(0);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top:6),
                      child: Icon(Icons.expand_more,size:24,color: AppColor.grey,),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Utils.customDivider(),
          const SizedBox(height: 10,),
          Expanded(
            child: Container(width: size.width,
              child: SingleChildScrollView(
                child: Column(children: [
                  _listwidget[listIndex]
                ],),
              ),
            ),
          ),
        ],),
      ),
    );
  }
  bottomSheet(int type){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height:type==0? 110:130,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: type==0? Column(children: [
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                setState(() {
                  dropDownValue="Recent";
                });
              },
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top:4),
                  child: Utils.image(image: dropDownValue=="Recent"?"raise_full.png":"raise_outline.png",height: 18),
                ),
                const SizedBox(width: 12,),
                Utils.mediumHeadingNormalText(text:UtilStrings.Recent,color: AppColor.grey,textSize: 16,
                    fontWeight: FontWeight.w500),
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                setState(() {
                  dropDownValue="Popular";
                });
              },
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top:4),
                  child: Utils.image(image: dropDownValue=="Popular"?"raise_full.png":"raise_outline.png",height: 18),
                ),
                const SizedBox(width: 12,),
                Utils.mediumHeadingNormalText(text:UtilStrings.Popular,color: AppColor.grey,textSize: 16,
                    fontWeight: FontWeight.w500),
              ],),
            ),
            const SizedBox(height: 4,),
          ],):
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20),
            child: Column(children: [
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
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
          )
        ),
      );
    });
  }
  fetchValue(){
    for(int i=0;i<Constants.eventDetails.length;i++){
      if(i==listIndex){
        setState(() {
          Constants.eventDetails[i].value=true;
        });
      }else{
        setState(() {
          Constants.eventDetails[i].value=false;
        });
      }
    }
  }
}
