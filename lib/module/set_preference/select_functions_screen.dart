import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/module/set_preference/select_entrepreneurship_screen.dart';
import 'package:emba/module/set_preference/set_prefrences_presenter/get_set_prefrences_presenter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../model/bool_text.dart';
import '../../utils/color_utils.dart';
import '../../utils/snackbar.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/common_button.dart';

class SelectFunctionsScreen extends StatefulWidget {
  List<String>? schoolList;
  List<String>? location;
  List<String>? industry;

  SelectFunctionsScreen(
      {Key? key, this.schoolList, this.location, this.industry})
      : super(key: key);

  @override
  State<SelectFunctionsScreen> createState() => _SelectFunctionsScreen();
}

class _SelectFunctionsScreen extends State<SelectFunctionsScreen>
    implements GetSetPrefrencesInterface {
  TextEditingController seaarchController = TextEditingController();
  bool selectAll = false;
  List<String> selectFunctions = [];
  bool isLoading = true;
  List<InterstModel> locationApiList = [];
  List<InterstModel> searchApiList = [];

  GetSetPrefrencesPresenter? getSetPrefrencesPresenter;
  int itemSelected = 0;
  bool searchValue = false;

  void search(String value) {
    if (searchValue == false) {
      setState(() {
        searchApiList = locationApiList;
        searchValue = true;
      });
    }
    List<InterstModel> result = [];
    if (value.isEmpty) {
      setState(() {
        searchValue = false;
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
      locationApiList = result;
    });
  }

  void initState() {
    getSetPrefrencesPresenter = GetSetPrefrencesPresenter(this);
    getSetPrefrencesPresenter!.doGetSetPrefrences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back)),
                          const SizedBox(
                            width: 12,
                          ),
                          Utils.mediumHeadingNormalText(
                              text: UtilStrings.Select_Functions,
                              textSize: 16,
                              fontWeight: FontWeight.w700),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 60, right: 24),
                        child: Utils.mediumHeadingNormalText(
                            text: UtilStrings.Select_Functions_Des,
                            textSize: 14,
                            color: AppColor.grey,
                            textAlign: TextAlign.start)),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.grey_light),
                        child: TextField(
                            controller: seaarchController,
                            cursorColor: AppColor.black,
                            onChanged: (value) {
                              search(value);
                            },
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10, right: 10, top: 12),
                                border: InputBorder.none,
                                hintText: UtilStrings.Search_any_functions,
                                hintStyle: const TextStyle(fontSize: 12),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: AppColor.grey,
                                  size: 22,
                                ))),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Utils.customDivider(),
                    const SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Checkbox(
                                  activeColor: AppColor.appGreen,
                                  value: selectAll,
                                  onChanged: (value) {
                                    setState(() {
                                      selectAll = value!;
                                      allValueTrue();
                                    });
                                  }),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Utils.mediumHeadingNormalText(
                              text: UtilStrings.Select_All,
                              fontWeight: FontWeight.w700,
                              textSize: 14),
                          const Spacer(),
                          Utils.mediumHeadingNormalText(
                              text: itemSelected == 0
                                  ? "No " + UtilStrings.No_Items_Selected
                                  : itemSelected.toString() +
                                      " " +
                                      UtilStrings.No_Items_Selected,
                              fontWeight: FontWeight.w700,
                              textSize: 14)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Utils.customDivider(),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: locationApiList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: Checkbox(
                                              activeColor: AppColor.appGreen,
                                              value:
                                                  locationApiList[index].value,
                                              onChanged: (value) {
                                                if (locationApiList[index]
                                                        .value ==
                                                    false) {
                                                  setState(() {
                                                    locationApiList[index]
                                                        .value = true;
                                                    itemSelected++;
                                                    selectFunctions.add(
                                                        locationApiList[index]
                                                            .text);
                                                    checkSelectAll();
                                                  });
                                                } else {
                                                  setState(() {
                                                    locationApiList[index]
                                                        .value = false;
                                                    itemSelected--;
                                                    removeIndex(
                                                        locationApiList[index]
                                                            .text);
                                                    checkSelectAll();
                                                  });
                                                }
                                              }),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Utils.mediumHeadingNormalText(
                                          text: locationApiList[index].text,
                                          color: AppColor.grey,
                                          textSize: 14),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Utils.customDivider(),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 110,),

                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,left: 24,right: 24,
              child: Column(children: [
                CommonButton(
                  text: UtilStrings.Next,
                  onTap: () {
                    validation();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        dialog();
                      },
                      child: Utils.mediumHeadingNormalText(
                          text: UtilStrings.Skip_Now,
                          fontWeight: FontWeight.w700,
                          textSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 8,
                      width: 30,
                      decoration: BoxDecoration(
                          color: AppColor.appGreen,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appGreen),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
              ],),
            ),
            Utils.progressDialog(context, isLoading)
          ],
        ),
      ),
    );
  }

  allValueTrue() {
    for (int i = 0; i < locationApiList.length; i++) {
      if (selectAll == false) {
        setState(() {
          locationApiList[i].value = false;
          itemSelected = 0;
        });
      } else {
        setState(() {
          locationApiList[i].value = true;
          itemSelected = i + 1;
        });
      }
    }
  }

  checkSelectAll() {
    for (int i = 0; i < locationApiList.length; i++) {
      if (locationApiList[i].value == false) {
        setState(() {
          selectAll = false;
        });
        break;
      } else {
        setState(() {
          selectAll = true;
        });
      }
    }
  }

  removeIndex(String text) {
    for (int i = 0; i < selectFunctions.length; i++) {
      if (text == selectFunctions[i]) {
        setState(() {
          selectFunctions.removeAt(i);
        });
        break;
      }
    }
  }

  validation() {
    /*for(int i=0;i<locationApiList.length;i++){
        if(locationApiList[i].value==true){
          setState(() {
            selectFunctions.add(locationApiList[i].text);
          });
        }
    }*/
    if (selectFunctions.isEmpty) {
      CustomSnackBar.showErrorSnackBar(context,
          message: UtilStrings.Please_select_function);
    } else {
     dialog();
    }
  }

  @override
  onError(String msg, int status) {
    setState(() {
      isLoading = false;
    });
  }

  @override
  onSucessGetPrefrences(GetSetPrefrencess response) {
    setState(() {
      isLoading = false;
      for (int i = 0; i < response.data!.jobFunctions!.length; i++) {
        InterstModel interstModel = InterstModel(
            text: response.data!.jobFunctions![i].toString(), value: false);
        locationApiList.add(interstModel);
      }
    });
  }

  dialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctxt) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                        },
                        child: Icon(
                          Icons.close,
                          color: AppColor.white,
                        )),
                    Utils.image(
                        image: "perosn_set_pre.png", height: 30, width: 30),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: AppColor.black,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Utils.mediumHeadingNormalText(
                    text: UtilStrings.Are_you_interested_in_Entrepreneurship,
                    color: AppColor.black,
                    textSize: 14,
                    fontWeight: FontWeight.w600),
                const SizedBox(
                  height: 10,
                ),
                Utils.customDivider(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectEntrepreneurshipScreen(
                                  schoolList: widget.schoolList,
                                  industry: widget.industry,
                                  location: widget.location,
                                  function: selectFunctions,
                                  type: 0,
                                )));
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Utils.mediumHeadingNormalText(
                                text: UtilStrings.Yes, color: AppColor.grey)),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SelectEntrepreneurshipScreen(
                                      schoolList: widget.schoolList,
                                      industry: widget.industry,
                                      location: widget.location,
                                      function: [],
                                      type: 1,
                                    )));
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Utils.mediumHeadingNormalText(
                                text: UtilStrings.No, color: AppColor.grey)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
