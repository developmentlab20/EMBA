import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/common/appbar/common_appBar.dart';
import '../../../utils/route/route_name.dart';
import 'feed_jobs_detail/feed_jobs_details_screen.dart';
import 'feed_jobs_detail/widgets/feed_widget_screen.dart';

class GroupDetailsScreen extends StatefulWidget {
  String? name;
  bool? joined;

   GroupDetailsScreen({Key? key,this.name,this.joined}) : super(key: key);
  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  String dropDownValue="Recent";


  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:widget.name,
        searchAction: true,color: AppColor.black,
        ),
      ),
      floatingActionButton: Container(
        height: 50,width: 50,
        decoration: BoxDecoration(
            color: AppColor.appGreen,
            borderRadius: BorderRadius.circular(8)
        ),
        child: const Center(child:Icon(Icons.add,color: AppColor.white,)),
      ),
      body:SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.image(image:"demo_image.png",height:60,width:60),
                  const SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height:6,),
                      Utils.mediumHeadingNormalText(text:widget.name,
                        fontWeight: FontWeight.w600,),
                      const SizedBox(height:12,),
                      Row(
                        children: [
                          Utils.mediumHeadingNormalText(text:UtilStrings.Private,
                              fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey),
                          Padding(
                            padding: const EdgeInsets.only(left:8,right: 8),
                            child: Container(height: 4,width: 4,
                              decoration: BoxDecoration(
                                  color: AppColor.grey,borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                          Utils.mediumHeadingNormalText(text:"10+ ${UtilStrings.recent_post}",
                              fontWeight: FontWeight.w400,textSize: 12,color: AppColor.grey),

                        ],
                      ),
                    ],)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,top:16),
              child: RichText(text: TextSpan(
                  text: UtilStrings.Group_Details_Des,
                  style: const TextStyle(color: AppColor.grey,fontSize:14),
                  children: [
                    TextSpan(
                      text: "  ${UtilStrings.See_more}",
                      style: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.black,fontSize: 16),
                    )
                  ]
              )),
            ),
            const SizedBox(height:14,),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.GroupMembersScreen);
                },
                child: Container(width: size.width,height:55,
                  decoration:BoxDecoration(
                      color: AppColor.grey_light,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:8,right:8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height:10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                          ImageStack(
                            imageList: Constants.imageStackList,
                            totalCount: Constants.imageStackList.length ,
                            imageRadius:20,
                            imageCount: 3,
                            imageBorderWidth:0,
                          ),
                          const SizedBox(width:8,),
                          Expanded(
                            child: Container(
                              child: Utils.mediumHeadingNormalText(text:UtilStrings.Image_Stack_Group_Des,textSize: 11,fontWeight: FontWeight.w500,
                                  color: AppColor.grey,textAlign: TextAlign.start),
                            ),
                          ),
                          const SizedBox(width:30,),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Icon(Icons.arrow_forward_ios,size:18,color: AppColor.grey,),
                          )
                        ],),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height:20,),
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(widget.joined==true){
                          bottomSheet(1);
                        }else{
                          Navigator.pushNamed(context, RouteName.GroupSettingsScreen);
                        }
                      },
                      child:Stack(children: [
                        Container(height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColor.black_2
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Utils.mediumHeadingNormalText(text:
                              widget.joined==true?
                              UtilStrings.Joined:UtilStrings.Manage_Group,textSize: 11,fontWeight: FontWeight.w500,
                                  color: AppColor.white,textAlign: TextAlign.start),
                              const SizedBox(width:12,),
                              const Icon(Icons.keyboard_arrow_down_outlined,color: AppColor.white,)
                            ],),
                        ),
                        widget.joined==true?const SizedBox():
                        Positioned(
                          right: 0,top: 0,
                          child: Container(height: 16,width:16,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.white,width: 2),
                                color: AppColor.red,borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        )
                      ],)
                    ),
                  ),
                  const SizedBox(width:12,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColor.grey_light,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Utils.image(image: "bell_grey_icon.png",height: 18,width: 18)
                      ],
                    )
                  ), const SizedBox(width:12,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColor.grey_light,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Utils.image(image: "chat_icon.png",height: 18,width: 18)
                      ],
                    )
                  ), const SizedBox(width:12,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColor.grey_light,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Utils.image(image: "share_icon.png",height: 18,width: 18)
                      ],
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22,),
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
                  itemCount: Constants.feedJobs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding: EdgeInsets.only(
                  left: index==0?20:0,right: index==4?20:0
                  ),
                  child: GestureDetector(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedJobsDetailsScreen(
                          name: widget.name,index: index,
                        )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 18,),
                              Utils.mediumHeadingNormalText(text:Constants.feedJobs[index].text,
                                  textSize: 14,fontWeight: Constants.feedJobs[index].value==true?FontWeight.w500:FontWeight.w400,
                                  color:Constants.feedJobs[index].value==true?AppColor.black:AppColor.grey,
                                  textAlign: TextAlign.start),
                              const Spacer(),
                              Constants.feedJobs[index].value==true?
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
            SizedBox(height: 8,),
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
            SizedBox(height: 12,),
            Utils.customDivider(),
            const FeedWidgetScreen(),
          ],),
        ),
      ) ,
    );
  }
  bottomSheet(int type){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
        ),
        context: context, builder: (ctxt){
      return SizedBox(height:type==0? 110:80,
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
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

              },
              child: Row(children: [
                Utils.image(image: "leave_icon_black.png",height: 18,color: AppColor.grey),
                const SizedBox(width: 16,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Leave_group,
                    color: AppColor.grey,fontWeight: FontWeight.w500)
              ],),
            ),
            const SizedBox(height: 16,),
          ],),
        ),
      );
    });
  }
}
