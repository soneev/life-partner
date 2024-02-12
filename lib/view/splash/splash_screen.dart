import 'package:flutter/material.dart';
import 'package:lifepartner/widgets/custom_images.dart';
import 'package:lifepartner/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double getSmallDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 2 / 3;

    double getBigDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 7 / 8;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              right: -getSmallDiameter(context) / 3,
              top: -getSmallDiameter(context) / 3,
              child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3E9EE),
                ),
              ),
            ),
            Positioned(
              left: -getBigDiameter(context) / 4,
              top: -getBigDiameter(context) / 4,
              child: Container(
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffC6368B),
                      Color(0xffF39CCF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -getBigDiameter(context) / 2,
              bottom: -getBigDiameter(context) / 2,
              child: Container(
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3E9EE),
                ),
              ),
            ),
            SizedBox(
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomPngImage(
                    imageName: "logo",
                    width: 149,
                    height: 149,
                  ),
                  CustomText(
                    "Life Partner",
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    fontheight: 1.275,
                    color: const Color(0xff313131),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
