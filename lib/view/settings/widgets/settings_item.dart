import 'package:flutter/material.dart';
import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor,
  });

  final String title;
  final VoidCallback onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            BoldTextRubik(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textColor ?? Colors.black,
            ),
            const Spacer(),
            Image.asset(
              "lib/assets/images/greater_than_icon.png",
              width: media.size.width * 0.06,
              height: media.size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
