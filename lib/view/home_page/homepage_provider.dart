import 'package:flutter/material.dart';
import 'package:lifepartner/di_container/di_container.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';
import 'package:lifepartner/service/db_serices/user_data_service.dart';
import 'package:lifepartner/view/login/login_provider.dart';
import 'package:lifepartner/view/splash/splash_provider.dart';
import 'package:provider/provider.dart';

class HomePageProvider extends ChangeNotifier {
  // HomePageProvider() {
  //   setInitialUsers();
  //   // fetchDataFromHive();
  // }
  List<UserData> usersList = [];

  UserData? loginedUser;
  void setInitialUsers(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    if (splashProvider.dbUser != null) {
      loginedUser = splashProvider.dbUser;
      if (loginedUser != null) {
        fetchDataFromHive();
      } else {
        loginedUser = loginProvider.dbUser;
        if (loginedUser != null) {
          fetchDataFromHive();
        }
      }
    }
    print(loginedUser.toString());
  }

  fetchDataFromHive() {
    final userDataService = locator<UserDataService>();

    List<UserData> users = userDataService.getUsers();
    print(users.length);

    List<UserData> filteredUsers =
        users.where((user) => user.gender != loginedUser!.gender).toList();

    setUsers(filteredUsers);
  }

  void setUsers(List<UserData> users) {
    usersList = users;
    notifyListeners();
  }
}
