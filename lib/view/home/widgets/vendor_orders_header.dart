import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VendorOrdersHeader extends StatelessWidget {
  const VendorOrdersHeader({super.key, required this.horizontalPadding});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ORDERS",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F1F1F),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "View All",
              style: GoogleFonts.rubik(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFF5216),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
