import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/view/sign_up/sign_up_provider.dart';
import 'package:lifepartner/widgets/custom_button.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:lifepartner/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 1 / 2;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final staticProvider = Provider.of<SignUpProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomText('Welcome',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontheight: 1.28125,
                      color: AppColors.primaryColor),
                  CustomTextAbhaya('Sign Up to continue',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontheight: 2.08,
                      color: AppColors.grey),
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
                    // isThisFieldRequired: true,
                    // onOnce: (String value) =>
                    //     controller.validateName(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextAbhaya('Email',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontheight: 1.18,
                      color: AppColors.black),
                  CustomTextField(
                    // isThisFieldRequired: true,
                    controller: staticProvider.emailController,
                    hint: "Enter your email",
                    // onOnce: (String value) =>
                    //     controller.validateEmail(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextAbhaya('Password',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontheight: 1.18,
                      color: AppColors.black),
                  CustomTextField(
                    // isThisFieldRequired: true,
                    controller: staticProvider.passWordController,
                    hint: "Enter your password",
                    // onOnce: (String value) =>
                    //     controller.validateCompanyName(value)
                    // validator: (cmp) =>
                    //     controller.validateCompanyName(cmp)
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
                    controller: staticProvider.phoneNumberController,
                    hint: "Enter your Number",
                    // onOnce: (String value) =>
                    //     controller.validateCompanyId(value)
                    // validator: (id) =>
                    //     controller.validateCompanyId(id)
                  ),
                  CustomTextAbhaya('Gender',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontheight: 1.60,
                      color: AppColors.black),
                  Consumer<SignUpProvider>(builder: (context, provider, child) {
                    return Column(
                      children: [
                        RadioListTile(
                          activeColor: AppColors.primaryColor,
                          title: CustomText('Male'),
                          value: 'Male',
                          groupValue: provider.selectedGender,
                          onChanged: (value) {
                            staticProvider.setGender(value!);
                          },
                        ),
                        RadioListTile(
                          activeColor: AppColors.primaryColor,
                          title: CustomText('Female'),
                          value: 'Female',
                          groupValue: provider.selectedGender,
                          onChanged: (value) {
                            staticProvider.setGender(value!);
                          },
                        )
                      ],
                    );
                  }),
                  CustomTextAbhaya('Address',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontheight: 1.18,
                      color: AppColors.black),
                  CustomTextField(
                    // isThisFieldRequired: true,
                    controller: staticProvider.addressController,
                    hint: "house,place,etc...",
                    // onOnce: (String value) =>
                    //     controller.validateCompanyId(value)
                    // validator: (id) =>
                    //     controller.validateCompanyId(id)
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    color: AppColors.primaryColor,
                    onPressed: () {
                      staticProvider.signUpUser(
                          email: staticProvider.emailController.text,
                          password: staticProvider.passWordController.text,
                          username: staticProvider.nameController.text,
                          phoneNumber:
                              staticProvider.phoneNumberController.text,
                          address: staticProvider.addressController.text,
                          gender: staticProvider.selectedGender);
                      // Get.toNamed(AppRoute.landing);
                    },
                    text: "Sign Up",
                    textColor: AppColors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//  Stack(
      //   children: <Widget>[
      //     Positioned(
      //       right: -getSmallDiameter(context) / 2,
      //       top: -getSmallDiameter(context) / 2,
      //       child: Container(
      //         width: getSmallDiameter(context),
      //         height: getSmallDiameter(context),
      //         decoration: const BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Color(0xFFF3E9EE),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: -getBigDiameter(context) / 2,
      //       top: -getBigDiameter(context) / 2,
      //       child: Container(
      //         width: getBigDiameter(context),
      //         height: getBigDiameter(context),
      //         decoration: const BoxDecoration(
      //           shape: BoxShape.circle,
      //           gradient: LinearGradient(
      //             colors: [
      //               Color(0xffC6368B),
      //               Color(0xffF39CCF),
      //             ],
      //             begin: Alignment.topCenter,
      //             end: Alignment.bottomCenter,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       right: -getBigDiameter(context) / 1,
      //       bottom: -getBigDiameter(context) / 1,
      //       child: Container(
      //         width: getBigDiameter(context),
      //         height: getBigDiameter(context),
      //         decoration: const BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Color(0xFFF3E9EE),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       child: Column(
      //         children: [
      //           CustomTextField(
      //             controller: null,
      //             hint: '',
      //           ),
      //           CustomTextField(
      //             controller: null,
      //             hint: '',
      //           ),
      //           CustomTextField(
      //             controller: null,
      //             hint: '',
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),