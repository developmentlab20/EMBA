import 'package:emba/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/string_utils.dart';
import '../../../widget/common/appbar/common_appBar.dart';
import '../../../widget/common/common_text_field.dart';

class ScheduledScreen extends StatefulWidget {
  const ScheduledScreen({Key? key}) : super(key: key);

  @override
  State<ScheduledScreen> createState() => _ScheduledScreenState();
}

class _ScheduledScreenState extends State<ScheduledScreen> {
  DateTime focusDay=DateTime.now();
  DateTime? selectedDate;
  DateTime calenderStartYear=DateTime(2000,3,10);
  DateTime calenderEndYear=DateTime(2025,12,31);
  bool public=true;
  bool private=false;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Scheduled_Meetings,),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
              color:AppColor.white,
            ),
            child: TableCalendar(
              onPageChanged: (value){
              },
              selectedDayPredicate: (value) {
                bool rV = false;
                value == selectedDate ? rV = true : null;
                return rV;
              },
              onDaySelected: (date, format) {
                setState(() {
                  focusDay = date;
                  selectedDate=date;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              focusedDay: focusDay,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(color:AppColor.black,fontWeight: FontWeight.w500),
                headerPadding: EdgeInsets.all(1),
                rightChevronIcon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff33374E),
                ),
                leftChevronIcon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff33374E),
                ),
              ),
              calendarStyle: CalendarStyle(
                markerDecoration: BoxDecoration(
                  color: AppColor.appGreen,
                  shape: BoxShape.circle,
                ),
                outsideTextStyle: const TextStyle(color: Colors.grey),
                canMarkersOverflow: true,
                weekendTextStyle: const TextStyle(color: AppColor.black,fontWeight: FontWeight.w500),
                defaultTextStyle: const TextStyle(color:AppColor.black,fontWeight: FontWeight.w500),
                todayDecoration: BoxDecoration(
                  color:AppColor.appGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
                todayTextStyle:  TextStyle(
                  color: AppColor.appGreen,
                ),
                selectedDecoration:  BoxDecoration(
                  color:AppColor.appGreen,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: const TextStyle(
                  color:Colors.white,fontWeight: FontWeight.w500
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: AppColor.black,
                      fontWeight: FontWeight.w500
                  ),
                  weekendStyle: TextStyle(color: AppColor.black,fontWeight: FontWeight.w500)),
              daysOfWeekHeight: 50,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0,0.14),
                        blurRadius:14)]
                      ),
                        width: size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 14,),
                              Padding(
                                padding: const EdgeInsets.only(left:16,right: 16),
                                child: Utils.mediumHeadingNormalText(text:"Thursday,23March",),
                              ),
                              const SizedBox(height:12,),
                              Utils.customDivider(),
                              ListView.builder(
                                  itemCount: 2,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context,int index){
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  const SizedBox(height:14,),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right:16),
                                      child: GestureDetector(
                                          onTap: (){
                                            bottomSheet();
                                          },
                                          child: const Icon(Icons.more_vert,size:22,color: AppColor.grey,)),
                                    )
                                  ],),
                                  Padding(
                                    padding: const EdgeInsets.only(left:16,right: 16),
                                    child: Utils.mediumHeadingNormalText(text:"Thursday,23March",textSize: 14),
                                  ),
                                    const SizedBox(height:8,),
                                    Padding(
                                      padding: const EdgeInsets.only(left:20,right: 20),
                                      child: Row(children: [
                                        Utils.image(image: "boy_image.png",height: 18,width: 18),
                                        const SizedBox(width:6,),
                                        Utils.mediumHeadingNormalText(text:"Courtney",textSize: 12,color: AppColor.grey),
                                        const SizedBox(width:14,),
                                        Utils.image(image: "timer_icon.png",height: 16,width: 16),
                                        const SizedBox(width:6,),
                                        Utils.mediumHeadingNormalText(text:"11:00 PM",textSize: 12,color: AppColor.grey),
                                      const SizedBox(width:14,),
                                        Utils.image(image: "location_icon.png",height: 14,width: 14),
                                        const SizedBox(width:6,),
                                        Utils.mediumHeadingNormalText(text:"Online",textSize: 12,color: AppColor.grey),
                                      ],),
                                    ),
                                    const SizedBox(height:16,),
                                    Utils.customDivider(),
                                ],);
                              }),
                              const SizedBox(height: 20,),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],),
      )
    );
  }
  bottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height:100,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                cancelMeetingDialog();
              },
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top:4),
                  child: Utils.image(image:"raise_outline.png",height: 18),
                ),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text:UtilStrings.Cancel_Meeting,color: AppColor.grey,textSize: 16,
                    fontWeight: FontWeight.w500),
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                setState(() {
                editEventBottomSheet();
                });
              },
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top:4),
                  child: Utils.image(image: "raise_outline.png",height: 18),
                ),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text:UtilStrings.Edit_Schedule,color: AppColor.grey,textSize: 16,
                    fontWeight: FontWeight.w500),

              ],),
            ),
            const SizedBox(height: 4,),
          ],)
        ),
      );
    });
  }
  cancelMeetingDialog(){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          Utils.image(image: "delete_group_icon.png",height: 24,width: 24),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text:UtilStrings.Are_you_sure_you_want_to_cancel_this_meeting,
              fontWeight: FontWeight.w400),
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
  editEventBottomSheet(){
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
                  Utils.mediumHeadingNormalText(text: UtilStrings.Schedule_a_meet,fontWeight: FontWeight.w600,
                      color: AppColor.grey,textSize: 14)
                ],),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Title,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(hint:"Meeting with courtney",height: 50,),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Type,fontWeight: FontWeight.w700,),
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
                          Utils.mediumHeadingNormalText(text: UtilStrings.Virtual,
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
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Date_time,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(hint:"Feb,17 2023 10:30 AM",height: 50,),
              ),
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left:24,right: 24),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.grey_light
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:16,right: 16,top:8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Utils.image(image: "null_icon.png",height: 14,width: 14),
                        const SizedBox(width: 8 ,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: RichText(text: const TextSpan(
                                  text: UtilStrings.The_selected_time_is_based_on_your_local_timezone,
                                  style: TextStyle(color: AppColor.grey,fontSize:12),
                                  children: [

                                  ]
                              )),
                            ),
                            Utils.mediumHeadingNormalText(text: UtilStrings.Equivalent_EST_time_in_Feb_,fontWeight: FontWeight.bold,textSize:12,
                                textAlign:TextAlign.start
                            ),
                          ],
                        ),
                      ],),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Meeting_Details,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(height: 100,hint: UtilStrings.Create_Group_DES,length: 150,lines: 3,),
              ),
              const Spacer(),
              Utils.customDivider(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right:20),
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
                        child: Utils.mediumHeadingNormalText(text: UtilStrings.Save,
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
