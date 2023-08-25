
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';

class BlockListChatScreen extends StatefulWidget {
  const BlockListChatScreen({Key? key}) : super(key: key);

  @override
  _BlockListChatScreenState createState() => _BlockListChatScreenState();
}

class _BlockListChatScreenState extends State<BlockListChatScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child: CommonAppBar(title:"Block Lists",action: true,onTap: (){
        },),),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Utils.mediumHeadingNormalText(text: UtilStrings.Messages,
                fontWeight:FontWeight.bold,textSize: 16,color: AppColor.black,
                textAlign: TextAlign.start),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount:2,
                itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom:12),
                    child: Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.ChatScreen);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left:20,right: 20),
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 42,width: 42,
                                      decoration: BoxDecoration(
                                          color: AppColor.black,
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Utils.image(image: "demo_image.png",fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(width: 16,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: size.width/1.4,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Utils.mediumHeadingNormalText(text:"Courtney",
                                                fontWeight: FontWeight.w600,),
                                              Row(
                                                children: [
                                                  index==0 ?  Utils.image(image: "ic_mute.png",height: 16,width: 16):Container(),
                                                  index==0 ?SizedBox(width: 12,):Container(),
                                                  index==0 ? Container(
                                                    height: 28,
                                                    width: 28,
                                                    decoration: BoxDecoration(
                                                        color: AppColor.appGreen,
                                                        borderRadius: BorderRadius.circular(50)
                                                    ),
                                                    child: Center(
                                                      child: Utils.mediumHeadingNormalText(text:"99+",
                                                          fontWeight: FontWeight.normal,textSize: 10,color: AppColor.white),
                                                    ) ,
                                                  ):Container(),
                                                  index==0 ? SizedBox(width: 22,):Container(),
                                                  GestureDetector(
                                                      onTap: (){
                                                        bottomSheetOnChat();
                                                      },
                                                      child: const Icon(Icons.more_vert,size:20,color: AppColor.grey,)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height:3,),
                                        Container(
                                          width: size.width/1.5,
                                          child:  Row(
                                            children: [
                                              Container(
                                                width: size.width/1.5,
                                                child: Utils.mediumHeadingNormalText(text:"Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                                                    fontWeight: FontWeight.normal,textSize:12,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,color: AppColor.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height:3,),
                                        Utils.mediumHeadingNormalText(text:"Yesterday , 23:59",
                                            fontWeight: FontWeight.normal,textSize: 12,color: AppColor.grey),
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
          ),
        ],
      ),
    );
  }
  bottomSheetOnChat(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height:240,
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
                popDialog("ic_archived.png",UtilStrings.Are_you_sure_archive);
              },
              child: Row(children: [
                Utils.image(image: "ic_archived.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Archive_Chat,
                    color: AppColor.grey,fontWeight: FontWeight.normal)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

                popDialog("delete_grey.png",UtilStrings.Are_you_sure_delete);
              },
              child: Row(children: [
                Utils.image(image: "delete_grey.png",height: 16,width:16,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Delete,
                    color: AppColor.grey,fontWeight: FontWeight.normal)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

                popDialog("ic_mute.png",UtilStrings.Are_you_sure_mute);
              },
              child: Row(children: [
                Utils.image(image: "ic_mute.png",height: 16,width:16,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Mute_Messages,
                    color: AppColor.grey,fontWeight: FontWeight.normal)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                popDialog("report_icon.png",UtilStrings.Are_you_sure_report);
              },
              child: Row(children: [
                Utils.image(image: "report_icon.png",height: 16,width:16,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Report,
                    color: AppColor.grey,fontWeight: FontWeight.normal)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                popDialog("ic_block.png",UtilStrings.Are_you_sure_unblock);
              },
              child: Row(children: [
                Utils.image(image: "ic_block.png",height: 16,width:16,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Unblock,
                    color: AppColor.grey,fontWeight: FontWeight.normal)
              ],),
            ),
            const SizedBox(height: 16,),
          ],),
        ),
      );
    });
  }
  popDialog(String imageUrl,String msg){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          Utils.image(image: imageUrl,height: 24,width: 24),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text:msg,
              fontWeight: FontWeight.w400),
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
}
