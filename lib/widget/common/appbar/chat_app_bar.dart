import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utils.dart';

class CommonAppBarChat extends StatefulWidget {
  String? title;
  Function? onTap;
  Function? onTapMennu;
  bool? action;
  String? imageUrl;
  String? imageUrlProfile;
  Color? color;
  bool? searchAction;
  bool? events;
  CommonAppBarChat({Key? key,this.title,this.onTap,this.onTapMennu,this.action=false,this.imageUrl,this.events=false,
    this.color,this.searchAction,this.imageUrlProfile}) : super(key: key);
  @override
  State<CommonAppBarChat> createState() => _CommonAppBarChat();
}
class _CommonAppBarChat extends State<CommonAppBarChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:widget.events==false? AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_sharp,color:AppColor.black,)),
            Gap(18),
            Container(height: 42,width: 42,
              decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Utils.image(image: widget.imageUrlProfile,fit: BoxFit.cover)),
            ),
            Gap(10),
            Utils.mediumHeadingNormalText(text:widget.title,color: AppColor.black,fontWeight: FontWeight.w700),
          ],
        ),
        actions: [
          widget.action==true?
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
                child:widget.imageUrl.toString()=="null"?
                GestureDetector(
                  onTap: (){
                    widget.onTap!();
                  },
                  child: Icon(Icons.more_vert,color:
                  widget.color ?? AppColor.grey,),
                ):Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      GestureDetector(
    onTap: (){
    widget.onTap!();
    },
                          child: Utils.image(image: widget.imageUrl.toString(),height: 18,width: 18)),
                      SizedBox(width: 12,),
                      GestureDetector(
                        onTap: (){
                          widget.onTapMennu!();
                        },
                        child: Icon(Icons.more_vert,color:
                        widget.color ?? AppColor.grey,),
                      )
                    ],
                  ),
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