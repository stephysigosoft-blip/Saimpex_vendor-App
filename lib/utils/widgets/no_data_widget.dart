import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget NoDataWidget(
  BuildContext context,
  String title,
  String content,
  String image,
) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.9,
        ),
        SizedBox(height: 20,),
        Text(
          title,
          style: GoogleFonts.rubik(
            fontSize: 20,
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
