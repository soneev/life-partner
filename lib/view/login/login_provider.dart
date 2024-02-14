import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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

  List<String> brideF = [
    // "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/774095/pexels-photo-774095.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/1090387/pexels-photo-1090387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/789822/pexels-photo-789822.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/735552/pexels-photo-735552.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];
  List<String> groomM = [
    // "https://images.pexels.com/photos/839011/pexels-photo-839011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/1121796/pexels-photo-1121796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/450212/pexels-photo-450212.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // "https://images.pexels.com/photos/1496647/pexels-photo-1496647.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1182826/pexels-photo-1182826.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];

  Future<void> createItem() async {
    UserData user = UserData(
        username: "Arjun Das",
        age: 29,
        address: "kannur,kerala",
        gender: "Male",
        height: 179,
        weight: 70,
        email: "Arjun@example.com",
        imageUrl:
            'https://images.pexels.com/photos/1182826/pexels-photo-1182826.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        description:
            'Hello, I am a simple and down-to-earth person who believes in honesty and hard work. I am looking for a partner who is smart, confident, and has a positive attitude ');

    // userList.add(user2);
    //  userList.add(user3);
    //   userList.add(user4);
    //    userList.add(user2);

    Map<String, dynamic> userDataMap = {
      'username': user.username,
      'age': user.age,
      'address': user.address,
      'gender': user.gender,
      'height': user.height,
      'weight': user.weight,
      'email': user.email,
      'imageUrl': user.imageUrl,
      'description': user.description,
    };
    userDataDB.add(userDataMap);
  }

  // final userDataDB = Hive.box("users_box");
  Future<void> retrieveData() async {
    // Clear the existing list before retrieving data
    userdata.clear();

    // Iterate through items in the Hive box
    for (int i = 0; i < userDataDB.length; i++) {
      // Get the map from Hive
      Map<String, dynamic> userDataMap = userDataDB.getAt(i);

      // Convert the map to a UserData instance
      UserData user = UserData(
        username: userDataMap['username'],
        age: userDataMap['age'],
        address: userDataMap['address'],
        gender: userDataMap['gender'],
        height: userDataMap['height'],
        weight: userDataMap['weight'],
        email: userDataMap['email'],
        imageUrl: userDataMap['imageUrl'],
        description: userDataMap['description'],
      );

      // Add the user to the list
      userdata.add(user);
    }

    print(userdata[0].toString());
  }

  Future<void> deleteAllItems() async {
    // Clear all data from the Hive box
    await userDataDB.clear();
    print(userDataDB.length.toString());
  }

  Future<void> userLogin(
      {required String email, required String password}) async {
    try {
      User? user = await authService.loginWithEmailAndPassword(email, password);

      if (user != null) {
        getuserDb(user.email.toString());
        print("User signed up successfully: ${user.uid}");
        // Get.toNamed(AppRoute.signUp);
        Get.toNamed(AppRoute.landing);
      } else {
        print("Sign-up failed");
      }
    } catch (e) {
      // Handle any exceptions
      print("Error during sign-up: $e");
    }
  }

  UserData? dbUser;

  getuserDb(String loginEmail) {
    final userDataService = locator<UserDataService>();
    List<UserData> usersList = userDataService.getUsers();
    try {
      dbUser = usersList.firstWhere((user) => user.email == loginEmail);

      print(dbUser.toString());
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
