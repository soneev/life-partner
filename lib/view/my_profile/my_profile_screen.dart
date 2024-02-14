import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/widgets/custom_images.dart';
import 'package:lifepartner/widgets/custom_text.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 1.sw,
                  height: 200,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppColors.darkPrimary,
                    AppColors.lightPrimary
                  ])),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 70,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                "https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg"),
                            // child: CachedImageLoader(
                            //   imageUrl:
                            //       "https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg",
                            //   height: 150,
                            //   width: 1.sw,
                            //   boxFit: BoxFit.contain,
                            // ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              CustomTextAbhaya(
                                "Remya kapoor",
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                fontheight: 1.78,
                              ),
                              CustomTextAbhaya(
                                "Fashion designer",
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontheight: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 0,
                          child: CustomText("Update"),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: CustomText("Delete "),
                        )
                      ],
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
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
                      "Location",
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontheight: 1.78,
                    ),
                    CustomTextAbhaya(
                      "pune,india",
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.grey, width: 1)),
                            child: CustomTextAbhaya(
                              "5.5 feet",
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.grey, width: 1)),
                            child: CustomTextAbhaya(
                              "60kg",
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
                      "my name is remya as fashion designer looking for good preposals from near by in pune",
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
      )),
    );
  }
}
