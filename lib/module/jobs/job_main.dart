import 'package:emba/module/jobs/applied_job.dart';
import 'package:emba/module/jobs/my_posted_job.dart';
import 'package:emba/module/jobs/recommended_job.dart';
import 'package:emba/module/jobs/saved_job.dart';
import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import '../../utils/constants/constants.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/common_text_field.dart';

class JobViewScreen extends StatefulWidget {
  const JobViewScreen({Key? key}) : super(key: key);

  @override
  _JobViewScreenState createState() => _JobViewScreenState();
}

class _JobViewScreenState extends State<JobViewScreen> {
  String dropDownValue="Recent";
  int listIndex=0;
  bool fullTime=true;
  bool partTime=true;
  bool remote=true;
  bool onSite=false;
  List <Widget> _listwidget=[

  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listwidget=[
      const RecommendedJobScreen(),
      const AppliedJobScreen(),
      const SavedJobScreen(),
      const MyPostedJob(),
    ];
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButton: GestureDetector(
        onTap: (){
       createJobBottomSheet();
         },
        child: Container(
          height: 50,width: 50,
          decoration: BoxDecoration(
              color: AppColor.appGreen,
              borderRadius: BorderRadius.circular(8)
          ),
          child:  Center(child:Utils.image(image: "job_floating.jpeg",height: 28,width: 28)),
        ),
      ),
      body: SizedBox(
        width:size.width,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: 55,
                width: size.width,
                decoration: const BoxDecoration(
                    color: AppColor.white,
                    boxShadow: [BoxShadow(
                        color:Color.fromRGBO(0, 0, 0, 0.14,),blurRadius:2
                    )]
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: Constants.jobList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index==0?20:0,right: index==3?20:0
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            listIndex=index;
                          });
                          fetchValue();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width:120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 18,),
                                  Utils.mediumHeadingNormalText(text:Constants.jobList[index].text,
                                      textSize: 14,fontWeight: Constants.jobList[index].value==true?FontWeight.w500:FontWeight.w400,
                                      color:Constants.jobList[index].value==true?AppColor.black:AppColor.grey,
                                      textAlign: TextAlign.start),
                                  const Spacer(),
                                  Constants.jobList[index].value==true?
                                  Container(height:4,width: 60,
                                    decoration: BoxDecoration(
                                        color: AppColor.appGreen,
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                                    ),
                                  ):const SizedBox(),
                                ],),
                            )
                          ],),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width:16);
                },)
            ),
            Container(width: size.width,height: size.height/1.3-20,alignment: Alignment.topLeft,
              child: _listwidget[listIndex],
            ),
          ],),
        ),
      ),
    );
  }
  fetchValue(){
    for(int i=0;i<Constants.jobList.length;i++){
      if(i==listIndex){
        setState(() {
          Constants.jobList[i].value=true;
        });
      }else{
        setState(() {
          Constants.jobList[i].value=false;
        });
      }
    }
  }
  createJobBottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(25),
            topStart: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        context: context, builder: (ctxt){
      return StatefulBuilder(builder: (context,setState){
        return Container(
          height: MediaQuery.of(context).size.height-80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12,),
              Align(
                alignment: Alignment.center,
                child: Container(height: 8,width: 100,
                  decoration: BoxDecoration(
                      color: AppColor.grey_light,
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  const Icon(Icons.arrow_back,color: AppColor.grey,),
                  const SizedBox(width: 10,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.Share_anOpportunity,fontWeight: FontWeight.w600,
                      color: AppColor.grey,textSize: 14)
                ],),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Title,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(hint: UtilStrings.Title_of_job,height: 50,),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Type,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          fullTime=true;
                          partTime=false;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child:Row(children: [
                          const SizedBox(width: 10,),
                          Utils.image(image: fullTime?"raise_full.png":"raise_outline.png",height: 18,width: 18),
                          const SizedBox(width: 10,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.Full_Time,
                              color: AppColor.grey
                          ),
                        ],),),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          partTime=true;
                          fullTime=false;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child:Row(children: [
                          const SizedBox(width: 10,),
                          Utils.image(image:partTime?"raise_full.png":"raise_outline.png",height: 18,width: 18),
                          const SizedBox(width: 10,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.Part_Time,
                              color: AppColor.grey),
                        ],),),
                    ),
                  ),
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.location,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          onSite=false;
                          remote=true;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child:Row(children: [
                          const SizedBox(width: 10,),
                          Utils.image(image: remote?"raise_full.png":"raise_outline.png",height: 18,width: 18),
                          const SizedBox(width: 10,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.Remote,
                              color: AppColor.grey
                          ),
                        ],),),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          onSite=true;
                          remote=false;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child:Row(children: [
                          const SizedBox(width: 10,),
                          Utils.image(image:onSite?"raise_full.png":"raise_outline.png",height: 18,width: 18),
                          const SizedBox(width: 10,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.Onsite,
                              color: AppColor.grey),
                        ],),),
                    ),
                  ),
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.city,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(hint:"Canada",height: 50,),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Utils.mediumHeadingNormalText(text: UtilStrings.Description,fontWeight: FontWeight.w700,),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: CommonTextField(height: 100,hint: UtilStrings.Create_Group_DES,length: 150,lines: 3,),
              ),
              const Spacer(),
              Utils.customDivider(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                          color: AppColor.appGreen,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Utils.mediumHeadingNormalText(text: UtilStrings.Done,
                            color: AppColor.white,textSize: 14,fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],),
              ),
              const SizedBox(height: 20,),
            ],),
        );
      });
    });
  }
}
