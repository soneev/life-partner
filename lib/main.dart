import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:lifepartner/utils/app_route/route.dart';
import 'package:lifepartner/view/favorite/favorite_provider.dart';
import 'package:lifepartner/view/home_page/homepage_provider.dart';
import 'package:lifepartner/view/landing_page/landing_page_provider.dart';
import 'package:lifepartner/view/login/login_provider.dart';
import 'package:lifepartner/view/maches/all_profile_provider.dart';
import 'package:lifepartner/view/my_profile/my_profile_provider.dart';
import 'package:lifepartner/view/sign_up/sign_up_provider.dart';
import 'package:lifepartner/view/splash/splash_provider.dart';
import 'package:lifepartner/view/update_profile/update_profile_provider.dart';

import 'package:provider/provider.dart';

import 'di_container/di_container.dart';
import 'utils/app_route/route_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Initializing Firebase...");

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBR54a2QpbiTFLmjil_tsIhMEKx4th2ZVk",
              appId: "1:803443140586:android:78f1204fa984e8ae7af493",
              messagingSenderId: "803443140586",
              projectId: "life-partner-d3363"))
      : await Firebase.initializeApp();
  print("Firebase initialized successfully!");
  await Hive.initFlutter();
  setupLocator();
  await Hive.openBox("users_box");
  await Hive.openBox("currentUser_box");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SplashProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoginProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LandingProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AllProfileProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MyProfileProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => UpdateProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Life partner',
              initialRoute: AppRoute.splash,
              getPages: appRoutes(),
              // home: CustomCalender(),
            ));
  }
}
