import 'package:emba/module/set_preference/select_industries_screen.dart';
import 'package:emba/utils/snackbar.dart';
import 'package:flutter/material.dart';
import '../../model/bool_text.dart';
import '../../utils/color_utils.dart';
import '../../utils/constants/constants.dart';
import '../../utils/route/route_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_search_textField.dart';
import '../../widget/common/common_button.dart';

class SelectLocationScreen extends StatefulWidget {
  List <String>? schoolList;

   SelectLocationScreen({Key? key,this.schoolList}) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreen();
}

class _SelectLocationScreen extends State<SelectLocationScreen> {
  TextEditingController seaarchController=TextEditingController();
  bool selectAll=false;
  List <String> selectLocations=[];
  List <InterstModel> searchApiList=[];

  int itemSelected=0;
  bool searchValue=false;
  void search(String value) {
    if(searchValue==false){
      setState(() {
        searchApiList=Constants.selectLocations;
        searchValue=true;
      });
    }
    List <InterstModel> result=[];
    if(value.isEmpty){
      setState(() {
        searchValue=false;
        result = searchApiList;
      });
    } else {
      setState(() {
        result = searchApiList.where((user) {
          final title = user.text.toLowerCase();
          final searchLower = value.toLowerCase();
          return title.contains(searchLower); //changed
        }).toList();
      });
    }
    setState(() {
      Constants.selectLocations = result;
    });
  }
  @override
  void initState() {
    for(int i=0;i<Constants.selectLocations.length;i++){
      Constants.selectLocations[i].value=false;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  GestureDetector(onTap: (){
      FocusManager.instance.primaryFocus!.unfocus();
    },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width:size.width,
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 70,),
                    Padding(
                      padding: const EdgeInsets.only(left:24,right: 24),
                      child: Row(children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back)),
                        const SizedBox(width: 12,),
                        Utils.mediumHeadingNormalText(text:UtilStrings.Select_Locations,textSize: 16,
                            fontWeight: FontWeight.w700),
                      ],),
                    ),
                    const SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left:60,right: 24),
                      child: Utils.mediumHeadingNormalText(text:UtilStrings.Select_Locations_Des,textSize: 14,
                          color: AppColor.grey,textAlign:TextAlign.start),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left:24,right: 24),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.grey_light
                        ),
                        child: TextField(
                            controller: seaarchController,
                            cursorColor: AppColor.black,
                            onChanged: (value){
                              search(value);
                            },
                            style: const TextStyle(fontSize: 14,),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10,right: 10,top:12),
                                border: InputBorder.none,
                                hintText:UtilStrings.Search_any_city,
                                hintStyle: const TextStyle(
                                    fontSize: 12
                                ),
                                prefixIcon: const Icon(Icons.search,color: AppColor.grey,size:22,)
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height:16,),
                    Utils.customDivider(),
                    const SizedBox(height: 22,),
                    Utils.mediumHeadingNormalText(text:UtilStrings.Popular_Locations,textSize:14,
                        fontWeight:FontWeight.w700,textAlign:TextAlign.start),
                    const SizedBox(height:20,),
                    Utils.customDivider(),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount:Constants.selectLocations.length,
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
                                              value: Constants.selectLocations[index].value,
                                              onChanged: (value){
                                                if(Constants.selectLocations[index].value==false){
                                                  setState(() {
                                                    Constants.selectLocations[index].value=true;
                                                    selectLocations.add(Constants.selectLocations[index].text);
                                                    checkSelectAll();
                                                  });
                                                }else{
                                                  setState(() {
                                                    Constants.selectLocations[index].value=false;
                                                    removeIndex(Constants.selectLocations[index].text);
                                                    checkSelectAll();
                                                  });
                                                }
                                              }),
                                        ),
                                      ),
                                      const SizedBox(width:16,),
                                      Utils.mediumHeadingNormalText(text:Constants.selectLocations[index].text,
                                          color: AppColor.grey,
                                          textSize: 14),
                                    ],),
                                ),
                                const SizedBox(height:16,),
                                Utils.customDivider(),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(height: 115,),

                  ],),
              ),
            ),
            Positioned(
              bottom: 0,left: 24,right: 24,
              child: Column(children: [
                CommonButton(text: UtilStrings.Next,
                  onTap: (){
                    validation();
                  },
                ),
                const SizedBox(height: 16,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectIndustriesScreen(
                      schoolList: widget.schoolList,location: [],
                    )));
                  },
                  child: Utils.mediumHeadingNormalText(text: UtilStrings.Skip_Now,fontWeight: FontWeight.w700,
                      textSize: 14),
                ),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 8,width:8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),  const SizedBox(width:6,),
                    Container(height: 8,width:30,
                      decoration: BoxDecoration(
                          color: AppColor.appGreen,
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),const SizedBox(width:6,),
                    Container(height: 8,width:8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),const SizedBox(width:6,),
                    Container(height: 8,width:8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),const SizedBox(width:6,),
                    Container(height: 8,width:8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ],),
              ],),
            )
          ],
        ),
      ),
    );
  }
  allValueTrue(){
    for(int i=0;i<Constants.selectLocations.length;i++){
      if(selectAll==false){
        setState(() {
          Constants.selectLocations[i].value=false;
        });
      }else{
        setState(() {
          Constants.selectLocations[i].value=true;
        });
      }
    }
  }
  checkSelectAll(){
    for(int i=0;i<Constants.selectLocations.length;i++){
      if(Constants.selectLocations[i].value==false){
        setState(() {
          selectAll=false;
        });
        break;
      }else{
        setState(() {
          selectAll=true;
        });
      }
    }
  }
  removeIndex(String text){
    for(int i=0;i<selectLocations.length;i++){
      if(text==selectLocations[i]){
        setState(() {
          selectLocations.removeAt(i);
        });
        break;
      }
    }
  }
  validation(){
     /* for(int i=0;i<Constants.selectLocations.length;i++){
        if(Constants.selectLocations[i].value==true){
          setState(() {
            selectLocations.add(Constants.selectLocations[i].text);
          });
        }
    }*/
      if(selectLocations.isEmpty){
        CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_select_location);
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectIndustriesScreen(
          schoolList: widget.schoolList,location: selectLocations,
        )));
      }
  }
}
