import 'package:flutter/material.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

class LoginOrSignUpTextWidget extends StatelessWidget {
  const LoginOrSignUpTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: grey500Opacity)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BoldTextRubik(
            text: text,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: grey500Opacity,
          ),
        ),
        Expanded(child: Container(height: 1, color: grey500Opacity)),
      ],
    );
  }
}
