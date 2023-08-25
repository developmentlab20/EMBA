import 'package:flutter/material.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utils.dart';

class CommonAppBar extends StatefulWidget {
  String? title;
  Function? onTap;
  Function? onTapMenu;
  bool? action;
  String? imageUrl;
  Color? color;
  bool? searchAction;
  bool? events;
  bool? isChat;
  CommonAppBar({Key? key,this.title,this.onTap,this.onTapMenu,this.action=false,this.imageUrl,this.events=false,
    this.color,this.searchAction,this.isChat}) : super(key: key);
  @override
  State<CommonAppBar> createState() => _CommonAppBar();
}
class _CommonAppBar extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:widget.events==false? AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_sharp,color:AppColor.black,)),
        title: Utils.mediumHeadingNormalText(text:widget.title,color: AppColor.black,fontWeight: FontWeight.w700),
        actions: [
          widget.isChat==true?
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(children: [
              GestureDetector(
                onTap: (){
                  widget.onTap!();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Utils.image(image: widget.imageUrl.toString(),height: 18,width: 18),
                ),
              ),
              GestureDetector(
                onTap: (){
                  widget.onTapMenu!();
                },
                child: Icon(Icons.more_vert,color:
                widget.color ?? AppColor.grey,),
              )
            ],),
          ):
          widget.action==true?
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
                onTap: (){
                  widget.onTap!();
                },
                child:widget.imageUrl.toString()=="null"?
                Icon(Icons.more_vert,color:
                widget.color ?? AppColor.grey,):Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Utils.image(image: widget.imageUrl.toString(),height: 18,width: 18),
                )),
          ):widget.searchAction==true?
          Padding(
            padding: const EdgeInsets.only(right:12),
            child: Row(
              children: [
                const Icon(Icons.search,color: AppColor.black,),
                const SizedBox(width: 10,),
                GestureDetector(
                    onTap: (){
                      widget.onTap!();
                    },
                    child:widget.imageUrl.toString()=="null"?
                    Icon(Icons.more_vert,color:
                    widget.color ?? AppColor.grey,):Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Utils.image(image: widget.imageUrl.toString(),height: 18,width: 18),
                    )),
              ],
            ),
          ):const SizedBox()
        ],
      ):
      AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_sharp,color:AppColor.black,)),
        title: Utils.mediumHeadingNormalText(text:widget.title,color: AppColor.black,fontWeight: FontWeight.w700),
        actions: const [
          Icon(Icons.search,color: AppColor.black,),
          SizedBox(width: 10,)
        ],
      ),

    );
  }
}