import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/route/route_name.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';

class MyListWidgetScreen extends StatefulWidget {
  const MyListWidgetScreen({Key? key}) : super(key: key);

  @override
  State<MyListWidgetScreen> createState() => _MyListWidgetScreenState();
}

class _MyListWidgetScreenState extends State<MyListWidgetScreen> {
  bool textColor=false;
  bool CEO=false;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  SizedBox(
      width: size.width,
      child: Column(children: [
          ExpansionTile(
            onExpansionChanged: (value){
              setState(() {
                textColor=value;
              });
            },
            trailing: Icon(textColor?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down_sharp,color: AppColor.grey,),
            title:Utils.mediumHeadingNormalText(text: UtilStrings.Blockchain_Expert,
          fontWeight: FontWeight.w600,textAlign: TextAlign.start,textSize: 14,color: AppColor.black
          ),
          children: [
            Column(
              children: [
                Utils.customDivider(),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20,top: 16,bottom: 16),
                  child: Row(children: [
                    GestureDetector(onTap: (){
                      Navigator.pushNamed(context, RouteName.AddToListScreen);
                    },
                      child: Container(height: 40,width: 150,
                      decoration: BoxDecoration(
                        color: AppColor.white_light,
                        borderRadius: BorderRadius.circular(8),
                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          const Icon(Icons.add,color: AppColor.grey,size: 24,),
                          const SizedBox(width: 8,),
                          Utils.mediumHeadingNormalText(text:UtilStrings.Add_New_People,
                              fontWeight: FontWeight.w700,textSize: 12,),
                        ],),
                      ),
                    ),
                    const Spacer(),
                    Container(height: 35,width: 35,
                      decoration: BoxDecoration(
                        color: AppColor.white_light,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Utils.image(image: "delete.png",color: AppColor.grey,height: 20,width: 20),
                        ],
                      ),
                    ),
                  ],),
                ),
                Utils.customDivider(),
                const SizedBox(height: 16,),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
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
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Utils.image(image:Constants.groupModel[index].image,height:50,width:50)),
                                        const SizedBox(width: 16,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(height:8 ,),
                                            Utils.mediumHeadingNormalText(text:Constants.groupModel[index].name,
                                              fontWeight: FontWeight.w600,),
                                            const SizedBox(height:3,),
                                            Row(children: [
                                              SizedBox(
                                                width: size.width/1.5,
                                                child: Row(
                                                  children: [
                                                    const SizedBox(height:6,),
                                                    Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",
                                                        fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey),
                                                    const Spacer(),
                                                    Utils.image(image: "ic_comment.png",height: 20,width: 20)
                                                  ],
                                                ),
                                              ),
                                            ],)
                                          ],)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ],
          ),
        ExpansionTile(
          maintainState: true,
          onExpansionChanged: (value){
            setState(() {
              CEO=value;
            });
          },
          trailing: Icon(CEO?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down_sharp,color: AppColor.grey,),
          title:Utils.mediumHeadingNormalText(text: UtilStrings.CEO,
              fontWeight: FontWeight.w600,textAlign: TextAlign.start,textSize: 14,color: AppColor.black
          ),
          children: [
            Column(
              children: [
                Utils.customDivider(),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20,top: 16,bottom: 16),
                  child: Row(children: [
                    Container(height: 40,width: 150,
                      decoration: BoxDecoration(
                        color: AppColor.white_light,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add,color: AppColor.grey,size: 24,),
                          const SizedBox(width: 8,),
                          Utils.mediumHeadingNormalText(text:UtilStrings.Add_New_People,
                            fontWeight: FontWeight.w700,textSize: 12,),
                        ],),
                    ),
                    const Spacer(),
                    Container(height: 35,width: 35,
                      decoration: BoxDecoration(
                        color: AppColor.white_light,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Utils.image(image: "delete.png",color: AppColor.grey,height: 20,width: 20),
                        ],
                      ),
                    ),
                  ],),
                ),
                Utils.customDivider(),
                const SizedBox(height: 16,),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
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
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Utils.image(image:Constants.groupModel[index].image,height:50,width:50)),
                                        const SizedBox(width: 16,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(height:8 ,),
                                            Utils.mediumHeadingNormalText(text:Constants.groupModel[index].name,
                                              fontWeight: FontWeight.w600,),
                                            const SizedBox(height:3,),
                                            Row(children: [
                                              SizedBox(
                                                width: size.width/1.5,
                                                child: Row(
                                                  children: [
                                                    const SizedBox(height:6,),
                                                    Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",
                                                        fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey),
                                                    const Spacer(),
                                                    Utils.image(image: "ic_comment.png",height: 20,width: 20)
                                                  ],
                                                ),
                                              ),
                                            ],)
                                          ],)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
        const SizedBox(height: 50,),
      ],),
    );
  }
  bottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height: 160,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                dialog(2);
              },
              child: Row(children: [
                Utils.image(image: "remove_person_icon.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Remove_from_list,
                  color: AppColor.grey,)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                dialog(0);
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
                dialog(1);
              },
              child: Row(children: [
                Utils.image(image: "report_icon.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Report,
                  color: AppColor.grey,)
              ],),
            ),const SizedBox(height: 20,),

          ],),
        ),
      );
    });
  }
  dialog(int type) {
    showDialog(context: context, builder: (ctxt) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title: Column(children: [
          type == 0 ? Utils.image(image: "block_icon.png",
              height: 24,
              width: 24,
              color: AppColor.black) :
          type==1?Utils.image(image: "report_icon.png",
              height: 24,
              width: 24,
              color: AppColor.black):
          Utils.image(image: "remove_person_icon.png",
              height: 24,
              width: 24,
              color: AppColor.black),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(
              text: type == 0 ? UtilStrings.Are_you_sure_you_want_to_block :
              type==1? UtilStrings.Are_you_sure_you_want_to_report:
              UtilStrings.Are_you_sure_you_want_to_remove,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 14,),
          Utils.customDivider(),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      color: AppColor.appGreen,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Utils.mediumHeadingNormalText(text: UtilStrings.Yes,
                        color: AppColor.white,
                        textSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 34,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Utils.mediumHeadingNormalText(
                        text: UtilStrings.Cancel,
                        color: AppColor.grey,
                        textSize: 14,
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
