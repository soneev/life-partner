import 'package:flutter/material.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/view/favorite/favorite_screen.dart';
import 'package:lifepartner/view/home_page/home_page.dart';
import 'package:lifepartner/view/landing_page/landing_page_provider.dart';
import 'package:lifepartner/view/maches/all_profiles_screen.dart';
import 'package:lifepartner/view/my_profile/my_profile_screen.dart';
import 'package:lifepartner/widgets/custom_images.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  LandingScreen({super.key});

  buildBottomNavigationMenu(context) {
    return Consumer<LandingProvider>(builder: (context, value, child) {
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: SizedBox(
            height: 72,
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              enableFeedback: true,
              type: BottomNavigationBarType.fixed,
              onTap: value.changeTabIndex,
              elevation: 1,
              currentIndex: value.tabIndex,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.black,
              selectedItemColor: AppColors.primaryColor,
              unselectedLabelStyle: unselectedLabelStyle,
              selectedLabelStyle: selectedLabelStyle,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      child: CustomPngImage(
                        imageName: "home",
                        height: 40,
                        width: 40,
                        color: value.tabIndex == 0
                            ? AppColors.primaryColor
                            : AppColors.grey,
                        boxFit: BoxFit.cover,
                      )),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.favorite,
                        size: 30,
                        color: value.tabIndex == 1
                            ? AppColors.primaryColor
                            : AppColors.grey,
                      )),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      child: CustomPngImage(
                        imageName: "category",
                        height: 30,
                        width: 30,
                        color: value.tabIndex == 2
                            ? AppColors.primaryColor
                            : AppColors.grey,
                        boxFit: BoxFit.cover,
                      )),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      child: CustomPngImage(
                        imageName: "account",
                        height: 40,
                        width: 40,
                        color: value.tabIndex == 3
                            ? AppColors.primaryColor
                            : AppColors.grey,
                        boxFit: BoxFit.cover,
                      )),
                  label: 'Profile',
                ),
              ],
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: buildBottomNavigationMenu(context),
          body: Consumer<LandingProvider>(builder: (context, provider, child) {
            return IndexedStack(
              index: provider.tabIndex,
              children: const [
                HomePageScreen(),
                FavoriteScreen(),
                AllProfilesScreen(),
                MyProfileScreen()
              ],
            );
          })),
    );
  }
}
