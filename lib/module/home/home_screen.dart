import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import '../../utils/constants/constants.dart';
import '../../utils/route/route_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import 'profile/otherProfile/other_profile_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropDownValue="Recent";
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      body: SizedBox(
        width:size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 12,),
              Utils.customDivider(),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                return  Padding(
                  padding: const EdgeInsets.only(bottom:12),
                  child: Container(width: size.width,
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.14),blurRadius:1)]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:20,right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        const SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherProfileDetailScreen()));
                                },
                                child: Utils.image(image: "demo_image.png",height:52)),
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
                                            bottomSheet(1);
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
                                if(Constants.like[index]==false){
                                  setState(() {
                                    Constants.like[index]=true;
                                  });
                                }else{
                                  setState(() {
                                    Constants.like[index]=false;
                                  });
                                }
                              },
                              child: Row(children: [
                                Utils.image(image: "like_icon.png",height:20,
                                color: Constants.like[index]==false?null:AppColor.appGreen
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
                        const SizedBox(height: 16,)
                      ],),
                    ),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(
                  children: [
                    Utils.mediumHeadingNormalText(text: UtilStrings.Suggested_People_or_Events,
                        fontWeight: FontWeight.bold,textSize:16),
                    const Spacer(),
                    Utils.mediumHeadingNormalText(text: UtilStrings.View_More,
                        color: AppColor.grey,textSize:12),
                    const SizedBox(width: 3,),
                    const Icon(Icons.arrow_forward,color: AppColor.grey,)
                  ],
                ),
              ),

          ],),
        ),
      ),
    );
  }
  bottomSheet(int type){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height: 110,
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
          Column(children: [
            const SizedBox(height: 20,),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(top:4),
                child: Utils.image(image: "report_icon.png",height: 18),
              ),
              const SizedBox(width: 12,),
              Utils.mediumHeadingNormalText(text:UtilStrings.Report,color: AppColor.grey,textSize: 16,
                  fontWeight: FontWeight.w500),
            ],),
            const SizedBox(height: 16,),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(top:4),
                child: Utils.image(image: "block_icon.png",height: 18),
              ),
              const SizedBox(width: 12,),
              Utils.mediumHeadingNormalText(text:UtilStrings.Block_this_person,color: AppColor.grey,textSize: 16,
                  fontWeight: FontWeight.w500),

            ],),
            const SizedBox(height: 4,),
          ],)

        ),
      );
    });
  }
}