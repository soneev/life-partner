import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lifepartner/di_container/di_container.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';
import 'package:lifepartner/service/db_serices/user_data_service.dart';
import 'package:lifepartner/service/firebase_service/firebase_auth_services.dart';

class MyProfileProvider extends ChangeNotifier {
  final FirebaseAuthService authService = locator<FirebaseAuthService>();
  final userDataService = locator<UserDataService>();

  bool isloading = true;
  void setLoader(bool value) {
    isloading = value;
    notifyListeners();
  }

  UserData? loginedUser;
  Future<void> getCurrentUser() async {
    authService.user = FirebaseAuth.instance.currentUser;

    List<UserData> usersList = userDataService.getUsers();
    if (authService.user != null) {
      loginedUser = usersList
          .firstWhere((dbuser) => dbuser.email == authService.user!.email);
      setLoader(false);
    }
    notifyListeners();
  }

  void signOut(BuildContext context) async {
    authService.user = null;
    await FirebaseAuth.instance.signOut();
  }
}
