import 'package:flutter/material.dart';
import 'package:lifepartner/utils/app_route/app_string.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';
import 'package:lifepartner/view/favorite/favorite_provider.dart';
import 'package:lifepartner/widgets/custom_app_bar.dart';
import 'package:lifepartner/widgets/custom_images.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final staticProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomText(
          "Favorite ",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<FavoriteProvider>(builder: (context, fav, child) {
          return GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(), // Add this line
            itemCount: fav.favoriteitem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: screenWidth / (screenWidth / 1.2),
              crossAxisSpacing: 5,
              crossAxisCount: isLandscape ? 3 : 2,
              mainAxisSpacing: 5,
              mainAxisExtent: 220,
            ),
            itemBuilder: (context, index) {
              var item = fav.favoriteitem[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedImageLoader(
                      imageUrl:
                          // 'https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg',
                          item.dataList!.imageUrl.isEmpty
                              ? placeHolder
                              : item.dataList!.imageUrl,
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
                            item.dataList!.username,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          GestureDetector(
                            onTap: () {
                              staticProvider.removeFavoritetem(index);
                            },
                            child: const Icon(
                              Icons.favorite,
                              size: 30,
                              color: AppColors.darkPrimary,
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomTextAbhaya(
                      item.dataList!.age.toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
