import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/module/set_preference/select_functions_screen.dart';
import 'package:emba/module/set_preference/set_prefrences_presenter/get_set_prefrences_presenter.dart';
import 'package:flutter/material.dart';
import '../../model/bool_text.dart';
import '../../utils/color_utils.dart';
import '../../utils/route/route_name.dart';
import '../../utils/snackbar.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_search_textField.dart';
import '../../widget/common/common_button.dart';

class SelectIndustriesScreen extends StatefulWidget {
  List <String>? schoolList;
  List <String>? location;
   SelectIndustriesScreen({Key? key,this.schoolList,this.location}) : super(key: key);

  @override
  State<SelectIndustriesScreen> createState() => _SelectIndustriesScreen();
}

class _SelectIndustriesScreen extends State<SelectIndustriesScreen>implements GetSetPrefrencesInterface {
  TextEditingController seaarchController=TextEditingController();
  bool selectAll=false;
  List <String> selectIndustry=[];
  bool isLoading =true;
  List <InterstModel> industryApiList=[];
  List <InterstModel> searchApiList=[];
  GetSetPrefrencesPresenter? getSetPrefrencesPresenter;
  int itemSelected=0;
  bool searchValue=false;
  void search(String value) {
    if(searchValue==false){
      setState(() {
        searchApiList=industryApiList;
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
      industryApiList = result;
    });
  }
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
                        Utils.mediumHeadingNormalText(text:UtilStrings.Select_Industries,textSize: 16,
                            fontWeight: FontWeight.w700),
                      ],),
                    ),
                    const SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left:60,right: 24),
                      child: Utils.mediumHeadingNormalText(text:UtilStrings.Select_Industries_Des,textSize: 14,
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
                                hintText:UtilStrings.Search_any_industry,
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
                        itemCount:industryApiList.length,
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
                                              value: industryApiList[index].value,
                                              onChanged: (value){
                                                if(industryApiList[index].value==false){
                                                  setState(() {
                                                    industryApiList[index].value=true;
                                                    itemSelected++;
                                                    selectIndustry.add(industryApiList[index].text);
                                                    checkSelectAll();
                                                  });
                                                }else{
                                                  setState(() {
                                                    industryApiList[index].value=false;
                                                    itemSelected--;
                                                    removeIndex(industryApiList[index].text);
                                                    checkSelectAll();
                                                  });
                                                }
                                              }),
                                        ),
                                      ),
                                      const SizedBox(width:16,),
                                      Utils.mediumHeadingNormalText(text:industryApiList[index].text,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectFunctionsScreen(
                      schoolList: widget.schoolList,location: widget.location,industry:[],
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
                    ),const SizedBox(width:6,),
                    Container(height: 8,width:8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),const SizedBox(width:6,),
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
                    ),
                  ],),
              ],),
            ),
            Utils.progressDialog(context, isLoading)
          ],
        ),
      ),
    );
  }
  allValueTrue(){
    for(int i=0;i<industryApiList.length;i++){
      if(selectAll==false){
        setState(() {
          industryApiList[i].value=false;
          itemSelected=0;
        });
      }else{
        setState(() {
          industryApiList[i].value=true;
          itemSelected=i+1;
        });
      }
    }
  }
  checkSelectAll(){
    for(int i=0;i<industryApiList.length;i++){
      if(industryApiList[i].value==false){
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
    for(int i=0;i<selectIndustry.length;i++){
      if(text==selectIndustry[i]){
        setState(() {
          selectIndustry.removeAt(i);
        });
        break;
      }
    }
  }
  validation(){

      /*for(int i=0;i<industryApiList.length;i++){
        if(industryApiList[i].value==true){
          setState(() {
            selectIndustry.add(industryApiList[i].text);
          });
      }
    }*/
      if(selectIndustry.isEmpty){
        CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_select_industry);
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectFunctionsScreen(
          schoolList: widget.schoolList,location: widget.location,industry:selectIndustry,
        )));      }
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
      for(int i=0;i<response.data!.industries!.length;i++){
        InterstModel interstModel =InterstModel(text: response.data!.industries![i].toString(), value: false);
        industryApiList.add(interstModel);
      }
    });
  }
}
