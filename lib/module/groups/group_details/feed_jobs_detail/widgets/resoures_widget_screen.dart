import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../utils/utils.dart';

class ResourcesWidgetScreen extends StatefulWidget {
  const ResourcesWidgetScreen({Key? key}) : super(key: key);

  @override
  State<ResourcesWidgetScreen> createState() => _ResourcesWidgetScreenState();
}

class _ResourcesWidgetScreenState extends State<ResourcesWidgetScreen> {
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return  SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(left:20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                      onTap: ()async{
                        final XFile? image=await picker.pickImage(source: ImageSource.gallery);
                        var file=File(image!.path);
                      },
                      child: Utils.image(image: "square_box_icon.png",width:150,height: 150)),
                  Positioned.fill(child: Utils.image(image: "circle_add_icon.png",width:50,height: 50))
                ],
              )
          ],),
        ),
      ),
    );
  }
}
