import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/module/set_preference/set_prefrences_presenter/get_set_prefrences_presenter.dart';
import 'package:emba/module/set_preference/set_prefrences_presenter/post_set_prefrences_presenter.dart';
import 'package:flutter/material.dart';
import '../../model/bool_text.dart';
import '../../model/sucess_response.dart';
import '../../utils/color_utils.dart';
import '../../utils/constants/constants.dart';
import '../../utils/route/route_name.dart';
import '../../utils/snackbar.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_search_textField.dart';
import '../../widget/common/common_button.dart';

class SelectEntrepreneurshipScreen extends StatefulWidget {
  List <String>? schoolList;
  List <String>? location;
  List <String>? industry;
  List <String>? function;
  int? type;
   SelectEntrepreneurshipScreen({Key? key,this.location,
     this.type,
     this.schoolList,this.industry,this.function}) : super(key: key);

  @override
  State<SelectEntrepreneurshipScreen> createState() => _SelectEntrepreneurshipScreen();
}

class _SelectEntrepreneurshipScreen extends State<SelectEntrepreneurshipScreen> implements PostSetPrefrencesInterface,GetSetPrefrencesInterface{
  TextEditingController seaarchController=TextEditingController();
  bool selectAll=false;
  List <String> selectEntreprenuership=[];
  List <InterstModel> searchApiList=[];
  int itemSelected=0;
  bool searchValue=false;
  bool isLoading=false;
  List <InterstModel> industryApiList=[];
  PostSetPrefrencesPresenter? postSetPrefrencesPresenter;

  void search(String value) {
    if(searchValue==false){
      setState(() {
        searchApiList=Constants.selectEntreprenuership;
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
      Constants.selectEntreprenuership = result;
    });
  }
  GetSetPrefrencesPresenter? getSetPrefrencesPresenter;
  @override
  void initState() {

      for(int i=0;i<Constants.selectEntreprenuership.length;i++){
        Constants.selectEntreprenuership[i].value=false;
    }
      getSetPrefrencesPresenter =GetSetPrefrencesPresenter(this);
      if(widget.type==0){
        isLoading=true;
        getSetPrefrencesPresenter!.doGetSetPrefrences();
      }
    postSetPrefrencesPresenter=PostSetPrefrencesPresenter(this);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        Utils.mediumHeadingNormalText(text:UtilStrings.Select_Entrepreneurship_Area,textSize: 16,
                            fontWeight: FontWeight.w700),
                      ],),
                    ),
                    const SizedBox(height:8,),
                    Padding(
                        padding: const EdgeInsets.only(left:60,right: 24),
                        child: Utils.mediumHeadingNormalText(text:UtilStrings.Find_areas_of_interest,textSize: 14,
                            color: AppColor.grey,textAlign:TextAlign.start)
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left:24,right: 24),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.grey_light
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:16,right: 16,top:8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Utils.image(image: "null_icon.png",height: 14,width: 14),
                              const SizedBox(width: 8 ,),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: RichText(text:  TextSpan(
                                        text: UtilStrings.You_have_selected,
                                        style: TextStyle(color: AppColor.grey,fontSize:12),
                                        children: [
                                          TextSpan(
                                            text:  widget.type==0?UtilStrings.Yes:"No ",
                                            style: TextStyle(fontWeight: FontWeight.bold,fontSize:12,color: AppColor.black),
                                          ),
                                          TextSpan(
                                            text: UtilStrings.for_entrepreneurship_interest,
                                            style: TextStyle(color: AppColor.grey,fontSize:12),
                                          ),
                                        ]
                                    )),
                                  ),
                                  Utils.mediumHeadingNormalText(text: UtilStrings.Change_Here,fontWeight: FontWeight.bold,textSize:12,
                                      underline: true,textAlign:TextAlign.start
                                  ),
                                ],
                              ),
                          ],),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    widget.type==0?
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
                    ):Text(""),
                    const SizedBox(height:16,),
                    widget.type==0?
                    Utils.customDivider():Text(""),
                    const SizedBox(height: 22,),
                    widget.type==0?
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
                    ):Text(""),
                    const SizedBox(height:20,),
                    widget.type==0?
                    Utils.customDivider():Text(""),
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
                                                    selectEntreprenuership.add(industryApiList[index].text);
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
                CommonButton(text: UtilStrings.Done,
                  onTap: (){
                    //dialog();
                    validation();
                  },
                ),
                const SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        apiHit(1);
                      },
                      child: Utils.mediumHeadingNormalText(text: UtilStrings.Skip_Now,fontWeight: FontWeight.w700,
                          textSize: 14),
                    ),
                  ],
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
    for(int i=0;i<Constants.selectEntreprenuership.length;i++){
      if(selectAll==false){
        setState(() {
          Constants.selectEntreprenuership[i].value=false;
          itemSelected=0;
        });
      }else{
        setState(() {
          Constants.selectEntreprenuership[i].value=true;
          itemSelected=i+1;
        });
      }
    }
  }
  checkSelectAll(){
    for(int i=0;i<Constants.selectEntreprenuership.length;i++){
      if(Constants.selectEntreprenuership[i].value==false){
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
    for(int i=0;i<selectEntreprenuership.length;i++){
      if(text==selectEntreprenuership[i]){
        setState(() {
          selectEntreprenuership.removeAt(i);
        });
        break;
      }
    }
  }
  validation(){

     /* for(int i=0;i<Constants.selectEntreprenuership.length;i++){
        if(Constants.selectEntreprenuership[i].value==true){
          setState(() {
            selectEntreprenuership.add(Constants.selectEntreprenuership[i].text);
          });
        }
      }*/
    print("widget.type");
    print(widget.type);
    if(widget.type==0){
      if(selectEntreprenuership.isEmpty){
        CustomSnackBar.showErrorSnackBar(context,message: UtilStrings.Please_select_entrepreneurship_area);
      }
      else{
        apiHit(0);
      }
    }
    else {
      apiHit(0);
    }

  }
  apiHit(int type){
    setState(() {
      isLoading=true;
    });
    postSetPrefrencesPresenter!.doPostSetPrefrences("briefBio",
        widget.schoolList!,
        widget.location,
        widget.industry,
        widget.function,
        type==0?selectEntreprenuership:[]);
  }
  @override
  onError(String msg, int status) {
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showErrorSnackBar(context,message: msg);
  }

  @override
  onSucessPostPrefrences(SuccessResponse response) {
    setState(() {
      isLoading=false;
    });
    CustomSnackBar.showSuccessSnackBar(context,message: response.message);
    Navigator.pushNamed(context, RouteName.BottomNavigationBarScreen);
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
  /*dialog(){
    showDialog(context: context, builder: (ctxt){
      return const AlertDialog(
        title:Column(children: [

        ],),
      );
    });
  }*/
}
