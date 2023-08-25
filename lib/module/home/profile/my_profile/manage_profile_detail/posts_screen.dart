import 'package:flutter/material.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String dropDownValue="Recent";
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Posts+"(100)",action: true,imageUrl: "filter.png",),
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
                                          Utils.mediumHeadingNormalText(text:"2h ago",textSize: 12,color: Colors.grey,
                                              fontWeight: FontWeight.w400),
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
                                  Row(children: [
                                    Utils.image(image: "like_icon.png",height:20),
                                    const SizedBox(width:8,),
                                    Padding(
                                      padding: const EdgeInsets.only(top:4),
                                      child: Utils.mediumHeadingNormalText(text:"120",textSize:12,textAlign:TextAlign.start,
                                        color: AppColor.grey,),
                                    ),
                                  ],),
                                  Row(children: [
                                    Utils.image(image: "comment_icon.png",height:16),
                                    const SizedBox(width:8,),
                                    Utils.mediumHeadingNormalText(text:"970",textSize:12,textAlign:TextAlign.start,
                                      color: AppColor.grey,),
                                  ],),
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
