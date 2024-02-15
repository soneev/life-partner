import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  // final bool validator;
//  final String value;
  final String hint;
  final String hint2;
  final int maxLength;
  final int maxLines;
  final bool enabled;
  final bool addBorder;
  final bool onlyEnglish;
  final double height;
  // bool isThisFieldRequired = false;
  //  VoidCallback? onOnce;
  // final ValueChanged<String>? onOnce;
  final String? Function(String?)? validator;
  final void Function(String?)? onchaged;

  bool hasBeenUsed = false;

  CustomTextField({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.controller,
    // this.validator = false,
    this.obscureText = false,
    this.maxLength = 30,
    this.maxLines = 1,
    this.enabled = true,
    this.hint2 = '',
    this.onlyEnglish = false,
    //this.value = '',
    required this.hint,
    this.addBorder = true,
    this.height = 1,
    // required this.isThisFieldRequired,
    // this.onOnce,
    this.validator,
    this.onchaged,
    // this.onOnce
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      //  (value) {
      //   if (isThisFieldRequired) {
      //     if (value!.isEmpty) {
      //       return 'Field required';
      //     }
      //   }
      // },
      onChanged: onchaged,
      //  (value) {
      //   if (onOnce != null && !hasBeenUsed && value.isNotEmpty) {
      //     hasBeenUsed = true;
      //     onOnce!(value);
      //   }
      // },
      style: GoogleFonts.inter(color: const Color.fromRGBO(37, 37, 37, 1)),
      obscureText: obscureText,
      enabled: enabled,
      keyboardType: keyboardType,
      enableInteractiveSelection: true,
      controller: controller,
      showCursor: true,
      maxLength: maxLength,
      autofocus: false,
      maxLines: maxLines,
      cursorColor: Colors.black,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hint,
        counterText: "",
        hintStyle: const TextStyle(
          fontFamily: 'Abel',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.275,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextFieldInt extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  // final bool validator;
//  final String value;
  final String hint;
  final String hint2;
  final int maxLength;
  final int maxLines;
  final bool enabled;
  final bool addBorder;
  final bool onlyEnglish;
  final double height;
  // bool isThisFieldRequired = false;
  //  VoidCallback? onOnce;
  // final ValueChanged<String>? onOnce;
  final String? Function(String?)? validator;
  final void Function(String?)? onchaged;

  bool hasBeenUsed = false;

  CustomTextFieldInt({
    super.key,
    this.keyboardType = TextInputType.number,
    required this.controller,
    // this.validator = false,
    this.obscureText = false,
    this.maxLength = 30,
    this.maxLines = 1,
    this.enabled = true,
    this.hint2 = '',
    this.onlyEnglish = false,
    //this.value = '',
    required this.hint,
    this.addBorder = true,
    this.height = 1,
    // required this.isThisFieldRequired,
    // this.onOnce,
    this.validator,
    this.onchaged,
    // this.onOnce
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      //  (value) {
      //   if (isThisFieldRequired) {
      //     if (value!.isEmpty) {
      //       return 'Field required';
      //     }
      //   }
      // },
      onChanged: onchaged,
      //  (value) {
      //   if (onOnce != null && !hasBeenUsed && value.isNotEmpty) {
      //     hasBeenUsed = true;
      //     onOnce!(value);
      //   }
      // },
      style: GoogleFonts.inter(color: const Color.fromRGBO(37, 37, 37, 1)),
      obscureText: obscureText,
      enabled: enabled,
      keyboardType: keyboardType,
      enableInteractiveSelection: true,
      controller: controller,
      showCursor: true,
      maxLength: maxLength,
      autofocus: false,
      maxLines: maxLines,
      cursorColor: Colors.black,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hint,
        counterText: "",
        hintStyle: const TextStyle(
          fontFamily: 'Abel',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.275,
          color: Colors.grey,
        ),
      ),
    );
  }
}
