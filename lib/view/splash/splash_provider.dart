import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifepartner/di_container/di_container.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';
import 'package:lifepartner/service/db_serices/user_data_service.dart';
import 'package:lifepartner/utils/app_route/route_name.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider() {
    checkLogin();
  }

  late StreamSubscription<User?> user;
  checkLogin() {
    Future.delayed(const Duration(seconds: 4), () {
      user = FirebaseAuth.instance.authStateChanges().listen((user) async {
        log(user.toString());
        if (user == null) {
          log('User is currently signed out!');

          Get.toNamed(AppRoute.login);
        } else {
          getuserDb(user.email.toString());

          log('User is signed in!');
          Get.toNamed(AppRoute.landing);
        }
      });
    });
  }

  UserData? dbUser;

  getuserDb(String loginEmail) {
    final userDataService = locator<UserDataService>();
    List<UserData> usersList = userDataService.getUsers();
    try {
      dbUser = usersList.firstWhere((dbuser) => dbuser.email == loginEmail);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
