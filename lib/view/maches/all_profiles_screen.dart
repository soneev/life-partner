import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifepartner/utils/app_route/app_string.dart';
import 'package:lifepartner/utils/app_route/route_name.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/view/favorite/favorite_provider.dart';
import 'package:lifepartner/view/home_page/homepage_provider.dart';
import 'package:lifepartner/view/maches/all_profile_provider.dart';
import 'package:lifepartner/widgets/custom_app_bar.dart';
import 'package:lifepartner/widgets/custom_images.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class AllProfilesScreen extends StatelessWidget {
  const AllProfilesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final staticProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    final favProvider = Provider.of<FavoriteProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        title: CustomText(
          "All profiles",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Consumer<AllProfileProvider>(builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight,
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: provider.allprofileList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: screenWidth / (screenWidth / 1.2),
                      crossAxisSpacing: 5,
                      crossAxisCount: isLandscape ? 3 : 2,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 220,
                    ),
                    itemBuilder: (context, index) {
                      var item = provider.allprofileList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.detail,
                              arguments: staticProvider.usersList[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedImageLoader(
                                imageUrl: item.imageUrl.isNotEmpty
                                    ? item.imageUrl
                                    : placeHolder,
                                height: 150,
                                width: screenWidth,
                                boxFit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextAbhaya(
                                      // "Remya",
                                      item.username,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Consumer<FavoriteProvider>(
                                        builder: (context, fav, child) {
                                      bool isFavorited = fav.isFavorite(index);
                                      return GestureDetector(
                                        onTap: () {
                                          favProvider.toggleFavorite(index);

                                          favProvider.addToFavorite(
                                              staticProvider.usersList[index]);
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          size: 30,
                                          color: isFavorited
                                              ? AppColors.darkPrimary
                                              : AppColors.grey,
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  CustomTextAbhaya(
                                    "Age :",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomTextAbhaya(
                                    item.age.toString(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
