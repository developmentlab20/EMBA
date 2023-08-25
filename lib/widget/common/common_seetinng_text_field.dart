import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/utils.dart';

class CommonSeetingTextFieldTextField extends StatefulWidget {
  String? hint;
  TextEditingController? controller;
  bool? obscureText;
  bool? showPasswordEye;
  Function? visibility;
  int? type;
  CommonSeetingTextFieldTextField({Key? key,this.hint,
    this.type,
    this.controller,this.obscureText=false,this.visibility,this.showPasswordEye=false}) : super(key: key);

  @override
  State<CommonSeetingTextFieldTextField> createState() => _CommonSeetingTextFieldTextField();
}

class _CommonSeetingTextFieldTextField extends State<CommonSeetingTextFieldTextField> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      height:45,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:AppColor.grey),
      ),
      child: TextField(
        obscureText: widget.obscureText!,
        controller: widget.controller,
        cursorColor: AppColor.black,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 14,),
        decoration: InputDecoration(
            contentPadding:
            widget.type==null?
            EdgeInsets.only(left: 16,right: 16,top:10):
            EdgeInsets.only(left: 16,right: 16,bottom:8),
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: TextStyle(
                fontSize: 12
            ),
            suffixIcon:widget.type==null?GestureDetector(
              onTap: (){
                widget.visibility!();
              },
              child: Container(
                  child:widget.obscureText==true? const Icon(Icons.visibility_off,color: AppColor.grey,size: 20,):
                  const Icon(Icons.remove_red_eye_outlined,color: AppColor.grey,size: 20,)),
            ):null
        ),
      ),
    );
  }
}