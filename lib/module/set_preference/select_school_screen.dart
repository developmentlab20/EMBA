import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/module/set_preference/select_location_screen.dart';
import 'package:emba/module/set_preference/set_prefrences_presenter/get_set_prefrences_presenter.dart';
import 'package:emba/utils/snackbar.dart';
import 'package:flutter/material.dart';
import '../../model/bool_text.dart';
import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/common_button.dart';

class SelectSchoolScreen extends StatefulWidget {
  const SelectSchoolScreen({Key? key}) : super(key: key);

  @override
  State<SelectSchoolScreen> createState() => _SelectSchoolScreenState();
}

class _SelectSchoolScreenState extends State<SelectSchoolScreen>implements GetSetPrefrencesInterface {
  TextEditingController seaarchController=TextEditingController();
  bool selectAll=false;
  List <String> selectSchool=[];
  bool isLoading =true;
  List <InterstModel> schoolApiList=[];
  List <InterstModel> searchApiList=[];
  GetSetPrefrencesPresenter? getSetPrefrencesPresenter;
  int itemSelected=0;
  bool searchValue=false;


  void search(String value) {
    if(searchValue==false){
      setState(() {
        searchApiList=schoolApiList;
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
      schoolApiList = result;
      checkSelectAll();
    });
  }

  @override
  void initState() {
    getSetPrefrencesPresenter =GetSetPrefrencesPresenter(this);
    getSetPrefrencesPresenter!.doGetSetPrefrences();
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
                      Utils.mediumHeadingNormalText(text:UtilStrings.Select_Schools,textSize: 16,
                          fontWeight: FontWeight.w700),
                    ],),
                  ),
                  const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left:60,right: 24),
                    child: Utils.mediumHeadingNormalText(text:UtilStrings.Select_Schools_Des,textSize: 14,
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
                            hintText:UtilStrings.Search_schools,
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
                  Padding(
                    padding: const EdgeInsets.only(left:24,right: 24),
                    child: Row(
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(top:4),
                        child: SizedBox(height: 16,width: 16,
                          child: Checkbox(
                              activeColor: AppColor.appGreen,
                              value: selectAll,
                              onChanged: (value){
                            setState(() {
                              selectAll=value!;
                              allValueTrue();
                            });
                          }),
                        ),
                      ),
                      const SizedBox(width:16,),
                      Utils.mediumHeadingNormalText(text:UtilStrings.Select_All,fontWeight: FontWeight.w700,
                      textSize: 14),
                        const Spacer(),
                        Utils.mediumHeadingNormalText(text:itemSelected==0?"No "+
                        UtilStrings.No_Items_Selected:itemSelected.toString()+" "+UtilStrings.No_Items_Selected,fontWeight: FontWeight.w700,
                        textSize: 14)
                          ],),
                  ),
                  const SizedBox(height:20,),
                  Utils.customDivider(),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount:schoolApiList.length,
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
                                      value: schoolApiList[index].value,
                                      onChanged: (value){
                                        if(schoolApiList[index].value==false){
                                          setState(() {
                                            schoolApiList[index].value=true;
                                            itemSelected++;
                                            selectSchool.add(schoolApiList[index].text);
                                            checkSelectAll();
                                          });
                                        }else{
                                          setState(() {
                                            schoolApiList[index].value=false;
                                            itemSelected--;
                                            removeIndex(schoolApiList[index].text);
                                            checkSelectAll();
                                          });
                                        }
                                      }),
                                ),
                              ),
                              const SizedBox(width:16,),
                              Container(
                                width: size.width/1.3,
                                child: Utils.mediumHeadingNormalText(text:schoolApiList[index].text,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    color: AppColor.grey,
                                    textSize: 14),
                              ),
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
              bottom: 10,left: 24,right: 24,
              child: Column(children: [
                CommonButton(text: UtilStrings.Next,
                  onTap: (){
                    validation();
                  },
                ),
                const SizedBox(height: 16,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectLocationScreen(
                      schoolList:selectSchool,
                    )));
                  },
                  child: Utils.mediumHeadingNormalText(text: UtilStrings.Skip_Now,fontWeight: FontWeight.w700,
                      textSize: 14),
                ),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    ),const SizedBox(width:6,),
                    Container(height: 8,width:8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ],),
              ],),
            ),
            Utils.progressDialog(context, isLoading),
          ],
        ),
      ),
    );
  }
  allValueTrue(){
    for(int i=0;i<schoolApiList.length;i++){
      if(selectAll==false){
        setState(() {
          schoolApiList[i].value=false;
          itemSelected=0;
        });
      }else{
        setState(() {
          schoolApiList[i].value=true;
          itemSelected=i+1;
        });
      }
    }
  }
  checkSelectAll(){
    for(int i=0;i<schoolApiList.length;i++){
      if(schoolApiList[i].value==false){
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
    for(int i=0;i<selectSchool.length;i++){
      if(text==selectSchool[i]){
        setState(() {
          selectSchool.removeAt(i);
        });
        break;
      }
    }
  }
  validation(){
   /*   for(int i=0;i<schoolApiList.length;i++){
        if(schoolApiList[i].value==true){
          setState(() {
            selectSchool.add(schoolApiList[i].text);
          });
        }
      }*/
      if(selectSchool.isEmpty){
        CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_select_school);
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectLocationScreen(
          schoolList:selectSchool,
        )));
      }
  }
  @override
  onError(String msg, int status) {
    setState(() {
      isLoading=false;
    });
  }
  @override
  onSucessGetPrefrences(GetSetPrefrencess response) {
    setState(() {
      isLoading=false;
     for(int i=0;i<response.data!.schoolsModel!.length;i++){
       InterstModel interstModel =InterstModel(text: response.data!.schoolsModel![i].toString(), value: false);
       schoolApiList.add(interstModel);
     }
    });
  }
}
