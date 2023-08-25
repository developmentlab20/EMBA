import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/utils.dart';

class CommonButton extends StatefulWidget {
  String? text;
  bool? border;
  Color? borderColor;
  Color? textColor;
  Function? onTap;
  String? image;
  double? width;
   CommonButton({Key? key,this.text,this.width,

     this.border,this.onTap,this.borderColor,this.textColor,this.image}) : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        widget.onTap!();
      },
      child: Container(
        height: 48,
        width:widget.width?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.border==true?AppColor.white:AppColor.appGreen,
          border: Border.all(color:widget.border==true?widget.borderColor!=null?widget.borderColor!:AppColor.appGreen:AppColor.white),
        ),
        child:widget.image==null?Center(
          child: Utils.mediumHeadingNormalText(text: widget.text,
          color:widget.border==true?widget.textColor!=null?widget.textColor:AppColor.appGreen: AppColor.white,textSize:12,fontWeight: FontWeight.w700,
            textAlign: TextAlign.center
          ),
        ):Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Utils.image(image:widget.image,height: 14),
          SizedBox(width: 8,),
          Padding(
            padding: const EdgeInsets.only(bottom:3),
            child: Utils.mediumHeadingNormalText(text: widget.text,
                color:widget.border==true?widget.textColor!=null?widget.textColor:AppColor.appGreen: AppColor.white,textSize:14,fontWeight: FontWeight.w700,
                textAlign: TextAlign.center
            ),
          ),
        ],),
      ),
    );
  }
}
