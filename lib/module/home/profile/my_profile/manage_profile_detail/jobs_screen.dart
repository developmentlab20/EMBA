import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  String dropDownValue="Recent";
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Jobs+"(50)",action: true,imageUrl: "filter.png",),
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
                                      borderRadius: BorderRadius.circular(4),
                                      child: Utils.image(image: "job_profile.png",fit: BoxFit.cover)),
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
                                          Utils.mediumHeadingNormalText(text:"Product Designer L3",textSize: 14,fontWeight: FontWeight.w700),
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
                                        Utils.image(image: "location.png",height: 14,width: 14,color: Colors.grey),
                                        Utils.mediumHeadingNormalText(text: " Atlanta,2972 Web Bridge",textSize:12,textAlign:TextAlign.start,
                                            fontWeight: FontWeight.w400,color: Colors.grey),
                                      ],
                                    ),
                                    const SizedBox(height:2,),
                                    Row(
                                      children: [
                                        const SizedBox(width:10,),
                                        Utils.image(image: "ic_timer.png",height: 14,width: 14,color: Colors.grey),
                                        Utils.mediumHeadingNormalText(text: " Full-Time",textSize:12,textAlign:TextAlign.start,
                                            fontWeight: FontWeight.w400,color: Colors.grey),
                                        SizedBox(width: 4,),
                                        Container(
                                          margin: EdgeInsets.only(top: 4),
                                          height: 8,
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 4,),

                                        Utils.mediumHeadingNormalText(text: "On-site",textSize:12,textAlign:TextAlign.start,
                                            fontWeight: FontWeight.w400,color: Colors.grey),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Utils.image(image: "person_icon.png",height: 14,width: 14),
                                          Utils.mediumHeadingNormalText(text: " Posted by",textSize:12,textAlign:TextAlign.start,
                                              fontWeight: FontWeight.w400,color: Colors.grey),
                                          const SizedBox(width:10,),
                                          Container(height: 22,width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: AppColor.grey2)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(height: 14,width: 14,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50)
                                                  ),
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(50),
                                                      child: Utils.image(image: "profile.jpg",fit: BoxFit.cover)),
                                                ),
                                                Utils.mediumHeadingNormalText(text: "Naman Rastogi",textSize:10,color: Colors.grey),
                                              ],),
                                          ),
                                          SizedBox(width: 4),

                                          Container(
                                            margin: EdgeInsets.only(top: 4),
                                            height: 4,
                                            width: 4,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Utils.mediumHeadingNormalText(text: " 17h ago",textSize:10,color: Colors.grey),

                                        ],
                                      ),
                                    ),
                                   SizedBox(height: 12,),
                                   Row(
                                     children: [
                                       Utils.borderButton("View", AppColor.appGreen, AppColor.appGreen, size.width/2,40),
                                       Utils.image(image: "ic_bookmark.png",height: 32,width: 32),
                                       Utils.image(image: "ic_share_invite.png",height: 32,width: 32),
                                     ],
                                   )
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
