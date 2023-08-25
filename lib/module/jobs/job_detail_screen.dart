import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/sharedpref/preferences.dart';
import '../../utils/sharedpref/shared_prefrence.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({Key? key}) : super(key: key);

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Job_Details,action: true,onTap: (){
          bottomSheet();
        },),
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20),
              child: Row(
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
                          ],
                        ),
                      ),
                      const SizedBox(height:4,),
                      Row(
                        children: [
                          const SizedBox(width:10,),
                          Utils.image(image: "location.png",height: 14,width: 14,color: Colors.grey),
                          Utils.mediumHeadingNormalText(text: " Atlanta,2972 Web Bridge",textSize:12,textAlign:TextAlign.start,
                              fontWeight: FontWeight.w400,color: Colors.grey),
                        ],
                      ),
                      const SizedBox(height:4,),
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
                      SizedBox(height: 4,),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Utils.image(image: "person_icon.png",height: 14,width: 14),
                            Utils.mediumHeadingNormalText(text: " Posted by",textSize:12,textAlign:TextAlign.start,
                                fontWeight: FontWeight.w400,color: Colors.grey),
                            const SizedBox(width:10,),
                            Utils.mediumHeadingNormalText(text: " 17h ago",textSize:10,color: Colors.grey),

                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Utils.borderButton("Apply", AppColor.appGreen, AppColor.appGreen, size.width/2,36),
                          Utils.image(image: "ic_bookmark.png",height: 38,width: 38),
                          Utils.image(image: "ic_share_invite.png",height: 38,width: 38),
                        ],
                      )
                    ],)
                ],),
            ),
        const SizedBox(height:16,),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Utils.mediumHeadingNormalText(text: UtilStrings.Posted_by,
                  textSize: 14,color: AppColor.black,fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20,),
        Row(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Container(height:70,width:70,
              decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius:BorderRadius.circular(50)
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Utils.image(image: "demo_image.png",fit: BoxFit.cover)),
            ),

            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.mediumHeadingNormalText(text: "Naman Rastogi",
                    textSize: 14,color: AppColor.black,fontWeight: FontWeight.w700),
                const SizedBox(height:16,),
                Row(
                  children: [
                    Container(height: 25,width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey2)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Utils.image(image: "expert.png",height: 14,width: 14),
                          const SizedBox(width: 8,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.Financial_Expert,textSize:10)
                        ],),
                    ),
                    const SizedBox(width:4,),
                    Container(height: 25,width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey2)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Utils.image(image: "leader.png",height: 14,width: 14),
                          const SizedBox(width: 8,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.Community_Leader,textSize: 10)
                        ],),
                    ),
                  ],),
                const SizedBox(height:12,),
                Utils.mediumHeadingNormalText(text:"Product Designer at TESLA",textSize:12,color: Colors.grey,fontWeight: FontWeight.w500),
                const SizedBox(height:10,),
              ],
            )
          ],
        ),
            SizedBox(height: 12,),
            Utils.customDivider(),
            SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Utils.mediumHeadingNormalText(text: UtilStrings.Description,
                  textSize: 14,color: AppColor.black,fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Utils.mediumHeadingNormalText(text: UtilStrings.Dummy_text,
                  textSize: 14,color: AppColor.black,fontWeight: FontWeight.w400,textAlign: TextAlign.start),
            ),
          ],
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
      return SizedBox(height:110,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child:
          Column(children: [
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

              },
              child: Row(children: [
                Utils.image(image: "report_icon.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Report,
                    color: AppColor.grey,fontWeight: FontWeight.w500)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

              },
              child: Row(children: [
                Utils.image(image: "ic_forward.png",height: 14,width:16,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Forward,
                    color: AppColor.grey,fontWeight: FontWeight.w500)
              ],),
            ),
          ],),
        ),
      );
    });
  }

}
