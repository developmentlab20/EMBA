import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/chat_app_bar.dart';
import '../../widget/common/common_text_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  bool isSend=false;
  bool isAvoidBottom=false;
  bool isSearch=false;
  bool isAttach=false;
  bool private=false;
  bool public=true;
  String dropDownValue='7 Days';
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: isAvoidBottom,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:isSearch==false?
        CommonAppBarChat(title:"Startup",imageUrlProfile:"demo_image.png",action: true,onTap: (){
        },imageUrl: "ic_chat.png",onTapMennu: (){
          bottomSheet();
        },):
        AppBar(
          backgroundColor: AppColor.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      isSearch=false;
                      Utils.hideKeyBoard(context);
                    });
                  },
                  child: const Icon(Icons.arrow_back_sharp,color:AppColor.black,)),
              SizedBox(width: 12,),
              Container(
                width: size.width/1.6,
                height: 40,
                // margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.grey_light,
                ),
                child: TextFormField(
                  onTap: (){
                    setState(() {
                      isAvoidBottom=false;
                    });              },
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 4, right: 15),
                    hintText: "Search",
                    hintStyle:TextStyle(color: Colors.grey,fontSize: 14,),
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down,size: 28,color: AppColor.grey,),
              Icon(Icons.keyboard_arrow_up,size: 28,color: AppColor.grey,),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            isAvoidBottom=true;
            isAttach=false;
          });
          Utils.hideKeyBoard(context);
        },
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white10,
            child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 80),
                      child:
                      ListView.builder(
                          shrinkWrap: true,
                          reverse: false,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return
                            index==0 || index==1?
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Container(
                                   width: size.width/1.5,
                                   padding: EdgeInsets.all(8.0),
                                   margin: EdgeInsets.only(bottom: 12,left: 12),
                                   decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                     color: AppColor.grey_light,
                                   ),
                                   child: Wrap(
                                     children: [
                                       Container(
                                         padding: EdgeInsets.all(8.0),
                                         decoration: BoxDecoration(
                                           border: Border.all(color: Colors.grey.withOpacity(0.4)),
                                           borderRadius: BorderRadius.circular(12),
                                           color: AppColor.white,
                                         ),
                                         child: Wrap(
                                           children: [
                                             Utils.mediumHeadingNormalText(text: "Meetup",fontWeight:FontWeight.bold,textSize: 12,color: AppColor.black),
                                             Container(
                                               margin: EdgeInsets.only(top: 8),
                                               child: Row(
                                                 children: [
                                                   Utils.image(image: "timer_icon.png",height: 12,width: 12),
                                                   Utils.mediumHeadingNormalText(text: " Feb 23, Fri ,11:00 PM ",fontWeight:FontWeight.normal,textSize: 12,color: AppColor.black),
                                                     Utils.image(image: "location_icon.png",height: 12,width: 12),
                                                   Utils.mediumHeadingNormalText(text: " Online",fontWeight:FontWeight.normal,textSize: 12,color: AppColor.black),
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                                             Row(
                                               children: [
                                                 Container(height: 18,width: 18,
                                                   decoration: BoxDecoration(
                                                       color: AppColor.black,
                                                       borderRadius: BorderRadius.circular(50)
                                                   ),
                                                   child: ClipRRect(
                                                       borderRadius: BorderRadius.circular(50),
                                                       child: Utils.image(image:"demo_image.png",fit: BoxFit.cover)),
                                                 ),
                                                 Utils.mediumHeadingNormalText(text: " Sanjeev Malik  ",fontWeight:FontWeight.normal,textSize: 12,color: AppColor.black),
                                             Utils.image(image: "ic_team.png",height: 12,width: 12),
                                                 Utils.mediumHeadingNormalText(text: " 650 Attendees",fontWeight:FontWeight.normal,textSize: 12,color: AppColor.black),
                                               ],
                                             ),
                                             Container(
                                               margin: EdgeInsets.only(top: 8),
                                               child: Row(
                                                 children: [
                                                   Utils.borderButton(UtilStrings.Attend, AppColor.appGreen, AppColor.appGreen, 120, 35),
                                                   Utils.image(image: "ic_notification.png",height: 32,width: 32),
                                                   Utils.image(image: "ic_share_invite.png",height: 32,width: 32),
                                                 ],
                                               ),
                                             )
                                           ],
                                         ),
                                       ),
                                       Container(
                                           margin: EdgeInsets.only(top: 8),
                                           child: Utils.mediumHeadingNormalText(text: UtilStrings.dummy_text,
                                               fontWeight:FontWeight.normal,textSize: 12,color: AppColor.black,
                                               textAlign: TextAlign.start)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Utils.mediumHeadingNormalText(text: "23:59",
                                            fontWeight:FontWeight.normal,textSize: 10,color: AppColor.black,
                                            textAlign: TextAlign.start)
                                      ],
                                    )
                                     ],
                                   ),
                                 )
                                ],
                              ):Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: size.width/1.5,
                                  padding: EdgeInsets.all(8.0),
                                  margin: EdgeInsets.only(bottom: 12,right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColor.appGreen.withOpacity(0.2),
                                  ),
                                  child: Wrap(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.withOpacity(0.4)),
                                          borderRadius: BorderRadius.circular(12),
                                          color: AppColor.white,
                                        ),
                                        child: Wrap(
                                          children: [
                                            Utils.mediumHeadingNormalText(text: "User name",fontWeight:FontWeight.w500,textSize: 12,color: AppColor.appGreen),
                                            Utils.mediumHeadingNormalText(text: UtilStrings.dummy_text,fontWeight:FontWeight.normal,textSize: 12,color: AppColor.black,textAlign: TextAlign.start),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Utils.mediumHeadingNormalText(text: UtilStrings.dummy_text,
                                              fontWeight:FontWeight.normal,textSize: 12,color: AppColor.black,
                                              textAlign: TextAlign.start)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "23:59",
                                              fontWeight:FontWeight.normal,textSize: 10,color: AppColor.black,
                                              textAlign: TextAlign.start)
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          })
                  ),
                  isAttach==true?
                  Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(width: 1,color: AppColor.grey)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.commanAttachFileOnChat("ic_photo.png", UtilStrings.Photo),
                            SizedBox(width: 20,),
                            GestureDetector(
                              onTap: (){
                                bottomSheetCreatePoll();
                              },
                              child: Utils.commanAttachFileOnChat("ic_poll.png", UtilStrings.Create_Poll),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Utils.commanAttachFileOnChat("ic_add_resource.png", UtilStrings.Add_Resources),
                            SizedBox(width: 20,),
                            Utils.commanAttachFileOnChat("ic_share_contact.png", UtilStrings.Share_Contact),
                          ],
                        ),
                      ],
                    ),
                  ):Container(),
                  Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(width: 1,color: AppColor.grey)
                          )
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: size.width/1.2,
                            height: 45,
                            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColor.grey_light,
                            ),
                            child: TextFormField(
                              onTap: (){
                                setState(() {
                                  isSend=true;
                                  isAvoidBottom=true;
                                  isAttach=false;
                                });
                              },
                              controller: messageController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Utils.image(image: "ic_camera.png",height: 18,width: 18),
                                    SizedBox(width: 12,),
                                    GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isAttach=true;
                                            isAvoidBottom=true;

                                          });
                                        },
                                        child: Utils.image(image: "ic_attach.png",height: 18,width: 18)),
                                    SizedBox(width: 12,)
                                  ],
                                ),
                                contentPadding:
                                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Message",
                                hintStyle:TextStyle(color: Colors.grey,fontSize: 14,),
                              ),
                            ),
                          ),
                          isSend==true?
                          Utils.image(image: "ic_send.png",height: 18,width: 18):
                          Utils.image(image: "ic_mic.png",height: 18,width: 18),
                        ],
                      )
                  ),
                ]
            )),
      ),
    );
  }
  bottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height:180,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child:
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.only(top: 20,bottom: 10),
                height: 8,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.grey_light
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

              },
              child: Row(children: [
                Utils.image(image: "ic_group_info.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Group_Info,
                    color: AppColor.grey,fontWeight: FontWeight.w500)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                setState(() {
                  isSearch=true;
                });
                Navigator.pop(context);
              },
              child: Row(children: [
                Utils.image(image: "search_icon.png",height: 14,width:16,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Search_in_Coversation,
                    color: AppColor.grey,fontWeight: FontWeight.w500)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

              },
              child: Row(children: [
                Utils.image(image: "ic_notify.png",height: 14,width:16,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Mute_Notifications,
                    color: AppColor.grey,fontWeight: FontWeight.w500)
              ],),
            ),
          ],),
        ),
      );
    });
  }

  List<String> dayList=["7 Days", "1 Month"];
  bottomSheetCreatePoll(){
    final size=MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return Padding(
        padding: const EdgeInsets.only(left:20,right: 20),
        child:
        Wrap
          (
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(margin: EdgeInsets.only(top: 20,bottom: 10),
                height: 8,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.grey_light
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                 onTap: (){
                   Navigator.pop(context);
                 },
                  child: Icon(Icons.arrow_back,color: AppColor.grey,)),
              SizedBox(width: 12,),
              Utils.mediumHeadingNormalText(text: UtilStrings.Create_Poll,
                  fontWeight:FontWeight.bold,textSize: 16,color: AppColor.grey,
                  textAlign: TextAlign.start)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Utils.mediumHeadingNormalText(text: UtilStrings.My_Question,
                fontWeight:FontWeight.bold,textSize: 14,color: AppColor.black,
                textAlign: TextAlign.start),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isAttach=false;
                });
              },
              child: CommonTextField(hint: UtilStrings.Details_of_question,height: 100,length: 150,
                controller: descriptionController,isChatBottom: true,
                lines: 3,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Utils.mediumHeadingNormalText(text: UtilStrings.Voting_Options,
                fontWeight:FontWeight.bold,textSize: 14,color: AppColor.black,
                textAlign: TextAlign.start),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 20),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isAttach=false;
                });
              },
              child:  Utils.customTextFeildChat(context,
                  "Option 1",
                  descriptionController, false,
                  false,1),
            ),
          ), GestureDetector(
            onTap: (){
              setState(() {
                isAttach=false;
              });
            },
            child:  Utils.customTextFeildChat(context,
                "Option 1",
                descriptionController, false,
                false,1),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 20),
            child:  Utils.commanAttachFileOnChat("ic_add.png", UtilStrings.Add_Option),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils.mediumHeadingNormalText(text: UtilStrings.Duration,
                  fontWeight:FontWeight.bold,textSize: 14,color: AppColor.black,
                  textAlign: TextAlign.start),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 16,right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:  AppColor.grey2),
                ),
                width: size.width,
                child: DropdownButton(
                    icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                    hint:Utils.mediumHeadingNormalText(
                        text: UtilStrings.Startup_Related,textSize: 12
                    ),
                    underline: Container(),
                    isExpanded: true,
                    value: dropDownValue.isEmpty?null:dropDownValue,
                    items: dayList.map((String items){
                      return DropdownMenuItem(
                          value: items,
                          child: Text(items,style: const TextStyle(fontSize: 14,color: AppColor.grey),));
                    }).toList(),
                    onChanged: (String? value){
                      setState((){
                        dropDownValue=value!;
                      });
                    }),
              ),
              Container(
                  margin: EdgeInsets.only(top: 40,bottom: 20),
                  child: Utils.customDivider()),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                         color: AppColor.appGreen,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Utils.mediumHeadingNormalText(text: "Done",textSize: 12,color: AppColor.white)),
                      )
                    // Utils.borderButton("Done", AppColor.grey.withOpacity(0.2),AppColor.grey.withOpacity(0.2), 70, 26),
                  ],
                ),
              )
            ],
          ),
        ],),
      );
    });
  }
  bottomSheetScheduleMeet(){
    final size=MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
          Wrap
            (
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.only(top: 20, bottom: 10),
                    height: 8,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.grey_light
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 12,),
                  Utils.mediumHeadingNormalText(
                      text: UtilStrings.Schedule_a_meet,
                      fontWeight: FontWeight.normal,
                      textSize: 14,
                      color: AppColor.black,
                      textAlign: TextAlign.start)
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Utils.mediumHeadingNormalText(
                    text: UtilStrings.TitleStar,
                    fontWeight: FontWeight.bold,
                    textSize: 14,
                    color: AppColor.black,
                    textAlign: TextAlign.start),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isAttach = false;
                    });
                  },
                  child: Utils.customTextFeildChat(context,
                      UtilStrings.Name_of_your_event,
                      descriptionController, false,
                      false, 1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.TypeStar,
                    fontWeight: FontWeight.bold,
                    textSize: 14,
                    color: AppColor.black,
                    textAlign: TextAlign.start),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          private = false;
                          public = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Row(children: [
                          const SizedBox(width: 10,),
                          Utils.image(image: public
                              ? "raise_full.png"
                              : "raise_outline.png", height: 18, width: 18),
                          const SizedBox(width: 10,),
                          Utils.mediumHeadingNormalText(
                              text: UtilStrings.Online,
                              color: AppColor.grey
                          ),
                        ],),),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          private = true;
                          public = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Row(children: [
                          const SizedBox(width: 10,),
                          Utils.image(image: private
                              ? "raise_full.png"
                              : "raise_outline.png", height: 18, width: 18),
                          const SizedBox(width: 10,),
                          Utils.mediumHeadingNormalText(
                              text: UtilStrings.In_Person,
                              color: AppColor.grey),
                        ],),),
                    ),
                  ),
                ],),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Utils.mediumHeadingNormalText(
                    text: UtilStrings.LocationStar,
                    fontWeight: FontWeight.bold,
                    textSize: 14,
                    color: AppColor.black,
                    textAlign: TextAlign.start),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isAttach = false;
                    });
                  },
                  child: Utils.customTextFeildChat(context,
                      UtilStrings.Address_the_event,
                      descriptionController, false,
                      false, 1),
                ),
              ), Container(
                child: Utils.mediumHeadingNormalText(
                    text: UtilStrings.Date_Time,
                    fontWeight: FontWeight.bold,
                    textSize: 14,
                    color: AppColor.black,
                    textAlign: TextAlign.start),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isAttach = false;
                    });
                  },
                  child: Utils.customTextFeildChat(context,
                      "Feb 17,2023   10:30 AM (UTC+6:00)",
                      descriptionController, false,
                      false, 1),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Utils.mediumHeadingNormalText(
                        text: UtilStrings.Meeting_Details,
                        fontWeight: FontWeight.bold,
                        textSize: 14,
                        color: AppColor.black,
                        textAlign: TextAlign.start),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isAttach = false;
                        });
                      },
                      child: CommonTextField(hint: UtilStrings.Details_of_event,
                        height: 100,
                        length: 150,
                        controller: descriptionController,
                        isChatBottom: true,
                        lines: 3,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 40, bottom: 20),
                      child: Utils.customDivider()),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Utils.borderButton(
                            "Next", AppColor.grey.withOpacity(0.2),
                            AppColor.grey.withOpacity(0.2), 70, 26),
                      ],
                    ),
                  )
                ],
              ),
            ],),
        );
      });
    });}}