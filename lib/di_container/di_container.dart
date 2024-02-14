import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifepartner/service/db_serices/user_data_service.dart';
import 'package:lifepartner/service/firebase_service/firebase_auth_services.dart';
import 'package:lifepartner/view/login/login_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<UserDataService>(
      () => UserDataService(Hive.box("users_box")));

  // Register FirebaseAuthService
  locator
      .registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  // locator.registerLazySingleton<LoginProvider>(() => LoginProvider());
}
