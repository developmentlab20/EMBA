import 'package:emba/utils/route/route_name.dart';
import 'package:emba/utils/sharedpref/preferences.dart';
import 'package:emba/utils/sharedpref/shared_prefrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../widget/common/common_button.dart';
import 'color_utils.dart';

class Utils{
  static Widget mediumHeadingNormalText(
      {String? text,
        double? textSize,
        Color? color,
        TextAlign? textAlign,
        FontWeight? fontWeight,
        String? fontFamily,
        double? left,
        double? right,
        bool? underline,
        TextOverflow? overflow}) {
    return Container(
      margin: EdgeInsets.only(left: left ?? 0, right: right ?? 0),
      child: Text(
        text ?? '',
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
          decoration: underline == true
              ? TextDecoration.underline
              : TextDecoration.none,
          color: color,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: textSize ?? 16,
          overflow: overflow
        ),
      ),
    );
  }static Widget mediumHeadingNormalTextHeight(
      {String? text,
        double? textSize,
        Color? color,
        TextAlign? textAlign,
        FontWeight? fontWeight,
        String? fontFamily,
        double? left,
        double? right,
        bool? underline,
        TextOverflow? overflow}) {
    return Container(
      margin: EdgeInsets.only(left: left ?? 0, right: right ?? 0),
      child: Text(
        text ?? '',
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
          height: 1.5,
          decoration: underline == true
              ? TextDecoration.underline
              : TextDecoration.none,
          color: color,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: textSize ?? 16,
          overflow: overflow
        ),
      ),
    );
  }
  static Widget customDivider(
      {double? indent, double height = 2, double? endent, Color?color}) {
    return Divider(
      thickness: 1,
      color: color,
      height: height,
      indent: indent ?? 0,
      endIndent: endent ?? 0,
    );
  }

  static Widget image({
    required String? image,
    double? height,
    double? width,
    Color? color,
    BoxFit? fit,
  }) {
    return Image.asset(
      "assets/images/${image!}",
      height: height,
      width: width,
      color: color,
      fit: fit,
    );
  }
  static Widget customTextFeildSetting(BuildContext context,String text, String hintText,TextEditingController controller,
      bool? isHide,bool? isReadOnly,int? maxline){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Utils.mediumHeadingNormalText(text: text,
              textSize: 14,fontWeight: FontWeight.bold,color: AppColor.text_color_password),
        ),
        const SizedBox(height: 4,),
        Container(
          height:maxline==1? 45:200,
          // margin: EdgeInsets.only(top: 2,left: 20,right: 20),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.grey2),
              borderRadius: BorderRadius.circular(8.0)
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            obscureText: isHide?? false,
            readOnly: isReadOnly?? false,
            style: const TextStyle(color: Colors.black),
            maxLines:maxline?? 1,
            decoration:  InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: const TextStyle(fontFamily: "Poppins",fontSize: 12,color:AppColor.textColor,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
  static Widget commanLoginActivity(String locationName,String date,String deviceName,BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Utils.image(image: "location.png",height: 18,width: 18),
              const SizedBox(width: 8,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.mediumHeadingNormalText(text:locationName,textSize: 14,fontWeight: FontWeight.w500),
                  Utils.mediumHeadingNormalText(text:date+" "+deviceName,textSize: 12,color: AppColor.grey),
                ],
              ),

            ],
          ),
          Icon(Icons.more_vert)
        ],
      ),
    );
  }
  static Widget switchButton({required bool value,
    required Color activeTrackColor,
    required Color inactiveTrackColor,
    required Color inactiveThumbColor,
    required Color activeColor,
    required void Function(bool)? onChanged,
    BuildContext? context}) {
    return Transform.scale(
      scale: 0.7,
      child: CupertinoSwitch(
        onChanged: onChanged,
        value: value,
        activeColor: activeColor,
        thumbColor: inactiveThumbColor,
      ),
    );
  }
  static settingCommanWidget(String imageUrl,String title,void Function()? onTap,Color color){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(width: 12,),
          Utils.image(image: imageUrl,height: 18,width: 18),
          SizedBox(width: 22,),
          Text(title,
              style: TextStyle(
                  color: color??AppColor.TITLE_COLOR,
                  fontSize: 14,
                  fontFamily: "Jost",
                  fontWeight: FontWeight.normal)),
          SizedBox(width: 14,)
        ],
      ),
    );
  }

  Future logOutBottom(BuildContext context){
    return  showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                SizedBox(height: 20,),
                Container(height: 4,
                width: 40,
                  color: Colors.grey,
                ),
                CommonButton(text: "Logout",),
                Text("Cancel",
                    style: TextStyle(
                        color: AppColor.TITLE_COLOR,
                        fontSize: 14,
                        fontFamily: "Jost",
                        fontWeight: FontWeight.normal)),
              ],
            ),
          );
        });
  }
 static Future<void> share() async {
    await FlutterShare.share(
        title: 'Emba',
        text: 'Hello!',
        linkUrl: 'https://www.google.com/',
    );
  }
  static Widget borderButton(String text,Color textColor,Color borderColor,double width,double height){
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      height: height??30,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),border: Border.all(color: borderColor)
      ),
      child: Center(child: Utils.mediumHeadingNormalText(text: text,textSize: 12,color: textColor)),
    );
  }
  static Widget progressDialog(BuildContext context, bool isLoading) {
    return Visibility(
        visible: isLoading,
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation<Color>(AppColor.appGreen),
          ),
          alignment: Alignment.center,
        ));
  }
  static hideKeyBoard(BuildContext context) {
    return  FocusScope.of(context).requestFocus(new FocusNode());
  }
  static commanAttachFileOnChat(String imageUrl,String name){
    return   Container(
      height: 45,
      width: 140,
      decoration: BoxDecoration(
          color: AppColor.grey_light,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Utils.image(image: imageUrl,height: 18,width: 18),
          SizedBox(width: 12,),
          Utils.mediumHeadingNormalText(text: name,
              fontWeight:FontWeight.bold,textSize: 12,color: AppColor.text_color_password,
              textAlign: TextAlign.start)
        ],
      ),
    );
  }
  static Widget customTextFeildChat(BuildContext context, String hintText,TextEditingController controller,
      bool? isHide,bool? isReadOnly,int? maxline){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:maxline==1? 45:200,
          // margin: EdgeInsets.only(top: 2,left: 20,right: 20),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.grey2),
              borderRadius: BorderRadius.circular(8.0)
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            obscureText: isHide?? false,
            readOnly: isReadOnly?? false,
            style: const TextStyle(color: Colors.black),
            maxLines:maxline?? 1,
            decoration:  InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle:  TextStyle(fontFamily: "Poppins",fontSize: 12,color:AppColor.grey,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
  static Future<Object?> sessionExpire(BuildContext context,){
    SessionManager.setString(Preferences.USER_NAME, "");
    SessionManager.setString(Preferences.EMAIL, "");
    SessionManager.setString(Preferences.ACCESS_TOKEN, "");
    SessionManager.setBoolean(Preferences.USER_LOGIN, false);
    return Navigator.pushNamed(context, RouteName.LoginScreen);
  }

  static bool validateStructure(String value){String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
  }


}