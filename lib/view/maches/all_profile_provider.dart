import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lifepartner/di_container/di_container.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';
import 'package:lifepartner/service/db_serices/user_data_service.dart';
import 'package:lifepartner/service/firebase_service/firebase_auth_services.dart';

class AllProfileProvider extends ChangeNotifier {
  TextEditingController controller = TextEditingController();

  final FirebaseAuthService authService = locator<FirebaseAuthService>();

  bool isloading = true;

  void setLoader(bool value) {
    isloading = value;
    notifyListeners();
  }

  UserData? loginedUser;
  Future<void> getCurrentUser() async {
    authService.user = FirebaseAuth.instance.currentUser;
    final userDataService = locator<UserDataService>();
    List<UserData> usersList = userDataService.getUsers();
    if (authService.user != null) {
      loginedUser = usersList
          .firstWhere((dbuser) => dbuser.email == authService.user!.email);
      setLoader(false);
    }
    notifyListeners();
  }

  List<UserData> allprofileList = [];
  void setUsers(List<UserData> users) {
    allprofileList = users;
    notifyListeners();
  }

  Future<void> fetchDataFromHive() async {
    final userDataService = locator<UserDataService>();

    List<UserData> users = userDataService.getUsers();

    List<UserData> filteredUsers =
        users.where((user) => user.gender != loginedUser!.gender).toList();

    setUsers(filteredUsers);
    setLoader(false);
    notifyListeners();
  }
}
