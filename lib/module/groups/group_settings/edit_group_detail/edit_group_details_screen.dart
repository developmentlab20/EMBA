import 'package:flutter/material.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/string_utils.dart';
import '../../../../../widget/common/appbar/common_appBar.dart';
import '../../../../../widget/common/common_text_field.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/common/common_button.dart';

class EditGroupDetailsScreen extends StatefulWidget {
  const EditGroupDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EditGroupDetailsScreen> createState() => _EditGroupDetailsScreenState();
}

class _EditGroupDetailsScreenState extends State<EditGroupDetailsScreen> {
  String dropDownValue='';
  TextEditingController titleController =TextEditingController();
  TextEditingController descriptionController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return GestureDetector(onTap: (){
      FocusManager.instance.primaryFocus!.unfocus();
    },
      child: Scaffold(
        appBar:  PreferredSize(
          preferredSize:  const Size(double.infinity, kToolbarHeight),
          child:CommonAppBar(title:UtilStrings.Edit_Group_Details,),
        ),
        body: SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(left:20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const SizedBox(height: 34,),
              Utils.mediumHeadingNormalText(text: UtilStrings.TITLE,fontWeight: FontWeight.w600),
                const SizedBox(height: 8,),
                CommonTextField(hint: UtilStrings.Startup_Discussion,height: 50,controller: titleController,),
                const SizedBox(height: 22,),
                Utils.mediumHeadingNormalText(text: UtilStrings.CATEGORY,fontWeight: FontWeight.w600),
                const SizedBox(height: 8,),
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.grey),
                  ),
                  width: size.width,
                  child: DropdownButton(
                      icon: const Icon(Icons.keyboard_arrow_down_sharp,size:24,),
                      hint:Utils.mediumHeadingNormalText(
                          text: UtilStrings.Startup_Related,textSize: 12
                      ),
                      underline: Container(),
                      isExpanded: true,
                      value: dropDownValue.isEmpty?null:dropDownValue,
                      items: Constants.groupDetailCategory.map((String items){
                        return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: const TextStyle(fontSize: 14),));
                      }).toList(),
                      onChanged: (String? value){
                        setState((){
                          dropDownValue=value!;
                        });
                      }),
                ),
                const SizedBox(height: 22,),
                Utils.mediumHeadingNormalText(text: UtilStrings.Description,fontWeight: FontWeight.w600),
                const SizedBox(height: 8,),
                CommonTextField(hint: UtilStrings.Startup_Discussion,height: 100,length: 60,
                controller: descriptionController,
                lines: 3,
                ),
                Spacer(),
                CommonButton(text: UtilStrings.Save,onTap: (){
                  validation();
                },),
                SizedBox(height: 20,),
            ],),
          ),
        ),
      ),
    );
  }
  validation(){
    if(titleController.text.trim().toString().isEmpty){

    }else if(dropDownValue.isEmpty){

    }else if(descriptionController.text.trim().toString().isEmpty){

    }else{

    }
  }
}
