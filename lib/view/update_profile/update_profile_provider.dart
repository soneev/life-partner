import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifepartner/utils/app_route/route_name.dart';

class UpdateProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<int> heightValues = List.generate(36, (index) => index + 145);

  int? selectedHeight;

  setSelectedHeight(int value) {
    selectedHeight = value;
    notifyListeners();
  }

  int? selectedWeight;
  List<int> weightValues =
      List.generate(56, (index) => index + 45); // Weights from 45 kg to 100 kg

  setSelectedWeight(int value) {
    selectedWeight = value;
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  XFile? get image => _image;

  Future<void> pickGalleryImage() async {
    _image = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> pickCameraImage() async {
    _image = await _picker.pickImage(source: ImageSource.camera);
    notifyListeners();
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

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }

    // Parse the entered value to an integer
    int? age = int.tryParse(value);

    if (age == null) {
      return 'Invalid age';
    }

    // Check if the age is within the specified range (21 to 41)
    if (age < 21 || age > 41) {
      return 'Age must be between 21 and 41';
    }

    return null; // No validation error
  }

  final userDataDB = Hive.box("users_box");

  void updateUserData(
      {required String email,
      required String username,
      required String address,
      required String phone,
      required int age,
      required double height,
      required double weight,
      required String imageUrl,
      String? description}) {
    if (userDataDB.isNotEmpty) {
      // Find the index of the user with the specified email
      int userIndex = userDataDB.values
          .toList()
          .indexWhere((userData) => (userData['email'] == email));

      // Check if the user with the specified email was found
      if (userIndex != -1) {
        // Retrieve the user data at the found index
        Map<dynamic, dynamic> existingUserData = userDataDB.getAt(userIndex);

        existingUserData['username'] = username;
        existingUserData['address'] = address;

        existingUserData['phone'] = phone;
        existingUserData['age'] = age;
        existingUserData['height'] = height;
        existingUserData['weight'] = weight;
        existingUserData['imageUrl'] = imageUrl;
        existingUserData['description'] = description;
        log("$userIndex ---------$existingUserData");

        // Save the updated data back to the box
        userDataDB.putAt(userIndex, existingUserData);
        Get.offAllNamed(AppRoute.landing);
      }
    }
  }
}
