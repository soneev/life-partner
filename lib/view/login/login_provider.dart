import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:lifepartner/di_container/di_container.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';
import 'package:lifepartner/service/db_serices/user_data_service.dart';
import 'package:lifepartner/service/firebase_service/firebase_auth_services.dart';
import 'package:lifepartner/utils/app_route/route_name.dart';

class LoginProvider extends ChangeNotifier {
  final FirebaseAuthService authService = locator<FirebaseAuthService>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  List<Map<String, dynamic>> dbUserData = [];
  List<UserData> userList = [];
  List<UserData> userdata = [];

  final userDataDB = Hive.box("users_box");
  final currentUserDB = Hive.box("users_box");

  Future<void> userLogin(
      {required String email, required String password}) async {
    try {
      authService.user =
          await authService.loginWithEmailAndPassword(email, password);

      if (authService.user != null) {
        getuserDb(authService.user!.email.toString());
        log("User signed up successfully: ${authService.user!.uid}");
        // Get.toNamed(AppRoute.signUp);
        Get.toNamed(AppRoute.landing);
      } else {
        log("Sign-up failed");
      }
    } catch (e) {
      // Handle any exceptions
      log("Error during sign-up: $e");
    }
  }

  UserData? dbUser;

  getuserDb(String loginEmail) {
    final userDataService = locator<UserDataService>();
    List<UserData> usersList = userDataService.getUsers();
    try {
      dbUser = usersList.firstWhere((user) => user.email == loginEmail);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? "")) {
      return "Email is not valid";
    }
    return null;
  }

  validatePassWord(String? pwd) {
    if (!GetUtils.isLengthGreaterOrEqual(pwd, 6)) {
      return "password required 6 character";
    }
    return null;
  }
}
