import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String? text;
  double? fontSize;

  TextAlign? textAlign;
  Color? color;
  bool? underline;
  FontWeight? fontWeight;
  int? maxLines;
  double? fontheight;
  String? fontFamily;

  CustomText(this.text,
      {super.key,
      this.fontSize,
      this.textAlign,
      this.color,
      this.fontWeight,
      this.underline = false,
      this.maxLines,
      this.fontheight,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: GoogleFonts.abel(
        height: fontheight ?? 1,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
        color: color ?? const Color(0xff010101),
        decoration:
            underline! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextAbhaya extends StatelessWidget {
  String? text;
  double? fontSize;

  TextAlign? textAlign;
  Color? color;
  bool? underline;
  FontWeight? fontWeight;
  int? maxLines = 2;
  double? fontheight;
  String? fontFamily;

  CustomTextAbhaya(this.text,
      {super.key,
      this.fontSize,
      this.textAlign,
      this.color,
      this.fontWeight,
      this.underline = false,
      this.maxLines = 2,
      this.fontheight,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: GoogleFonts.abhayaLibre(
        height: fontheight ?? 1,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
        color: color ?? const Color(0xff010101),
        decoration: underline! ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
