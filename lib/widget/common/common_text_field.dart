import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/utils.dart';

class CommonTextField extends StatefulWidget {
  String? hint;
  double? height;
  TextEditingController? controller;
  String? image;
  bool? obscureText;
  bool? isChatBottom;
  bool? showPasswordEye;
  Function? visibility;
  int? length;
  int? lines;
  CommonTextField({Key? key,this.hint,this.controller,this.image,this.obscureText=false,this.length,
    this.lines,
    this.height,this.visibility,this.showPasswordEye=false,this.isChatBottom}) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      height:widget.height==null? 45:widget.height,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:widget.isChatBottom==true?AppColor.grey2: AppColor.grey),
      ),
      child: TextField(
        maxLines: widget.lines!=null?widget.lines:1,
        maxLength: widget.length!=null?widget.length:null,
        obscureText: widget.obscureText!,
        controller: widget.controller,
        cursorColor: AppColor.black,
        style: TextStyle(fontSize: 14,),
        decoration: InputDecoration(
            contentPadding: widget.image==null?
            EdgeInsets.only(left: 16,right: 16,top:widget.lines!=null?10:0,bottom:2)
                :
            EdgeInsets.only(left: 10,right: 10,top:10),
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: TextStyle(
                fontSize: 12
            ),
            prefixIcon: widget.image != null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 18,width: 18,
                    child: Utils.image(image: widget.image!,height: 14,width: 14,fit: BoxFit.contain)),
              ],
            )
                : null,
            suffixIcon: widget.showPasswordEye==true?
            GestureDetector(
              onTap: (){
                widget.visibility!();
              },
              child: Container(
                  child:widget.obscureText==true? const Icon(Icons.visibility_off,color: AppColor.grey,size: 20,):
                  const Icon(Icons.remove_red_eye_outlined,color: AppColor.grey,size: 20,)),
            )
                :null
        ),
      ),
    );
  }
}