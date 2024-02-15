import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lifepartner/view/detail_screen/detail_screen.dart';
import 'package:lifepartner/view/landing_page/landing_page.dart';
import 'package:lifepartner/view/login/login_screen.dart';
import 'package:lifepartner/view/sign_up/sign_up_screen.dart';
import 'package:lifepartner/view/splash/splash_screen.dart';
import 'package:lifepartner/view/update_profile/update_profle.dart';

import 'route_name.dart';

appRoutes() => [
      GetPage(
        name: AppRoute.splash,
        page: () =>
            // const LoginScreen()
            //  const SignUpScreen(),
            const SplashScreen(),
      ),
      GetPage(
        name: AppRoute.signUp,
        page: () => const SignUpScreen(),
      ),
      GetPage(
        name: AppRoute.login,
        page: () => const LoginScreen(),
      ),
      GetPage(
        name: AppRoute.landing,
        page: () => LandingScreen(),
      ),
      GetPage(
        name: AppRoute.detail,
        page: () => const DetailScreen(),
      ),
      GetPage(
        name: AppRoute.update,
        page: () => const UpdateProfile(),
      ),
    ];
