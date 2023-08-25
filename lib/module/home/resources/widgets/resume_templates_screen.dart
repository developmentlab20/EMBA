import 'package:emba/utils/route/route_name.dart';
import 'package:emba/utils/string_utils.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/common/appbar/common_appBar.dart';

class ResumeTemplatesScreen extends StatefulWidget {
  String? name;
   ResumeTemplatesScreen({Key? key,this.name}) : super(key: key);

  @override
  State<ResumeTemplatesScreen> createState() => _ResumeTemplatesScreenState();
}

class _ResumeTemplatesScreenState extends State<ResumeTemplatesScreen> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:widget.name,events: true,),
      ),
      body: SizedBox(
        width:size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (
                      context,int index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20,),
                     Padding(
                      padding: const EdgeInsets.only(right:20),
                      child: GestureDetector(
                          onTap: (){
                            bottomSheetOnChat();
                          },
                          child: const Icon(Icons.more_vert,size:20,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                        Utils.image(image: "ic_pdf.png",height:24,width:24),
                        const SizedBox(width: 16,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height:0,),
                            Utils.mediumHeadingNormalText(text: "EMBA Executives.pdf",
                                fontWeight: FontWeight.w600,textSize: 16),
                            const SizedBox(height:6,),
                            Row(children: [
                              Utils.image(image: "person_icon.png",height: 18,width:18),
                              const SizedBox(width: 6,),
                              Utils.mediumHeadingNormalText(text:UtilStrings.Shared_by,textSize:14,
                                  color: AppColor.grey,fontWeight: FontWeight.w500),
                              const SizedBox(width: 6,),
                              Container(height: 20,width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: AppColor.grey)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Utils.image(image: "boy_image.png",height: 14,width: 14),
                                    const SizedBox(width: 6,),
                                    Utils.mediumHeadingNormalText(text:"Neerja B",textSize:10,
                                        color: AppColor.grey,fontWeight: FontWeight.w500),
                                  ],),
                              ),
                              const SizedBox(width: 6,),
                              Container(height: 4,width: 4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.grey
                                ),
                              ),
                              const SizedBox(width: 6,),
                              Utils.mediumHeadingNormalText(text:"3w ago",textSize:14,
                                  color: AppColor.grey,fontWeight: FontWeight.w500),
                            ]
                            ),
                          ],)
                      ],),
                    ),
                    const SizedBox(height:20,),
                    Utils.customDivider(),
                  ],);
              })
            ],
          ),
        ),
      ),
    );
  }
  bottomSheetOnChat(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height:170,
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
              },
              child: Row(children: [
                Utils.image(image: "download_icon.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Download,
                    color: AppColor.grey,fontWeight: FontWeight.normal)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, RouteName.SendMessageScreen);
              },
              child: Row(children: [
                Utils.image(image: "ic_comment.png",height: 20,width:20,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Send_in_a_message,
                    color: AppColor.grey,fontWeight: FontWeight.normal)
              ],),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                reportDialog();
              },
              child: Row(children: [
                Utils.image(image: "report_icon.png",height: 20,width:20,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Report,
                    color: AppColor.grey,fontWeight: FontWeight.normal)
              ],),
            ),
            const SizedBox(height: 16,),

          ],),
        ),
      );
    });
  }
  reportDialog(){
    showDialog(context: context, builder: (ctxt){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title:Column(children: [
          Utils.image(image: "report_icon.png",height: 24,width: 24,color: AppColor.black),
          const SizedBox(height: 20,),
          Utils.mediumHeadingNormalText(text:
          UtilStrings.Are_you_sure_you_want_to_report,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 14,),
          Utils.customDivider(),
          const SizedBox(height: 14,),
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
