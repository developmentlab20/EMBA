import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../../widget/common/appbar/common_appBar.dart';
import '../../widget/common/common_button.dart';

class FilterJobScreen extends StatefulWidget {
  const FilterJobScreen({Key? key}) : super(key: key);

  @override
  _FilterJobScreen createState() => _FilterJobScreen();
}

class _FilterJobScreen extends State<FilterJobScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize:  const Size(double.infinity, kToolbarHeight),
        child:CommonAppBar(title:UtilStrings.FILTER,action: false),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: SizedBox(width:size.width,height: size.height,
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Utils.mediumHeadingNormalText(text:UtilStrings.Industr,textSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,textAlign: TextAlign.start),
                        const Spacer(),
                        Utils.mediumHeadingNormalText(text:UtilStrings.View_More,textSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,textAlign: TextAlign.start),
                        GestureDetector(
                            onTap: (){
                            },
                            child: const Icon(Icons.arrow_forward,color: AppColor.grey,)),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "search.png",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Search,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        ),
                        const SizedBox(height: 14,),Utils.customDivider(),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "ic_box.jpeg",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Management_companies_Enterprises,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        ),
                        const SizedBox(height: 14,),Utils.customDivider(),
                        const SizedBox(height: 14,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "ic_box.jpeg",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Real_Estate_and_Rental_Leasing,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Utils.mediumHeadingNormalText(text:UtilStrings.Location,textSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,textAlign: TextAlign.start),
                        const Spacer(),
                        Utils.mediumHeadingNormalText(text:UtilStrings.View_More,textSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,textAlign: TextAlign.start),
                        GestureDetector(
                            onTap: (){
                            },
                            child: const Icon(Icons.arrow_forward,color: AppColor.grey,)),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "search.png",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Search,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        ),
                        const SizedBox(height: 14,),Utils.customDivider(),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "ic_box.jpeg",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Baltimore,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        ),
                        const SizedBox(height: 14,),Utils.customDivider(),
                        const SizedBox(height: 14,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "ic_box.jpeg",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.New_York_City,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Utils.mediumHeadingNormalText(text:UtilStrings.Job_Function,textSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,textAlign: TextAlign.start),
                        const Spacer(),
                        Utils.mediumHeadingNormalText(text:UtilStrings.View_More,textSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,textAlign: TextAlign.start),
                        GestureDetector(
                            onTap: (){
                            },
                            child: const Icon(Icons.arrow_forward,color: AppColor.grey,)),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "search.png",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Search,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        ),
                        const SizedBox(height: 14,),Utils.customDivider(),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "ic_box.jpeg",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Management_companies_Enterprises,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        ),
                        const SizedBox(height: 14,),Utils.customDivider(),
                        const SizedBox(height: 14,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Utils.image(image: "ic_box.jpeg",height: 16,width: 16),
                            const SizedBox(width: 10,),
                            Utils.mediumHeadingNormalText(text:UtilStrings.Real_Estate_and_Rental_Leasing,textSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey,textAlign: TextAlign.start),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: CommonButton(text: "Apply",))
        ],
      ),
    );
  }
}
