import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/route/route_name.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';

class MyConnectionScreen extends StatefulWidget {
  const MyConnectionScreen({Key? key}) : super(key: key);

  @override
  _MyConnectionScreenState createState() => _MyConnectionScreenState();
}

class _MyConnectionScreenState extends State<MyConnectionScreen> {
  String dropDownValue="Recent";
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:AppBar(
          backgroundColor: AppColor.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_sharp,color:AppColor.black,)),
          title: Utils.mediumHeadingNormalText(text:UtilStrings.My_Connections,
              color: AppColor.black,fontWeight: FontWeight.w700),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Utils.image(image: "filter.png",height: 18,width: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Utils.image(image: "search.png",height: 18,width: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                  onTap: (){
                    bottomSheet();
                  },
                  child:
                  const Icon(Icons.more_vert,color:AppColor.grey,),
                ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width:size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
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
                                Container(height: 50,width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColor.black,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Utils.image(image: "profile.jpg",fit: BoxFit.cover)),
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
                                          Utils.mediumHeadingNormalText(text:"Naman Rastogi",textSize: 14,fontWeight: FontWeight.w700),
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
                                    Row(
                                      children: [
                                        const SizedBox(width:10,),
                                        Container(height: 25,width: 120,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: AppColor.grey2)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Utils.image(image: "expert.png",height: 14,width: 14),
                                              SizedBox(width: 8,),
                                              Utils.mediumHeadingNormalText(text: UtilStrings.Financial_Expert+"+2",textSize:10)
                                            ],),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: size.width/1.6,
                                      child: Row(
                                        children: [
                                          Utils.mediumHeadingNormalText(text: "Product Designer at TESLA",textSize:12,textAlign:TextAlign.start,
                                            fontWeight: FontWeight.w400,color: Colors.grey),
                                          Spacer(),
                                          Utils.image(image: "ic_comment.png",height: 18,width: 18),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Utils.mediumHeadingNormalText(text: "Connected 17th Mar 23",textSize:12,textAlign:TextAlign.start,
                                        fontWeight: FontWeight.w400,color: Colors.grey),
                                    ),
                                  ],)
                              ],),
                            const SizedBox(height:16,),
                            Utils.customDivider(),
                            const SizedBox(height:16,),
                          ],),
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
      return SizedBox(height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
            const SizedBox(height: 20,),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Navigator.pushNamed(context, RouteName.MyBlockListScreen);
              },
              child: Row(children: [
                Utils.image(image: "ic_close_eye.png",height: 18),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.View_Block_Lists,
                    color: AppColor.grey,fontWeight: FontWeight.w500)
              ],),
            ),
            const SizedBox(height: 20,),
          ],),
        ),
      );
    });
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
