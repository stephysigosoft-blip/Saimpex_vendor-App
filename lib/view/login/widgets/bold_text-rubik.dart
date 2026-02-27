import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoldTextRubik extends StatelessWidget {
  const BoldTextRubik({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.textAlign = TextAlign.center,
    this.decoration = TextDecoration.none,
  });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final TextDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.rubik(
        decoration: decoration,
        textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}
