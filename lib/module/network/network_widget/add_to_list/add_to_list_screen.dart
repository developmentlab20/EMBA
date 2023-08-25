import 'package:emba/utils/constants/constants.dart';
import 'package:emba/widget/common/common_button.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/common/appbar/common_appBar.dart';

class AddToListScreen extends StatefulWidget {
  const AddToListScreen({Key? key}) : super(key: key);

  @override
  State<AddToListScreen> createState() => _AddToListScreenState();
}

class _AddToListScreenState extends State<AddToListScreen> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Add_to_list,events: true,),
      ),
      body: Stack(children: [
        SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(children: [
              ListView.builder(
                  itemCount: Constants.addToList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                      dataCollect(index);
                    },
                      child: SizedBox(
                        width: size.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20,right: 20,top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 50,width: 50,
                                      child: Utils.image(image:Constants.addToList[index].image)),
                                  const SizedBox(width: 12,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 6,),
                                      Utils.mediumHeadingNormalText(text:Constants.addToList[index].title,textSize: 14,fontWeight: FontWeight.w600),
                                      const SizedBox(height: 4,),
                                      Utils.mediumHeadingNormalText(text:Constants.addToList[index].subTitle,textSize: 12,color: AppColor.grey)
                                    ],),
                                  const Spacer(),
                                  Checkbox(
                                      activeColor: AppColor.appGreen,
                                      value: Constants.addToList[index].value,onChanged: (value){
                                    dataCollect(index);
                                  })
                                ],),
                            ),
                            const SizedBox(height: 16,),
                            Utils.customDivider(),
                          ],
                        ),
                      ),
                    );
                  }),
              const SizedBox(height:50,),
            ],),
          ),
        ),
        Positioned(
            bottom:4,right:20,left: 20,
            child: CommonButton(text: UtilStrings.Done,onTap: (){
              Navigator.pop(context);
              // validation();
            },))
      ],)
    );
  }
  validation(){
    for(int i=0;i<Constants.addToList.length;i++){
      if(Constants.addToList[i].value==true){
        setState(() {

        });
      }
    }
    // Api Hit Here //
  }
  dataCollect(int index){
   if(Constants.addToList[index].value==false){
     setState(() {
       Constants.addToList[index].value=true;
     });
   }else{
     setState(() {
       Constants.addToList[index].value=false;
     });
   }
  }
}
