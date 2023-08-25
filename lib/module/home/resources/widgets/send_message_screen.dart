import 'package:emba/utils/color_utils.dart';
import 'package:emba/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/common/appbar/common_appBar.dart';

class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({Key? key}) : super(key: key);

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Messages,events: true,),
      ),
         body: SizedBox(
           width: size.width,
           child: Column(
             children: [
              const SizedBox(height: 20,),
               ListView.builder(
                   shrinkWrap: true,
                   itemCount: Constants.sendMessageResources.length,
                   itemBuilder: (BuildContext context,int index){
                 return Padding(
                   padding: const EdgeInsets.only(bottom:20),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left:20,right: 20),
                         child: Row(children: [
                           Utils.image(image: Constants.sendMessageResources[index].imageUrl,height: 55,width: 55),
                           const SizedBox(width: 14,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                             Utils.mediumHeadingNormalText(text: Constants.sendMessageResources[index].text,
                             textSize: 16,fontWeight: FontWeight.w600),
                               const SizedBox(height:10,),
                             Utils.mediumHeadingNormalText(text: "Product Designer at TESLA",
                             color: AppColor.grey,textSize: 14
                             ),
                           ],),
                           const Spacer(),
                           Checkbox(
                               activeColor: AppColor.appGreen,
                               value: Constants.sendMessageResources[index].value,
                               onChanged: (value){
                             if(Constants.sendMessageResources[index].value==false){
                               setState(() {
                                 Constants.sendMessageResources[index].value=true;
                               });
                               }else{
                               setState(() {
                                 Constants.sendMessageResources[index].value=false;
                               });
                             }
                               })
                         ],),
                       ),
                       const SizedBox(height: 16,),
                       Utils.customDivider(),
                     ],
                   ),
                 );
               })

             ],
           ),
         ),
    );
  }
}
