import 'package:flutter/material.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

import '../../../generated/l10n.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onTap;

  const ContinueButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.06,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: BoldTextRubik(
            text: S.of(context).continueText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
