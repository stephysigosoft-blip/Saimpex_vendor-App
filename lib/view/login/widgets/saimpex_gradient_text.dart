import 'package:flutter/material.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

class SaimpexGradientText extends StatelessWidget {
  const SaimpexGradientText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [yellow, colorPrimary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: BoldTextRubik(
        text: text,
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
