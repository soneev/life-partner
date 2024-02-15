import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';
import 'package:lifepartner/utils/app_route/app_string.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/widgets/custom_images.dart';
import 'package:lifepartner/widgets/custom_text.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userDetails = ModalRoute.of(context)!.settings.arguments as UserData;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                CachedImageLoader(
                  imageUrl: userDetails.imageUrl.isNotEmpty
                      ? userDetails.imageUrl
                      : placeHolder,
                  height: 300,
                  width: 1.sw,
                  boxFit: BoxFit.cover,
                ),
                Container(
                  height: 500,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextAbhaya(
                          userDetails.username,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          fontheight: 1.78,
                        ),
                        CustomTextAbhaya(
                          "Working Professional",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontheight: 1,
                        ),
                        CustomTextAbhaya(
                          "Location",
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontheight: 1.78,
                        ),
                        CustomTextAbhaya(
                          userDetails.address,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontheight: 1,
                        ),
                        Row(
                          children: [
                            CustomTextAbhaya(
                              "Height :",
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontheight: 1.78,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.grey, width: 1)),
                                child: CustomTextAbhaya(
                                  userDetails.height.toString(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontheight: 1.78,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomTextAbhaya(
                              "Weight:",
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontheight: 1.78,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.grey, width: 1)),
                                child: CustomTextAbhaya(
                                  "${userDetails.weight.toString()}Kg",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontheight: 1.78,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomTextAbhaya(
                          "About",
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontheight: 1.78,
                        ),
                        CustomTextAbhaya(
                          userDetails.description ?? "",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontheight: 1.78,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
