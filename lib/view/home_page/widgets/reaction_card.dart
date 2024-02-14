import 'package:flutter/material.dart';
import 'package:lifepartner/utils/colors/app_colors.dart';

class ReactionButton extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final Function()? onPressed;

  const ReactionButton(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.color,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: height ?? 80,
          width: width ?? 80,
          decoration: BoxDecoration(
              color: color ?? AppColors.white, shape: BoxShape.circle),
          child: child),
    );
  }
}
