import 'package:flutter/material.dart';

import '../../../../../../utils/color_utils.dart';
import '../../../../../../utils/constants/constants.dart';
import '../../../../../../utils/string_utils.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../../widget/common/appbar/common_appBar.dart';

class IndustryScreen extends StatefulWidget {
  const IndustryScreen({Key? key}) : super(key: key);

  @override
  State<IndustryScreen> createState() => _IndustryScreenState();
}

class _IndustryScreenState extends State<IndustryScreen> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.Industry,),
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 20,),
                 const Padding(
                  padding: EdgeInsets.only(left:20,right: 20),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      cursorColor: AppColor.black,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search,color: AppColor.grey,)
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 12,),
              Utils.customDivider(),
              const SizedBox(height: 12,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount:Constants.industry.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom:20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:24,right: 24),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:4),
                                  child: SizedBox(height: 10,width: 10,
                                    child: Checkbox(
                                        activeColor: AppColor.appGreen,
                                        value: Constants.industry[index].value,
                                        onChanged: (value){
                                          if(Constants.industry[index].value==false){
                                            setState(() {
                                              Constants.industry[index].value=true;
                                            });
                                          }else{
                                            setState(() {
                                              Constants.industry[index].value=false;
                                            });
                                          }
                                        }),
                                  ),
                                ),
                                const SizedBox(width:16,),
                                Utils.mediumHeadingNormalText(text:Constants.industry[index].text,
                                    color: AppColor.grey,
                                    textSize: 12),
                              ],),
                          ),
                          const SizedBox(height:20,),
                          Utils.customDivider(),
                        ],
                      ),
                    );
                  }),
            ],),
          ),
        ),
      ),
    );
  }
}
