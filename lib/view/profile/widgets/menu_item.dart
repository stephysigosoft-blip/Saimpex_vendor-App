import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
    required this.media,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final MediaQueryData media;

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;
    final bool isRTL = localization.currentLocale?.languageCode == "ar";

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: media.size.width * 0.05,
          vertical: media.size.height * 0.01,
        ),
        child: Row(
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Image.asset(
              icon,
              width: media.size.width * 0.07,
              height: media.size.height * 0.04,
            ),
            SizedBox(width: media.size.width * 0.05),
            Expanded(
              child: BoldTextRubik(
                text: title,
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: textColor ?? Colors.black,
                textAlign: TextAlign.start,
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(isRTL ? -1.0 : 1.0, 1.0),
              child: Image.asset(
                "lib/assets/images/greater_than_icon.png",
                width: media.size.width * 0.06,
                height: media.size.height * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
