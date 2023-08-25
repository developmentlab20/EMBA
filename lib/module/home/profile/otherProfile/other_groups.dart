import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';

class OtherGroupScreen extends StatefulWidget {
  const OtherGroupScreen({Key? key}) : super(key: key);

  @override
  _OtherGroupScreenState createState() => _OtherGroupScreenState();
}

class _OtherGroupScreenState extends State<OtherGroupScreen> {
  String dropDownValue="Recent";
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Groups+" (20)",action: true,imageUrl: "search.png",),
      ),
      body: SizedBox(
        width:size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12,),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Utils.mediumHeadingNormalText(text:UtilStrings.Mutual_Groups+"(50)",textSize: 14,fontWeight: FontWeight.w700)),
              const SizedBox(height: 12,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                    return  Container(width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20,right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(height: 50,width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: Utils.image(image: "profile.jpg",fit: BoxFit.cover)),
                                    ),
                                    // Utils.image(image: "ic_online.png",height: 20,width: 20)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width/1.4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 10,),
                                          Utils.mediumHeadingNormalText(text:"Y Combinator Discussion",textSize: 14,fontWeight: FontWeight.w700),
                                          const Spacer(),
                                          SizedBox(
                                            height: 22,width: 22,
                                            child: PopupMenuButton(
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              position: PopupMenuPosition.under,
                                              iconSize: 20,
                                              itemBuilder: (ctx) => [
                                                // _buildPopupMenuItem("report_icon.png",UtilStrings.Report,(){},),
                                                // _buildPopupMenuItem("block_icon.png",UtilStrings.Block_this_person,(){},),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height:2,),
                                    Container(
                                      width: size.width/1.5,
                                        margin: EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 4,),
                                            Utils.mediumHeadingNormalText(text: "572K Members",textSize:10,color: Colors.grey),
                                            SizedBox(width: 6,),
                                            Container(
                                              margin: EdgeInsets.only(top: 2),
                                              height: 3,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                            ),
                                            SizedBox(width: 2,),
                                            Utils.mediumHeadingNormalText(text: "5+ New Request",textSize:10,color: AppColor.grey),
                                            Spacer(),
                                            Utils.borderButton("View", AppColor.appGreen,  AppColor.appGreen, 64, 30)
                                          ],
                                        )),
                                    SizedBox(height: 14,),
                                  ],
                                )
                              ],),
                            Utils.customDivider(),
                            SizedBox(height: 14,),

                          ],),
                      ),
                    );
                  }),
              const SizedBox(height: 12,),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Utils.mediumHeadingNormalText(text:UtilStrings.Other_Joined_Groups,textSize: 14,fontWeight: FontWeight.w700)),
              const SizedBox(height: 12,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                    return  Container(width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20,right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(height: 50,width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: Utils.image(image: "profile.jpg",fit: BoxFit.cover)),
                                    ),
                                    // Utils.image(image: "ic_online.png",height: 20,width: 20)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width/1.4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 10,),
                                          Utils.mediumHeadingNormalText(text:"Y Combinator Discussion",textSize: 14,fontWeight: FontWeight.w700),
                                          const Spacer(),
                                          SizedBox(
                                            height: 22,width: 22,
                                            child: PopupMenuButton(
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              position: PopupMenuPosition.under,
                                              iconSize: 20,
                                              itemBuilder: (ctx) => [
                                                // _buildPopupMenuItem("report_icon.png",UtilStrings.Report,(){},),
                                                // _buildPopupMenuItem("block_icon.png",UtilStrings.Block_this_person,(){},),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height:2,),
                                    Container(
                                        width: size.width/1.5,
                                        margin: EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 4,),
                                            Utils.mediumHeadingNormalText(text: "572K Members",textSize:10,color: Colors.grey),
                                            SizedBox(width: 6,),
                                            Container(
                                              margin: EdgeInsets.only(top: 2),
                                              height: 3,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                            ),
                                            SizedBox(width: 2,),
                                            Utils.mediumHeadingNormalText(text: "5+ New Request",textSize:10,color: AppColor.grey),
                                            Spacer(),
                                            Utils.borderButton("View", AppColor.appGreen,  AppColor.appGreen, 64, 30)
                                          ],
                                        )),
                                    SizedBox(height: 14,),
                                  ],
                                )
                              ],),
                            Utils.customDivider(),
                            SizedBox(height: 14,),

                          ],),
                      ),
                    );
                  }),
            ],),
        ),
      ),
    );
  }
}
PopupMenuItem _buildPopupMenuItem(
    String? image,String title,Function? onTap) {
  return PopupMenuItem(
    onTap: (){onTap!();},
    child:  Row(
      children: [
        Utils.image(image:image,height: 16),
        const SizedBox(width: 12,),
        Utils.mediumHeadingNormalText(text: title,color: AppColor.grey,textSize: 14,),
      ],
    ),
  );
}