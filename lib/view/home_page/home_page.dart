import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifepartner/utils/app_route/app_string.dart';
import 'package:lifepartner/utils/app_route/route_name.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/view/favorite/favorite_provider.dart';
import 'package:lifepartner/view/home_page/homepage_provider.dart';
import 'package:lifepartner/view/home_page/widgets/reaction_card.dart';
import 'package:lifepartner/widgets/custom_app_bar.dart';
import 'package:lifepartner/widgets/custom_images.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<HomePageProvider>(context, listen: false)
          .setInitialUsers(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 2,
          ),
        ),
        title: Consumer<HomePageProvider>(builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText("Hello! ${provider.loginedUser!.username.toString()}"),
              CustomTextAbhaya(provider.loginedUser!.address.toString()),
            ],
          );
        }),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.grey,
            size: 30,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomText(
                      "Matching Profiles",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: Consumer<HomePageProvider>(
                        builder: (context, provider, child) {
                      return OrientationBuilder(
                        builder: (context, orientation) {
                          return Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoute.detail,
                                      arguments: provider.usersList[index]);
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CachedImageLoader(
                                        imageUrl: provider.usersList[index]
                                                .imageUrl.isNotEmpty
                                            ? provider.usersList[index].imageUrl
                                            : placeHolder,
                                        height: (orientation ==
                                                Orientation.portrait)
                                            ? 350.0
                                            : 500.0,
                                        width: (orientation ==
                                                Orientation.portrait)
                                            ? 300.0
                                            : 500.0,
                                        boxFit: BoxFit.cover,
                                      ),
                                      CustomTextAbhaya(
                                        provider.usersList[index].username,
                                        // 'Remya',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      CustomTextAbhaya(
                                        provider.usersList[index].age
                                            .toString(),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ReactionButton(
                                            onPressed: () {},
                                            height: 80,
                                            width: 80,
                                            color:
                                                AppColors.grey.withOpacity(0.1),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.amber,
                                              size: 40,
                                            ),
                                          ),
                                          Consumer<FavoriteProvider>(
                                              builder: (context, fav, child) {
                                            bool isFavorited =
                                                fav.isFavorite(index);
                                            return ReactionButton(
                                              onPressed: () {
                                                favoriteProvider
                                                    .toggleFavorite(index);

                                                favoriteProvider.addToFavorite(
                                                    provider.usersList[index]);
                                              },
                                              height: 80,
                                              width: 80,
                                              color: AppColors.grey
                                                  .withOpacity(0.1),
                                              child: Icon(
                                                Icons.favorite,
                                                color: isFavorited
                                                    ? Colors.red
                                                    : AppColors.darkPrimary
                                                        .withOpacity(0.2),
                                                size: 40,
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: provider.usersList.length,
                            itemWidth: (orientation == Orientation.portrait)
                                ? 300.0
                                : 500.0,
                            itemHeight: (orientation == Orientation.portrait)
                                ? 500.0
                                : 350.0,
                            viewportFraction: 0.8,
                            scale: 0.9,
                            layout: SwiperLayout.TINDER,
                          );
                        },
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// class HomePageScreen extends StatelessWidget {
//   const HomePageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         leading: const Padding(
//           padding: EdgeInsets.all(2.0),
//           child: CircleAvatar(
//             backgroundColor: Colors.blue,
//             radius: 2,
//           ),
//         ),
//         title: Column(
//           children: [
//             CustomText("hallo Jason!"),
//             CustomTextAbhaya("kochi,india")
//           ],
//         ),
//         actions: const [
//           Icon(
//             Icons.notifications,
//             color: Colors.grey,
//             size: 30,
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//             child: Padding(
//           padding: const EdgeInsets.only(left: 30, right: 30),
//           child: SizedBox(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 10,
//                   ),
//                   child: CustomText(
//                     "Maching Profiles",
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 500,
//                   width: 300,
//                   child: Swiper(
//                     itemBuilder: (BuildContext context, int index) {
//                       return Card(
//                           color: Colors.white,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.network(
//                                 'https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg',
//                                 height: 350,
//                                 fit: BoxFit.cover,
//                               ),
//                               CustomTextAbhaya(
//                                 'Remya',
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               CustomTextAbhaya(' Age',
//                                   fontSize: 16, fontWeight: FontWeight.w500),
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     ReactionButton(
//                                       hight: 80,
//                                       width: 80,
//                                       color: AppColors.grey.withOpacity(0.1),
//                                       child: const Icon(
//                                         Icons.close,
//                                         color: Colors.amber,
//                                         size: 40,
//                                       ),
//                                     ),
//                                     const ReactionButton(
//                                       hight: 80,
//                                       width: 80,
//                                       color: AppColors.darkPrimary,
//                                       child: Icon(
//                                         Icons.favorite,
//                                         color: AppColors.white,
//                                         size: 40,
//                                       ),
//                                     ),
//                                   ]),
//                             ],
//                           ));
//                     },
//                     itemCount: 10,
//                     itemWidth: 300.0,
//                     viewportFraction: 0.8,
//                     scale: 0.9,
//                     itemHeight: 500,
//                     layout: SwiperLayout.TINDER,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )),
//       ),
//     );
//   }
// }
