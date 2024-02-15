import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifepartner/utils/app_route/app_string.dart';
import 'package:lifepartner/utils/app_route/route_name.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/view/my_profile/my_profile_provider.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final staticProvider =
        Provider.of<MyProfileProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Consumer<MyProfileProvider>(builder: (context, provider, child) {
          return provider.isloading
              ? const Center(child: CircularProgressIndicator())
              : Column(
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
                                CircleAvatar(
                                  backgroundColor: AppColors.white,
                                  radius: 70,
                                  child:
                                      provider.loginedUser!.imageUrl.isNotEmpty
                                          ? CircleAvatar(
                                              backgroundColor: Colors.grey,
                                              radius: 60,
                                              backgroundImage: FileImage(File(
                                                  provider.loginedUser!.imageUrl
                                                      .toString())))
                                          : CircleAvatar(
                                              radius: 60,
                                              backgroundImage:
                                                  NetworkImage(placeHolder)
                                              //
                                              ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextAbhaya(
                                        // "Remya kapoor",
                                        provider.loginedUser!.username,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w800,
                                        fontheight: 1.78,
                                      ),
                                      CustomTextAbhaya(
                                        "Working Professional",
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
                              onSelected: (value) {
                                if (value == 0) {
                                  Get.toNamed(AppRoute.update,
                                      arguments: staticProvider.loginedUser);
                                } else if (value == 1) {
                                  staticProvider.signOut(context);
                                  Get.offAllNamed(AppRoute.login);
                                }
                              },
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 0,
                                  child: CustomText("Edit profile"),
                                ),
                                PopupMenuItem(
                                  value: 1,
                                  child: CustomText("Logout "),
                                ),
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
                              // "pune,india",
                              provider.loginedUser!.address,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: provider.loginedUser!.height == 0.0
                                        ? const SizedBox()
                                        : Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.grey,
                                                    width: 1)),
                                            child: CustomTextAbhaya(
                                              provider.loginedUser!.height
                                                  .toString(),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              fontheight: 1.78,
                                            ),
                                          )),
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
                                  child: provider.loginedUser!.weight == 0.0
                                      ? const SizedBox()
                                      : Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: AppColors.grey,
                                                  width: 1)),
                                          child: CustomTextAbhaya(
                                            "${provider.loginedUser!.weight.toString()}kg",
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
                              provider.loginedUser!.description.isEmpty
                                  ? " looking for good preposals from india "
                                  : provider.loginedUser!.description,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontheight: 1.78,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
        }),
      )),
    );
  }
}
