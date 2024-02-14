import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifepartner/utils/app_route/app_string.dart';
import 'package:lifepartner/utils/app_route/route_name.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/view/favorite/favorite_provider.dart';
import 'package:lifepartner/view/home_page/homepage_provider.dart';
import 'package:lifepartner/widgets/custom_app_bar.dart';
import 'package:lifepartner/widgets/custom_images.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class AllProfilesScreen extends StatelessWidget {
  const AllProfilesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
        child: GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: staticProvider.usersList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: screenWidth / (screenWidth / 1.2),
            crossAxisSpacing: 5,
            crossAxisCount: isLandscape ? 3 : 2,
            mainAxisSpacing: 5,
            mainAxisExtent: 220,
          ),
          itemBuilder: (context, index) {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedImageLoader(
                      imageUrl:
                          staticProvider.usersList[index].imageUrl.isNotEmpty
                              ? staticProvider.usersList[index].imageUrl
                              : placeHolder,
                      height: 150,
                      width: screenWidth,
                      boxFit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextAbhaya(
                            // "Remya",
                            staticProvider.usersList[index].username,
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
                    CustomTextAbhaya(
                      staticProvider.usersList[index].age.toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}




// class AllProfilesScreen extends StatelessWidget {
//   const AllProfilesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//           title: CustomText(
//         "All profiles",
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//       )),
//       body: SingleChildScrollView(
//           child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                   height: 700,
//                   child: GridView.builder(
//                       itemCount: 10,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               childAspectRatio: 120 / 140,
//                               //  childAspectRatio: 1 / 1,
//                               crossAxisSpacing: 5,
//                               crossAxisCount: 2,
//                               mainAxisSpacing: 5,
//                               mainAxisExtent: 220),
//                       itemBuilder: (context, index) {
//                         return Container(
//                           height: 250,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: AppColors.white),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               CachedImageLoader(
//                                 imageUrl:
//                                     'https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg',
//                                 height: 150,
//                                 width: 1.sw,
//                                 boxFit: BoxFit.fill,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(5),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     CustomTextAbhaya(
//                                       "Remya",
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         print("object");
//                                       },
//                                       child: const Icon(
//                                         Icons.favorite,
//                                         size: 30,
//                                         color: AppColors.darkPrimary,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               CustomTextAbhaya(
//                                 "Age",
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ],
//                           ),
//                         );
//                       })))),
//     );
//   }
// }
