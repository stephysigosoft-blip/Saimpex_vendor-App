import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget NoDataWidget(
  BuildContext context,
  String title,
  String content,
  String image, {
  double? imgHeight,
  double? imgWidth,
  double? fontSize,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Image.asset(
          image,
          height: imgHeight ?? MediaQuery.of(context).size.height * 0.15,
          width: imgWidth ?? MediaQuery.of(context).size.width * 0.4,
          fit: BoxFit.contain,
        ),
        // SizedBox(height: 5),
        // const SizedBox(height: 10),
        Text(
          title,
          style: GoogleFonts.rubik(
            fontSize: fontSize ?? 12,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        // const SizedBox(height: 8),
        // Text(
        //   content,
        //   style: GoogleFonts.rubik(
        //     fontSize: 14,
        //     fontWeight: FontWeight.w400,
        //     color: Colors.grey[600],
        //   ),
        //   textAlign: TextAlign.center,
        // ),
      ],
    ),
  );
}
