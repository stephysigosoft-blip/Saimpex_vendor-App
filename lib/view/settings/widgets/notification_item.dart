import 'package:flutter/material.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.isEnabled,
    required this.onChanged,
  });

  final String title;
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          BoldTextRubik(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          const Spacer(),
          Switch(
            value: isEnabled,
            onChanged: onChanged,
            activeColor: colorPrimary,
          ),
        ],
      ),
    );
  }
}

