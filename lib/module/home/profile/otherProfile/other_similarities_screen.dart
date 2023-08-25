import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
class SimilariteisScreen extends StatefulWidget {
  const SimilariteisScreen({Key? key}) : super(key: key);

  @override
  _SimilariteisScreenState createState() => _SimilariteisScreenState();
}

class _SimilariteisScreenState extends State<SimilariteisScreen> {
  List similarityList=[
    "You both studied in MIT ",
    "You both attended Private Equity - Understanding the landscape with Sanjeev Malik",
    "You both have same similar interests in Designing & automation",
    "You both have worked in tesla "
  ];
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Similarities,action: false),
      ),
      body: SizedBox(width:size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: similarityList.length,
                    itemBuilder: (BuildContext context,int index){
                      return    Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColor.grey.withOpacity(0.4)
                                ),
                              ),SizedBox(width: 10,),
                              Container(
                                width: size.width/1.5,
                                child: Utils.mediumHeadingNormalText(text:similarityList[index].toString(),textSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(thickness: 1,),
                          SizedBox(height: 10,),                        ],
                      );
                    }),
              ),
            ],),
        ),
      ),
    );
  }
}
