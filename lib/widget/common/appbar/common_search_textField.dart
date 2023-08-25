import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';

class SearchTextField extends StatefulWidget {
  String? hint;
  TextEditingController? controller;
  SearchTextField({Key? key,this.controller,this.hint}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.grey_light
      ),
      child: TextField(
        cursorColor: AppColor.black,
         style: const TextStyle(fontSize: 14,),
         decoration: InputDecoration(
         contentPadding: EdgeInsets.only(left: 10,right: 10,top:12),
         border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: const TextStyle(
          fontSize: 12
          ),
           prefixIcon: const Icon(Icons.search,color: AppColor.grey,size:22,)
         )
      ),
    );
  }
}
