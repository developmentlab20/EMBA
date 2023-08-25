import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/route/route_name.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';

class FeedWidgetScreen extends StatefulWidget {
  const FeedWidgetScreen({Key? key}) : super(key: key);

  @override
  State<FeedWidgetScreen> createState() => _FeedWidgetScreenState();
}

class _FeedWidgetScreenState extends State<FeedWidgetScreen> {
  String dropDownValue="Recent";
  bool like=false;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  SizedBox(
        width: size.width,
        child: Column(children: [
          SizedBox(height: 20,),
          Container(
              width: size.width,
              height: size.height,
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom:16),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColor.white,
                            boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.14),blurRadius: 1)]
                        ),
                        child: Column(children: [
                          SizedBox(height: 16,),
                          Padding(
                            padding: const EdgeInsets.only(left:20,right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 50,width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColor.grey_light
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Utils.image(image: "cap_icon.png",height: 20,width: 20),
                                    ],
                                  ),
                                ),
                                const SizedBox(width:16,),
                                Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4,),
                                    SizedBox(
                                      width: size.width/1.4,
                                      child: Row(
                                        children: [
                                          Utils.mediumHeadingNormalText(text: UtilStrings.Sakeer,fontWeight: FontWeight.w600),
                                          const SizedBox(width: 12,),
                                          Container(
                                            height: 6,width: 6,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: AppColor.grey
                                            ),
                                          ),
                                          const SizedBox(width: 12,),
                                          Utils.mediumHeadingNormalText(text: "2h ago",fontWeight: FontWeight.w600,color: AppColor.grey,
                                              textSize: 14
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                              onTap: (){

                                              },
                                              child: const Icon(Icons.more_vert))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height:4,),
                                    Container(height: 25,width: 135,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: AppColor.grey2)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Utils.image(image: "expert.png",height: 14,width: 14),
                                          const SizedBox(width: 8),
                                          Utils.mediumHeadingNormalText(text:UtilStrings.Financial_Expert+" +2",textSize:10,
                                              color: AppColor.black_2)
                                        ],),
                                    )
                                  ],)
                              ],
                            ),
                          ),
                          const SizedBox(height:14,),
                          Padding(
                            padding: const EdgeInsets.only(left:20,right: 20),
                            child: Utils.mediumHeadingNormalText(text:"Well it will be helpful if everyone in my network participate",
                                textSize:14,textAlign:TextAlign.start,fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height:16,),
                          index==1?
                          Padding(
                            padding: const EdgeInsets.only(left:20,right:20),
                            child: Container(width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColor.grey2)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left:16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height:20,),
                                    Utils.mediumHeadingNormalText(text:"Which is most efficient tool to analyze my websites performance?",
                                        textSize:14,textAlign: TextAlign.start,fontWeight: FontWeight.w500),
                                    const SizedBox(height:20,),
                                    ListView.builder(
                                        itemCount: Constants.reportedPosts.length,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context,int index){
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom:16),
                                            child: Container(
                                              height: 50,width: size.width,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: AppColor.grey2),
                                                  borderRadius: BorderRadius.circular(12)
                                              ),
                                              child: Row(children: [
                                                Checkbox(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(3)),
                                                    activeColor: AppColor.grey,
                                                    value: Constants.reportedPosts[index].value, onChanged: (value){
                                                  if(Constants.reportedPosts[index].value){
                                                    setState(() {
                                                      Constants.reportedPosts[index].value=false;
                                                    });
                                                  }else{
                                                    setState(() {
                                                      Constants.reportedPosts[index].value=true;
                                                    });
                                                  }
                                                }),
                                                Utils.mediumHeadingNormalText(text:Constants.reportedPosts[index].text,color: AppColor.grey,
                                                    textSize:14,textAlign:TextAlign.start,fontWeight:FontWeight.w500),
                                              ],),
                                            ),
                                          );
                                        }),
                                    const SizedBox(height:4,),
                                    Utils.mediumHeadingNormalText(text:"Poll ends in 7 Days",color: AppColor.grey,
                                        textSize:12,textAlign:TextAlign.start,fontWeight: FontWeight.w500),
                                    const SizedBox(height:22,),
                                  ],),
                              ),
                            ),
                          ):
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Utils.mediumHeadingNormalText(text:"832 Views",color: AppColor.grey,
                                  textSize:12,textAlign:TextAlign.start,fontWeight: FontWeight.w500),
                              const SizedBox(width: 20,),
                            ],
                          ),
                          const SizedBox(height:20,),
                          Utils.customDivider(),
                          const SizedBox(height:20,),
                          Padding(
                            padding: const EdgeInsets.only(left:20,right: 20),
                            child: Row(
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
                                        color: like==false?null:AppColor.appGreen
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
                                  Navigator.pushNamed(context, RouteName.CommentScreen);
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
                          ),
                          const SizedBox(height:16,),
                        ],),
                      ),
                    );
                  })
          ),
          SizedBox(height:60,)
        ],),
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
          child:Column(children: [
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
          ],)
        ),
      );
    });
  }
}
