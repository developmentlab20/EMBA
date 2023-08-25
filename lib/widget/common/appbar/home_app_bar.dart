import 'package:emba/utils/route/route_name.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utils.dart';

class AppBarHomeScreen extends StatefulWidget {
  String? image;
  AppBarHomeScreen({Key? key,this.image}) : super(key: key);

  @override
  State<AppBarHomeScreen> createState() => _AppBarHomeScreen();
}

class _AppBarHomeScreen extends State<AppBarHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 35,width: 35,
                child: Utils.image(image: "app_icon.png",height:16,width:16,)),
          ],
        ),
        actions: [
          Utils.image(image: "search_icon.png",height:16,width: 16,color: AppColor.black),
          Padding(
            padding: const EdgeInsets.only(right:14,left: 14),
            child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.EventsScreen);
                },
                child: Utils.image(image: "home_sch_icon.png",height:16,width: 16,color: AppColor.black)),
          ),
          Utils.image(image: "home_noti_icon.png",height:16,width: 16,color: AppColor.black),
          Padding(
            padding: const EdgeInsets.only(right:14,left: 14),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RouteName.ChatListScreen);
              },
                child: Utils.image(image: "chat_icon.png",height:16,width: 16,color: AppColor.black)),
          ),
          Padding(
            padding: const EdgeInsets.only(right:10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: SizedBox(
                      height: 24,width: 24,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Utils.image(image: widget.image,fit: BoxFit.contain))),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }
}
