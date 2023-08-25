import 'package:flutter/material.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import '../../utils/constants/constants.dart';
import '../../widget/common/common_text_field.dart';
import 'group_details/group_details_screen.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  String dropDownValue="";
  bool public=true;
  bool private=false;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButton: GestureDetector(
        onTap: (){
          createGroupBottomSheet();
        },
        child: Container(
          height: 45,width: 45,
          decoration: BoxDecoration(
            color: AppColor.appGreen,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child: Utils.image(image: "more_person_icon.png",height: 20)),
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(height: 28,),
                 ListView.builder(
                     shrinkWrap: true,
                     itemCount: Constants.groupModel.length,
                     physics: const NeverScrollableScrollPhysics(),
                     itemBuilder: (BuildContext context,int index){
                   return Padding(
                     padding: const EdgeInsets.only(bottom:12),
                     child: Column(
                       children: [
                         GestureDetector(
                           behavior: HitTestBehavior.translucent,
                           onTap: (){
                             if(Constants.groupModel[index].request==true){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupDetailsScreen(
                                 name:Constants.groupModel[index].name,joined: true,
                               )));
                             }else{
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupDetailsScreen(
                                 name:Constants.groupModel[index].name,
                               )));
                             }

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
                                           bottomSheet();
                                         },
                                         child: const Icon(Icons.more_vert,size:20,))
                                   ],),
                                 Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Stack(
                                       children: [
                                         Utils.image(image:Constants.groupModel[index].image,height:60,width:60),
                                         Constants.groupModel[index].online==true?
                                         Positioned(
                                           right: 0,top: 0,
                                           child: Container(height: 14,width:14,
                                             decoration: BoxDecoration(
                                               border: Border.all(color: AppColor.white,width: 2),
                                                 color: AppColor.appGreen,borderRadius: BorderRadius.circular(20)
                                             ),
                                           ),
                                         ):const SizedBox(),
                                       ],
                                     ),
                                     const SizedBox(width: 16,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Utils.mediumHeadingNormalText(text:Constants.groupModel[index].name,
                                           fontWeight: FontWeight.w600,),
                                         const SizedBox(height:3,),
                                        SizedBox(
                                          width: size.width/1.5,
                                          child: Row(children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                              Constants.groupModel[index].groupLeader==true?
                                              Container(height: 25,width: 120,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(color: AppColor.grey2)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Utils.image(image: "shield_icon.png",height: 14,width: 14),
                                                    const SizedBox(width: 8),
                                                    Utils.mediumHeadingNormalText(text: "Group Leader",textSize:10,
                                                        color: AppColor.black_2)
                                                  ],),
                                              ):Container(),
                                              const SizedBox(height:8,),
                                              Row(
                                                children: [
                                                  Utils.mediumHeadingNormalText(text:UtilStrings.Private,
                                                      fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:6,right: 6),
                                                    child: Container(height: 4,width: 4,
                                                      decoration: BoxDecoration(
                                                          color: AppColor.grey,borderRadius: BorderRadius.circular(20)
                                                      ),
                                                    ),
                                                  ),
                                                  Utils.mediumHeadingNormalText(text:"578K Members",
                                                      fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey),
                                                  Constants.groupModel[index].newPosts==true?
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:6,right: 6),
                                                    child: Container(height: 4,width: 4,
                                                      decoration: BoxDecoration(
                                                          color: AppColor.grey,borderRadius: BorderRadius.circular(20)
                                                      ),
                                                    ),
                                                  ):const SizedBox(),
                                                  Constants.groupModel[index].newPosts==true?
                                                  Utils.mediumHeadingNormalText(text:"10+ New Posts",
                                                      fontWeight: FontWeight.w400,textSize: 12,color: AppColor.appGreen):
                                                  Container(),
                                                ],
                                              ),
                                            ],),
                                            const Spacer(),
                                            Constants.groupModel[index].request==true?
                                               Container(
                                                 width: 80,height: 30,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20),
                                                   color: AppColor.grey_light
                                                 ),
                                                 child: Center(child: Utils.mediumHeadingNormalText(text:
                                                 UtilStrings.Cancel,textSize: 12,color: AppColor.grey,fontWeight: FontWeight.w700)),
                                               ):Constants.groupModel[index].join==true?
                                            GestureDetector(
                                              onTap: (){
                                                requestAcceptDialog();
                                              },
                                              child: Container(
                                                width: 80,height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(color: AppColor.appGreen)
                                                ),
                                                child: Center(child: Utils.mediumHeadingNormalText(text:
                                                UtilStrings.Join,textSize: 12,color: AppColor.appGreen,fontWeight: FontWeight.w700)),
                                              ),
                                            ):
                                            const SizedBox()
                                          ],),
                                        )
                                       ],)
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ),
                         const SizedBox(height:16,),
                         Utils.customDivider()
                       ],
                     ),
                   );
                 }),
              const SizedBox(height: 50,),
          ],),
        ),
      ),
    );
  }
  createGroupBottomSheet(){
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
                  Utils.mediumHeadingNormalText(text: UtilStrings.Create_Group,fontWeight: FontWeight.w600,
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
                child: CommonTextField(hint: UtilStrings.Startup_Discussion,height: 50,),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Category,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Container(height: 50,width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:16,right:16),
                    child: DropdownButton(
                        icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                        hint:Utils.mediumHeadingNormalText(
                            text: UtilStrings.Enter_college_name,textSize: 12
                        ),
                        underline: Container(),
                        isExpanded: true,
                        value: dropDownValue.isEmpty?null:dropDownValue,
                        items: Constants.category.map((String items){
                          return DropdownMenuItem(
                              value: items,
                              child: Text(items,style: const TextStyle(fontSize: 14),));
                        }).toList(),
                        onChanged: (String? value){
                          setState((){
                            dropDownValue=value!;
                          });
                        }),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Privacy_Type,fontWeight: FontWeight.w700,),
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
                          Utils.mediumHeadingNormalText(text: UtilStrings.Public,
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
                          Utils.mediumHeadingNormalText(text: UtilStrings.Private,
                                   color: AppColor.grey),
                        ],),),
                    ),
                  ),
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Description,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(height: 100,hint: UtilStrings.Create_Group_DES,length: 60,lines: 3,),
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
  bottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                dialog();
              },
              child: Row(children: [
                Utils.image(image: "leave_icon_black.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Leave_group,
                    color: AppColor.grey,fontWeight: FontWeight.w500)
              ],),
            ),
            const SizedBox(height: 16,),

          ],),
        ),
      );
    });
  }
  dialog(){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          Utils.image(image: "leave_icon_black.png",height: 24,width: 24),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text:UtilStrings.Are_you_sure_you_want_to_leave,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 20,),
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
  requestAcceptDialog(){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          Utils.image(image: "hand_icon.png",height: 28,width: 28),
          const SizedBox(height: 16,),
          Utils.mediumHeadingNormalText(text:UtilStrings.Thank_You,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 16,),
          Utils.mediumHeadingNormalText(text:UtilStrings.Request_Acc_Des,textSize: 12,color: AppColor.grey),
          const SizedBox(height: 20,),
        ],),
      );
    });
  }
}
