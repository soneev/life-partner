import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifepartner/mixins/snack_bar_mixins.dart';
import 'package:lifepartner/utils/app_route/route_name.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';

import 'package:lifepartner/view/login/login_provider.dart';

import 'package:lifepartner/widgets/custom_button.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:lifepartner/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget with SnackbarMixin {
  const LoginScreen({Key? key});

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 1 / 2;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final staticProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomText('Welcome Back',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontheight: 1.28125,
                      color: AppColors.primaryColor),
                  CustomTextAbhaya('Login to continue',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontheight: 2.08,
                      color: AppColors.grey),
                  SizedBox(
                    height: 50.h,
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
                    controller: staticProvider.emailController,
                    hint: "Enter your email",
                    validator: (email) => staticProvider.validateEmail(email),
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
                    controller: staticProvider.passWordController,
                    hint: "Enter your password",
                    validator: (pswd) => staticProvider.validatePassWord(pswd),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomButton(
                    color: AppColors.primaryColor,
                    onPressed: () {
                      if (formKey.currentState!.validate() ?? false) {
                        staticProvider.userLogin(
                            email: staticProvider.emailController.text,
                            password: staticProvider.passWordController.text);
                      } else {
                        showErrorSnackbar(context,
                            title: "Error", message: "login failed");
                      }
                    },
                    text: "Login",
                    textColor: AppColors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextAbhaya(" Are you a new user? ",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.signUp);
                            // staticProvider.retrieveData();
                            // print(staticProvider.userdata.length.toString());

                            // staticProvider.deleteAllItems();
                          },
                          child: CustomText(
                            "SignUp",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ))
                    ],
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
