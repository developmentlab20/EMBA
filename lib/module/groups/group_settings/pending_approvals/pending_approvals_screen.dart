import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';

  class PendingApprovalsScreen extends StatelessWidget {
  const PendingApprovalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.PENDING_APPROVALS,),
      ),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(children: [
              SizedBox(height:20,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context,int index){
              return Container(
                padding: EdgeInsets.only(bottom: 16),
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                      padding: EdgeInsets.only(left:20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.more_vert)
                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Utils.image(image: "boy_image.png",height: 50,width: 50 ),
                          SizedBox(width:16,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height:4,),
                              Utils.mediumHeadingNormalText(text: UtilStrings.Wade_Warren,fontWeight: FontWeight.w600),
                              const SizedBox(height:3,),
                              Container(height: 25,width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColor.grey2)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Utils.image(image: "expert.png",height: 14,width: 14),
                                    SizedBox(width: 8),
                                    Utils.mediumHeadingNormalText(text: UtilStrings.Financial_Expert+" +2",textSize:10,
                                        color: AppColor.black_2)
                                  ],),
                              ),
                              const SizedBox(height:6,),
                              Utils.mediumHeadingNormalText(text: "Chief Exectuve Officer at Ollyo",textSize:12,
                                  color: AppColor.grey),
                              const SizedBox(height:8,),
                              Row(
                                children: [
                                  Container(
                                    height: 35,width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: AppColor.appGreen)
                                    ),
                                    child: Center(
                                      child: Utils.mediumHeadingNormalText(text:UtilStrings.Accept,color: AppColor.appGreen,
                                          fontWeight: FontWeight.w600,textSize: 12),
                                    ),
                                  ),
                                  const SizedBox(width:12,),
                                  Container(
                                    height: 35,width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.profile_grey,
                                    ),
                                    child: Center(
                                      child: Utils.mediumHeadingNormalText(text:UtilStrings.Decline,color: AppColor.grey,
                                          fontWeight: FontWeight.w600,textSize: 12),
                                    ),
                                  ),
                                ],
                              ),

                            ],)
                        ],
                      ),
                    ),
                    const SizedBox(height: 22,),
                    Utils.customDivider()
                  ],),
              );
            })

          ],),
        ),
      ),
    );
  }
}
