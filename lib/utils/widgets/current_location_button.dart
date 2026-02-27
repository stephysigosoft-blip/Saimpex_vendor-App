import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../generated/l10n.dart';

class CurrentLocationButton extends StatelessWidget {
  final VoidCallback onTap;

   CurrentLocationButton({super.key, required this.onTap});
  final FlutterLocalization localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
      localization.currentLocale!.languageCode.toString() == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * 0.28,
            end: MediaQuery.of(context).size.width * 0.28,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.my_location,
                color: Color(0xFFFF5216), // Orange icon
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).currentLocation,
                style: GoogleFonts.rubik(
                  fontSize: 13,
                  color: Colors.black.withAlpha(90),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
