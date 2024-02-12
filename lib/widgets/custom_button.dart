import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.text,
      this.onPressed,
      this.textColor,
      this.child});
  final double? width, height;
  final Color? color, textColor;
  final String? text;
  final Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: width ?? 1.sw,
        height: height ?? 50,
        color: color ?? AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: child ??
            CustomText(
              text,
              color: textColor ?? AppColors.black,
            ),
      ),
    );
  }
}
