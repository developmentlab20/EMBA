import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/common/appbar/common_appBar.dart';
import 'leaderBoard_widget/creator_widget_screen.dart';
import 'leaderBoard_widget/infulencer_widget_screen.dart';
import 'leaderBoard_widget/speaker_widget_screen.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  int listIndex=0;
  List <Widget> _listwidget=[];
  @override
  Widget build(BuildContext context) {
    _listwidget=[
      const InfulencerWidgetScreen(),
      const SpeakerWidgetScreen(),
      const CreatorWidgetScreen(),

    ];
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Leaderboard,),
      ),
      body: SizedBox(
        width:size.width,
        child: Column(
          children: [
          Container(
            alignment: Alignment.center,
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
                itemCount: Constants.leaderboard.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: (){
                       listIndex=index;
                        fetchValue();
                    },
                    child: Row(
                      children: [
                        SizedBox(width:80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 18,),
                              Utils.mediumHeadingNormalText(text:Constants.leaderboard[index].text,
                                  textSize: 14,fontWeight: Constants.leaderboard[index].value==true?FontWeight.w500:FontWeight.w400,
                                  color:Constants.leaderboard[index].value==true?AppColor.black:AppColor.grey,
                                  textAlign: TextAlign.start),
                              const Spacer(),
                              Constants.leaderboard[index].value==true?
                              Container(height:4,width: 60,
                                decoration: BoxDecoration(
                                    color: AppColor.appGreen,
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                                ),
                              ):const SizedBox(),
                            ],),
                        )
                      ],),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width:16);
              },)
          ),
            Expanded(
              child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _listwidget[listIndex],
                      ],
                    ),
                  )),
            ),
        ],),
      ),
    );
  }
  fetchValue(){
    for(int i=0;i<Constants.leaderboard.length;i++){
      if(i==listIndex){
        setState(() {
          Constants.leaderboard[i].value=true;
        });
      }else{
        setState(() {
          Constants.leaderboard[i].value=false;
        });
      }
    }
  }
}
