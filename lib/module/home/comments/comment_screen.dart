import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/route/route_name.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/common/appbar/common_appBar.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  bool like=false;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Post,),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20,top:30),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.image(image: "demo_image.png",height:52),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width/1.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Startup,textSize: 14,fontWeight: FontWeight.w700),
                            Padding(
                              padding: const EdgeInsets.only(top:6,right: 6,left: 6),
                              child: Container(height: 4,width:4,
                                decoration: BoxDecoration(
                                    color: AppColor.grey,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:6),
                              child: Utils.mediumHeadingNormalText(text:"572k members",textSize: 10,color: AppColor.grey),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: (){
                                  bottomSheet();
                                },
                                child: const Icon(Icons.more_vert)),
                          ],
                        ),
                      ),
                      const SizedBox(height:2,),
                      Row(
                        children: [
                          const SizedBox(width:10,),
                          Utils.mediumHeadingNormalText(text:UtilStrings.Posted_by,textSize: 14,fontWeight: FontWeight.w700),
                          Padding(
                            padding: const EdgeInsets.only(top:6,right: 6,left: 6),
                            child: Container(height:24,width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.grey2),
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right:8,left: 8),
                                    child: Container(height: 16,width: 16,
                                      child: Center(
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                              child: Utils.image(image: "demo_image.png"))),
                                    ),
                                  ),

                                  Utils.mediumHeadingNormalText(text: "Neerja B",textSize:12,fontWeight: FontWeight.w500,color: AppColor.grey),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:6,right: 4,left: 4),
                            child: Container(height: 4,width:4,
                              decoration: BoxDecoration(
                                  color: AppColor.grey,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:6),
                            child: Utils.mediumHeadingNormalText(text: "Yesterday",textSize:12,fontWeight: FontWeight.w500,color: AppColor.grey),
                          ),
                        ],
                      ),
                    ],)
                ],),
              const SizedBox(height:16,),
              Utils.mediumHeadingNormalText(text: UtilStrings.HOME_TITLE,textSize:12,textAlign:TextAlign.start,
                fontWeight: FontWeight.w500,),
              const SizedBox(height:6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Utils.mediumHeadingNormalText(text:"832 views",textSize:12,textAlign:TextAlign.start,
                    color: AppColor.grey,),
                ],),
              const SizedBox(height:16,),
              Utils.customDivider(),
              const SizedBox(height:16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  GestureDetector(
                    onTap: (){
                     if(like==false){
                       setState(() {
                         like=true;
                       });
                     }else{
                       setState(() {
                         like=false;
                       });
                     }
                    },
                    child: Row(children: [
                      Utils.image(image: "like_icon.png",height:20,
                          color:like==false?null:AppColor.appGreen
                      ),
                      const SizedBox(width:8,),
                      Padding(
                        padding: const EdgeInsets.only(top:4),
                        child: Utils.mediumHeadingNormalText(text:"120",textSize:12,textAlign:TextAlign.start,
                          color: AppColor.grey,),
                      ),
                    ],),
                  ),
                  GestureDetector(onTap: (){
                  },
                    child: Row(children: [
                      Utils.image(image: "comment_icon.png",height:16),
                      const SizedBox(width:8,),
                      Utils.mediumHeadingNormalText(text:"970",textSize:12,textAlign:TextAlign.start,
                        color: AppColor.grey,),
                    ],),
                  ),
                  Row(children: [
                    Utils.image(image: "share_icon.png",height:18),
                    const SizedBox(width:8,),
                    Padding(
                      padding: const EdgeInsets.only(top:4),
                      child: Utils.mediumHeadingNormalText(text:"989",textSize:12,textAlign:TextAlign.start,
                        color: AppColor.grey,),
                    ),
                  ],),
                ],),
              const SizedBox(height:16,),
              Utils.customDivider(),
              const SizedBox(height:16,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount:3,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                return  Column(children: [
                  SizedBox(height: 20,),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: AppColor.white_light,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10,right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Utils.image(image: "demo_image.png",height:45,width: 45)),
                              const SizedBox(width:6,),
                              Utils.mediumHeadingNormalText(text:"Meghna Paul",fontWeight: FontWeight.w600),
                              const SizedBox(width: 12,),
                              Padding(
                                padding: const EdgeInsets.only(top:12),
                                child: Container(height: 5,width: 5,
                                  decoration: BoxDecoration(
                                      color: AppColor.grey,
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12,),
                              Utils.mediumHeadingNormalText(text:"2h ago",fontWeight: FontWeight.w600,color: AppColor.grey,
                                  textSize: 14),],),
                          const SizedBox(height:10,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.HOME_TITLE,textSize:12,textAlign:TextAlign.start,
                            fontWeight: FontWeight.w500,),
                          const SizedBox(height: 16,),
                        ],),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left:16,right: 16),
                    child: Row(children: [
                      Utils.image(image: "like_icon.png",height:16,
                          color:like==false?null:AppColor.appGreen
                      ),
                      const SizedBox(width:6,),
                      Utils.mediumHeadingNormalText(text:"12",textSize:12,textAlign:TextAlign.start,
                        color: AppColor.grey,),
                      const SizedBox(width: 22,),
                      Padding(
                        padding: const EdgeInsets.only(top:4),
                        child: Container(height: 5,width: 5,
                          decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(16)
                          ),
                        ),
                      ),
                      const SizedBox(width: 22,),
                      Utils.mediumHeadingNormalText(text:UtilStrings.Reply,textSize:12,textAlign:TextAlign.start,
                        color: AppColor.grey,),
                    ],),
                  ),
                  const SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.only(left:10,right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Utils.image(image: "demo_image.png",height:30,width: 30)),
                        const SizedBox(width:12,),
                        Padding(
                          padding: const EdgeInsets.only(top:2),
                          child: Utils.mediumHeadingNormalText(text:"Sakeer",fontWeight: FontWeight.w600,textSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:2,left:12),
                          child: Utils.mediumHeadingNormalText(text:"Looks like we are arguing",
                              textSize: 12),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top:2,left:12),
                          child: Utils.mediumHeadingNormalText(text:UtilStrings.See_more,
                              textSize: 14,color: AppColor.grey),
                        ),
                      ],),
                  ),
                  const SizedBox(height:10,),
                  Utils.customDivider()
                ],);
              }),
              const SizedBox(height: 24,),
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
      return SizedBox(height: 110,
        child: Padding(
            padding: const EdgeInsets.only(left:20,right: 20),
            child: Column(children: [
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  setState(() {

                  });
                },
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(top:4),
                    child: Utils.image(image:"raise_outline.png",height: 18),
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
                  });
                },
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(top:4),
                    child: Utils.image(image: "raise_outline.png",height: 18),
                  ),
                  const SizedBox(width: 12,),
                  Utils.mediumHeadingNormalText(text:UtilStrings.Popular,color: AppColor.grey,textSize: 16,
                      fontWeight: FontWeight.w500),

                ],),
              ),
              const SizedBox(height: 4,),
            ],)

        ),
      );
    });
  }
}
