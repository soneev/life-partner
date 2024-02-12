import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.amber,
                        child: Column(
                          children: [
                            Image.network(
                                'https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg'),
                            Text('Name, Age'),
                            Text('Job Title'),
                          ],
                        ),
                      );
                    },
                    pagination: const SwiperPagination(
                        builder: SwiperPagination.fraction),
                    itemCount: 10,
                    itemWidth: 300.0,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemHeight: 300,
                    layout: SwiperLayout.TINDER,
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
