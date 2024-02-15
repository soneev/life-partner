import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';
import 'package:lifepartner/utils/app_route/app_string.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';

import 'package:lifepartner/view/update_profile/update_profile_provider.dart';

import 'package:lifepartner/widgets/custom_app_bar.dart';
import 'package:lifepartner/widgets/custom_button.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:lifepartner/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final staticProvider = Provider.of<UpdateProvider>(context, listen: false);
    final userDetails = ModalRoute.of(context)!.settings.arguments as UserData;
    String updatedName = userDetails.username.isEmpty
        ? staticProvider.nameController.text
        : staticProvider.nameController.text = userDetails.username;
    String? updatedPhoneNumber = userDetails.phoneNumber == null
        ? staticProvider.phoneController.text
        : staticProvider.phoneController.text = userDetails.phoneNumber!;
    String updatedAddressNumber = userDetails.address.isEmpty
        ? staticProvider.addressController.text
        : staticProvider.addressController.text = userDetails.address;

    return Scaffold(
      appBar: CustomAppBar(
        title: CustomText("Update Profile"),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Form(
              key: formKey,
              child:
                  Consumer<UpdateProvider>(builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            backgroundColor: AppColors.grey.withOpacity(0.1),
                            radius: 70,
                            child: Consumer<UpdateProvider>(
                                builder: (context, provider, child) {
                              if (provider.image != null) {
                                return CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      FileImage(File(provider.image!.path)),
                                );
                              } else {
                                // Check if userDetails.imageUrl is not null
                                if (userDetails.imageUrl.isNotEmpty) {
                                  return CircleAvatar(
                                    radius: 60,
                                    backgroundImage: FileImage(
                                        File(userDetails.imageUrl.toString())),
                                  );
                                } else {
                                  return CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(placeHolder),
                                  );
                                }
                              }

                              /*  provider.image != null
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                          FileImage(File(provider.image!.path))
                                      //
                                      )
                                  : CircleAvatar(
                                      radius: 60,
                                      backgroundImage: NetworkImage(placeHolder)
                                      //
                                      );*/
                            }),
                          ),
                        ),
                        PopupMenuButton(
                            icon: Transform.rotate(
                              angle: 100,
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.attachment_rounded,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                            onSelected: (result) {
                              if (result == 0) {
                                staticProvider.pickCameraImage();
                              } else if (result == 1) {
                                staticProvider.pickGalleryImage();
                              }
                            },
                            itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Camera"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.camera_alt,
                                            color: Colors.grey)
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Gallery"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.add_photo_alternate,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                        // const Icon(
                        //   Icons
                        //       .edit, // Replace 'your_icon_here' with the actual icon you want to use
                        //   size: 30, // Adjust the size of the icon as needed
                        //   color: Colors
                        //       .grey, // Adjust the color of the icon as needed
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomTextAbhaya('Full Name',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontheight: 1.18,
                        color: AppColors.black),
                    CustomTextField(
                      controller: staticProvider.nameController,
                      hint: "Enter your full name",
                      validator: (name) => staticProvider.validateName(name!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextAbhaya('PhoneNumber',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontheight: 1.18,
                        color: AppColors.black),
                    CustomTextField(
                      // isThisFieldRequired: true,
                      controller: staticProvider.phoneController,
                      hint: "Enter your Number",
                      validator: (number) =>
                          staticProvider.validateMobile(number!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextAbhaya('Age',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontheight: 1.18,
                        color: AppColors.black),
                    CustomTextFieldInt(
                      controller: staticProvider.ageController,
                      hint: "Enter Age",
                      validator: (age) => staticProvider.validateAge(age),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextAbhaya('Address',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontheight: 1.18,
                        color: AppColors.black),
                    CustomTextField(
                      // isThisFieldRequired: true,
                      controller: staticProvider.addressController,
                      hint: "house,place,etc...",
                      validator: (adr) => staticProvider.validateAddress(adr!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextAbhaya("Physic",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontheight: 1.18,
                        color: AppColors.black),
                    Row(
                      children: [
                        CustomText("Height :",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontheight: 1.18,
                            color: const Color.fromARGB(255, 6, 5, 5)),
                        const SizedBox(
                          width: 30,
                        ),
                        // const heightPicker(),
                        SizedBox(
                            height: 40,
                            child: DropdownButton<int>(
                              value: provider.selectedHeight,
                              onChanged: (newValue) {
                                staticProvider.setSelectedHeight(newValue!);
                              },
                              items: staticProvider.heightValues
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text('$value cm'),
                                );
                              }).toList(),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        CustomText("Weight :",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontheight: 1.18,
                            color: const Color.fromARGB(255, 6, 5, 5)),
                        const SizedBox(
                          width: 30,
                        ),
                        // const WeightPicker(),
                        SizedBox(
                            height: 40,
                            child: DropdownButton<int>(
                              value: provider.selectedWeight,
                              onChanged: (newValue) {
                                staticProvider.setSelectedWeight(newValue!);
                              },
                              items: provider.weightValues
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text('$value Kg'),
                                );
                              }).toList(),
                            ))
                      ],
                    ),
                    CustomTextAbhaya('Bio',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontheight: 1.18,
                        color: AppColors.black),
                    CustomTextField(
                      controller: staticProvider.descriptionController,
                      hint: "Enter bio",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      color: AppColors.primaryColor,
                      onPressed: () {
                        if (formKey.currentState!.validate() ?? false) {
                          staticProvider.updateUserData(
                              username: updatedName,
                              email: userDetails.email,
                              age: int.parse(staticProvider.ageController.text),
                              address: updatedAddressNumber,
                              phone: updatedPhoneNumber,
                              height: staticProvider.selectedHeight!.toDouble(),
                              weight: staticProvider.selectedWeight!.toDouble(),
                              imageUrl: staticProvider.image != null
                                  ? staticProvider.image!.path.toString()
                                  : userDetails.imageUrl,
                              description:
                                  staticProvider.descriptionController.text);
                        }
                        // Get.toNamed(AppRoute.landing);
                      },
                      text: "Update",
                      textColor: AppColors.white,
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
