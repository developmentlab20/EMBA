import 'package:emba/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import '../../../utils/route/route_name.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';

class GlobalSearchScreen extends StatefulWidget {
  const GlobalSearchScreen({Key? key}) : super(key: key);

  @override
  State<GlobalSearchScreen> createState() => _GlobalSearchScreenState();
}

class _GlobalSearchScreenState extends State<GlobalSearchScreen> {
  TextEditingController searchController =TextEditingController();
  int listIndex=0;
  String dropDownValue="Recent";
  List <Widget> _list=[];
  bool like =false;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    _list=[
      allSearch(),
      allSearch(),
      allSearch(),
      allSearch(),
      allSearch(),
      allSearch(),
      allSearch(),
      allSearch(),
    ];
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        title: Container(
          height: 45,
          width: size.width,
          decoration: BoxDecoration(
              color: AppColor.white_light,
            borderRadius: BorderRadius.circular(25)
          ),
          child: TextField(
            controller: searchController,
            cursorColor: AppColor.black,
                 decoration: const InputDecoration(
                   border: InputBorder.none,
                   prefixIcon: Icon(Icons.search,color: AppColor.grey,),
                   contentPadding: EdgeInsets.only(top:10,right: 16)
                 ),
          ),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back,color: AppColor.black,),
        ),
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SizedBox(
          width: size.width,
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
                  itemCount: Constants.searchList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index==0?20:0,right: index==7?20:0
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
                          children: [
                            SizedBox(width:80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 18,),
                                  Utils.mediumHeadingNormalText(text:Constants.searchList[index].text,
                                      textSize: 14,fontWeight: Constants.searchList[index].value==true?FontWeight.w500:FontWeight.w400,
                                      color:Constants.searchList[index].value==true?AppColor.black:AppColor.grey,
                                      textAlign: TextAlign.start),
                                  const Spacer(),
                                  Constants.searchList[index].value==true?
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
            const SizedBox(height: 6,),
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
                        bottomSheet();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top:6),
                        child: Icon(Icons.expand_more,size:24,color: AppColor.grey,),
                      )),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Utils.customDivider(),
            _list[listIndex]
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
      return SizedBox(height:110,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(children: [
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
          ],)
        ),
      );
    });
  }
  fetchValue(){
    for(int i=0;i<Constants.searchList.length;i++){
      if(i==listIndex){
        setState(() {
          Constants.searchList[i].value=true;
        });
      }else{
        setState(() {
          Constants.searchList[i].value=false;
        });
      }
    }
  }
  Expanded allSearch(){
    final size =MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left:20,right: 20,),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Row(children: [
                     Utils.mediumHeadingNormalText(text: UtilStrings.Posts,fontWeight: FontWeight.w700,
                     textSize: 16),
                    const Spacer(),
                    Utils.mediumHeadingNormalText(text: UtilStrings.View_More,
                        color: AppColor.grey,textSize:12),
                    const SizedBox(width: 3,),
                    const Icon(Icons.arrow_forward,color: AppColor.grey,)
                   ],),
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.image(image: "boy_image.png",height: 55,width:55),
                      const SizedBox(width:12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const SizedBox(height:4,),
                        SizedBox(
                          width:size.width/1.4,
                          child: Row(
                            children: [
                              Utils.mediumHeadingNormalText(text:"Emilia Clarke",fontWeight: FontWeight.w700,
                                  textSize: 14),
                              const SizedBox(width:8,),
                              Container(height: 4,width:4,
                              decoration: BoxDecoration(
                                color: AppColor.grey,borderRadius: BorderRadius.circular(20)
                              ),),
                              const SizedBox(width:8,),
                              Utils.mediumHeadingNormalText(text:"2h ago",fontWeight: FontWeight.w700,
                                  textSize: 12,color: AppColor.grey),
                              const Spacer(),
                              const Icon(Icons.more_vert,color: AppColor.grey,)
                            ],
                          ),
                        ),
                          const SizedBox(height:4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(height: 25,width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColor.grey2)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Utils.image(image: "expert.png",height: 14,width: 14),
                                  const SizedBox(width: 4),
                                  Utils.mediumHeadingNormalText(text:"${UtilStrings.Financial_Expert} +2",textSize:10,
                                      color: AppColor.black_2)
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
                                  const SizedBox(width: 4,),
                                  Utils.mediumHeadingNormalText(text: UtilStrings.Community_Leader,textSize: 10)
                                ],),
                            ),
                          ],
                        )
                      ],)
                    ],
                  ),
                  const SizedBox(height:16,),
                  Utils.mediumHeadingNormalText(text: UtilStrings.HOME_TITLE,textSize: 14,
                  textAlign: TextAlign.start,fontWeight: FontWeight.w400),
                  Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: (){
                  },
                  child: Container(width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: AppColor.grey2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10,right: 10,top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Utils.image(image:"event_image_1.png"),
                            Positioned(
                              right: 10,top: 8  ,
                              child: GestureDetector(
                                onTap: (){
                                  bottomSheet();
                                },
                                child: Container(
                                  height: 35,width: 35,
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Icon(Icons.more_vert),
                                ),
                              ),
                            )
                          ]),
                          const SizedBox(height:20,),
                          Row(children: [
                            Utils.image(image: "timer_icon.png",height: 18,width: 18),
                            const SizedBox(width:8,),
                            Utils.mediumHeadingNormalText(text:"Feb 23, Fri, 11:30 PM",color: AppColor.grey,
                                fontWeight: FontWeight.w400,textSize:14),
                            const SizedBox(width:12,),
                            Icon(Icons.location_on_outlined,color: AppColor.grey,),
                            const SizedBox(width:2,),
                            Utils.mediumHeadingNormalText(text:"Online",color: AppColor.grey,
                                fontWeight: FontWeight.w400,textSize:14),
                          ],),
                          const SizedBox(height:16,),
                          Utils.mediumHeadingNormalText(text: UtilStrings.Private_Equity_Understanding,
                              textSize: 16,fontWeight: FontWeight.w700,textAlign: TextAlign.start),
                          const SizedBox(height:20,),
                          Utils.customDivider(),
                          const SizedBox(height:20,),
                          Row(
                            children: [
                              SizedBox(
                                  height: 22,width: 22,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Utils.image(image: "demo_image.png",fit: BoxFit.contain))),
                              const SizedBox(width:8,),
                              Utils.mediumHeadingNormalText(text:"Sanjay Malik",color: AppColor.grey,
                                  fontWeight: FontWeight.w400,textSize:12),
                              const SizedBox(width:14,),
                              SizedBox(
                                  height: 16,width: 16,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Utils.image(image: "ic_people.png",fit: BoxFit.contain))),
                              const SizedBox(width:8,),
                              Utils.mediumHeadingNormalText(text:"650 Attendees",color: AppColor.grey,
                                  fontWeight: FontWeight.w400,textSize:12),
                            ],
                          ),
                          const SizedBox(height:16,),
                          Container(
                            width: size.width/1.2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                    },
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(
                                            color: AppColor.appGreen,
                                          )
                                      ),
                                      child: Center(
                                        child: Utils.mediumHeadingNormalText(text:UtilStrings.Attend,textSize:14,
                                            color: AppColor.appGreen,fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width:10,),
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
                                        Utils.image(image: "m_icon.png",height: 18,width: 18)
                                      ],
                                    )
                                ),
                                const SizedBox(width:10,),
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
                          const SizedBox(height:20,),
                        ],),
                    ),
                  ),
                ),
              ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Utils.mediumHeadingNormalText(text:"832 Views",color: AppColor.grey,
                          textSize:12,textAlign:TextAlign.start,fontWeight: FontWeight.w500),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Utils.customDivider(),
                  const SizedBox(height:16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      GestureDetector(
                        onTap: (){
                          if(like==false){
                            setState(() {
                              like=true;
                            });
                          }else{
                            setState(() {
                              like=false;
                            });
                          }
                        },
                        child: Row(children: [
                          Utils.image(image: "like_icon.png",height:20,
                              color: like==false?null:AppColor.appGreen
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
                  const SizedBox(height: 20,),

                ],
              ),
            )
      ),
    );
  }
}
