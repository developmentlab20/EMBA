import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/constants/constants.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/common_text_field.dart';
import 'network_widget/my_connections_widget.dart';
import 'network_widget/my_list_widget_screen.dart';
import 'network_widget/people_near_by_widget_screen.dart';
import 'network_widget/recommended_widget_screen.dart';
import 'network_widget/requests_widget_screen.dart';
import 'network_widget/search_people_widget_screen.dart';

class NetworkMainScreen extends StatefulWidget {
  const NetworkMainScreen({Key? key}) : super(key: key);

  @override
  State<NetworkMainScreen> createState() => _NetworkMainScreenState();
}

class _NetworkMainScreenState extends State<NetworkMainScreen> {
  int listIndex=0;
  List <Widget> _listwidget=[];
  TextEditingController createListController=TextEditingController();
  @override
  void initState() {
    fetchValue();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _listwidget=[
      const RequestWidgetScreen(),
      const MyConnectionsWidget(),
      const RecommendedWidgetScreen(),
      const PeopleNeaarByWidgetScreen(),
      const MyListWidgetScreen(),
      const SearchPeopleWidgetScreen(),
    ];
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButton:listIndex==4? GestureDetector(
        onTap: (){
          createList();
        },
        child: Container(
          height: 45,width: 45,
          decoration: BoxDecoration(
              color: AppColor.appGreen,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child: Utils.image(image: "guest_add_icon.png",height: 20)),
        ),
      ):Container(),
      body: SizedBox(
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
                itemCount: Constants.networkList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index==0?0:0,right: index==5?10:0
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
                          SizedBox(width:120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 18,),
                                Utils.mediumHeadingNormalText(text:Constants.networkList[index].text,
                                    textSize: 12,fontWeight: Constants.networkList[index].value==true?FontWeight.w500:FontWeight.w400,
                                    color:Constants.networkList[index].value==true?AppColor.black:AppColor.grey,
                                    textAlign: TextAlign.start),
                                const Spacer(),
                                Constants.networkList[index].value==true?
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
  createList(){
    showModalBottomSheet(
      isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(25),
            topStart: Radius.circular(25),
          ),
        ),
        context: context, builder: (ctxt){
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            child: Wrap(
              children: [
                  Column(
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
                        Utils.mediumHeadingNormalText(text: UtilStrings.Create_List,fontWeight: FontWeight.w600,
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
                      child: CommonTextField(hint: "e.g. Name of the list",height: 50,controller: createListController,),
                    ),
                    const SizedBox(height: 20,),
                    // const Spacer(),
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
                ],
            ),
          ),
        );

    });
  }
  fetchValue(){
    for(int i=0;i<Constants.networkList.length;i++){
      if(i==listIndex){
        setState(() {
          Constants.networkList[i].value=true;
        });
      }else{
        setState(() {
          Constants.networkList[i].value=false;
        });
      }
    }
  }
}
