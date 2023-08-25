import 'package:emba/utils/string_utils.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/route/route_name.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/common/appbar/common_appBar.dart';
import '../group_details_screen.dart';

class GroupMembersScreen extends StatefulWidget {
  const GroupMembersScreen({Key? key}) : super(key: key);

  @override
  State<GroupMembersScreen> createState() => _GroupMembersScreenState();
}

class _GroupMembersScreenState extends State<GroupMembersScreen> {
  bool CEO =true;
  bool CFO =false;
  bool MANAGERS =false;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Group_Members,
          searchAction: true,color: AppColor.black,
          imageUrl:"vert_line_icon.png",onTap: (){
          Navigator.pushNamed(context, RouteName.FilterScreen);
          },
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 16,),
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


                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left:20,right: 20),
                            child: Column(
                              children: [
                               index!=0? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: (){
                                          bottomSheet();
                                        },
                                        child: const Icon(Icons.more_vert,size:20,))
                                  ],):Container(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Utils.image(image:Constants.groupModel[index].image,height:60,width:60)),
                                    const SizedBox(width: 16,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(height:8 ,),
                                        Utils.mediumHeadingNormalText(text:Constants.groupModel[index].name,
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
                                                      index==0?
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
                                                      ):Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",
                                                          fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey),
                                                      const SizedBox(width: 10,),
                                                      index==0?
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
                                                            Utils.mediumHeadingNormalText(text:"${UtilStrings.Financial_Expert} +2",textSize:8,
                                                                color: AppColor.black_2)
                                                          ],),
                                                      ):Container(),
                                                      const Spacer(),
                                                      Utils.image(image: "ic_comment.png",height: 20,width: 20)
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height:6,),
                                                index==0?
                                                Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",
                                                    fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey):Container(),
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
                  );
                }),
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
      return SizedBox(height: 270,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                 addToListDialog();
              },
              child: Row(children: [
                const Icon(Icons.add,color: AppColor.grey,size: 22,),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Add_to_list,
                    color: AppColor.grey,)
              ],),
            ),  const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                groupLeaderRemoveDialog(0);
              },
              child: Row(children: [
                Utils.image(image: "admin_grey.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Make_group_leader,
                    color: AppColor.grey,)
              ],),
            ),const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Row(children: [
                Utils.image(image: "block_icon.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Block_this_person,
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
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                groupLeaderRemoveDialog(1);
              },
              child: Row(children: [
                Utils.image(image: "remove_person_icon.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Remove_person_from_the_group,
                    color: AppColor.grey,)
              ],),
            ),
            const SizedBox(height: 16,),
          ],),
        ),
      );
    });
  }
  groupLeaderRemoveDialog(int type){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          Utils.image(image:type==0? "admin_grey.png":"remove_person_icon.png",height: 24,width: 24,color: AppColor.black),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text:
          type==0?
          UtilStrings.person_group_leader:UtilStrings.remove_this_person,
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
  addToListDialog(){
    showDialog(context: context, builder: (ctxt){
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          title:Column(children: [
            Utils.mediumHeadingNormalText(text: UtilStrings.Save_to,color: AppColor.black,textSize: 16,
                fontWeight: FontWeight.w700),
            const SizedBox(height: 20,),
            Container(height: 45,width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColor.grey_light,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Row(children: [
                const SizedBox(width: 16,),
                const Icon(Icons.add,color: AppColor.grey,),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Add_new_list,color: AppColor.grey,textSize: 14,
                    fontWeight: FontWeight.w500),
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                setState((){
                  CEO=true;
                  CFO=false;
                  MANAGERS=false;
                });
              },
              child: Container(height: 45,width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(children: [
                  const SizedBox(width: 12,),
                  Utils.image(image: CEO?"raise_full.png":"raise_outline.png",height: 20,width: 20),
                  const SizedBox(width: 16,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.CEO,color: AppColor.grey,textSize: 14,
                      fontWeight: FontWeight.w500),
                ],),
              ),
            ),const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                setState((){
                  CEO=false;
                  CFO=true;
                  MANAGERS=false;
                });
              },
              child: Container(height: 45,width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(children: [
                  const SizedBox(width: 12,),
                  Utils.image(image: CFO?"raise_full.png":"raise_outline.png",height: 20,width: 20),
                  const SizedBox(width: 16,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.CFO,color: AppColor.grey,textSize: 14,
                      fontWeight: FontWeight.w500),
                ],),
              ),
            ),const SizedBox(height: 16,),
            GestureDetector(
              onTap: () {
                setState(() {
                  CEO = false;
                  CFO = false;
                  MANAGERS = true;
                });
              },
              child: Container(height: 45,width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(children: [
                  const SizedBox(width: 12,),
                  Utils.image(image: MANAGERS?"raise_full.png":"raise_outline.png",height: 20,width: 20),
                  const SizedBox(width: 16,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Managers,color: AppColor.grey,textSize: 14,
                      fontWeight: FontWeight.w500),
                ],),
              ),
            ),
            const SizedBox(height: 16,),
            Utils.customDivider(),
            const SizedBox(height: 16,),
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
                      child: Utils.mediumHeadingNormalText(text: UtilStrings.Save,color: AppColor.white,textSize: 14,
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
    });
  }
}
