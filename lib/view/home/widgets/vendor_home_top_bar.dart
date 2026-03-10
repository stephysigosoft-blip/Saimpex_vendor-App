import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/view/notifications/notifications.dart';

class VendorHomeTopBar extends StatelessWidget {
  const VendorHomeTopBar({
    super.key,
    required this.horizontalPadding,
  });

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset('lib/assets/images/logo.png', height: 50),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Welcome to Saimpex Vendor!",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F1F1F),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(() => const Notifications()),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4),
                ],
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.black87,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
