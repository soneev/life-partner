import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:hive/hive.dart';
import 'package:lifepartner/di_container/di_container.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';
import 'package:lifepartner/service/firebase_service/firebase_auth_services.dart';

class SignUpProvider extends ChangeNotifier {
  final FirebaseAuthService authService = locator<FirebaseAuthService>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String _selectedGender = '';

  String get selectedGender => _selectedGender;

  void setGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  final userDataDB = Hive.box("users_box");
  Future<void> signUpUser({
    required String email,
    required String password,
    required String username,
    required String address,
    required String gender,
    required String phoneNumber,
  }) async {
    try {
      User? user =
          await authService.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        createUserdb(
            username: username,
            email: email,
            address: address,
            gender: gender,
            phone: phoneNumber);
        log("User signed up successfully: ${user.uid}");
      } else {
        log("Sign-up failed");
      }
    } catch (e) {
      // Handle any exceptions
      log("Error during sign-up: $e");
    }
  }

  void createUserdb(
      {required String username,
      required String email,
      required String address,
      required String gender,
      required String phone}) {
    UserData dbuser = UserData(
        username: username,
        age: 0,
        address: address,
        gender: gender,
        height: 0.0,
        weight: 0.0,
        email: email,
        phoneNumber: phone,
        imageUrl: '',
        description: ' ');
    Map<String, dynamic> userDataMap = {
      'username': dbuser.username,
      'age': dbuser.age,
      'address': dbuser.address,
      'gender': dbuser.gender,
      'height': dbuser.height,
      'weight': dbuser.weight,
      'email': dbuser.email,
      'imageUrl': dbuser.imageUrl,
      'description': dbuser.description,
    };
    userDataDB.add(userDataMap);
  }

  validateName(String? name) {
    if (name!.isEmpty) {
      return 'Name required';
    }

    return null;
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

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  validateAddress(String? address) {
    if (address!.isEmpty) {
      return 'Address required';
    }

    return null;
  }
}
