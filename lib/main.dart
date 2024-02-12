import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifepartner/utils/app_route/route.dart';
import 'package:lifepartner/view/home_page/homepage_provider.dart';
import 'package:lifepartner/view/landing_page/landing_page_provider.dart';
import 'package:lifepartner/view/login/login_provider.dart';
import 'package:lifepartner/view/sign_up/sign_up_provider.dart';
import 'package:lifepartner/view/splash/splash_provider.dart';

import 'package:provider/provider.dart';

import 'utils/app_route/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
