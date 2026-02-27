import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBox extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color boxColor;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool showSearchIcon;

   CustomSearchBox({
    super.key,
    required this.hintText,
    required this.boxColor,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.showSearchIcon = false,
  });
  final FlutterLocalization localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
      localization.currentLocale!.languageCode.toString() == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        style: GoogleFonts.rubik(
          fontSize: 14,
          color: Colors.black,
            fontWeight: FontWeight.w400
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.rubik(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          filled: true,
          fillColor: boxColor,
          prefixIcon: showSearchIcon
              ? Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 6,
              width: 6,
              child: Image.asset(
                'lib/assets/images/search.png',
                fit: BoxFit.contain,
              ),
            ),
          )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: boxColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: boxColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  BorderSide(color: boxColor),
          ),
        ),
      ),
    );
  }
}
