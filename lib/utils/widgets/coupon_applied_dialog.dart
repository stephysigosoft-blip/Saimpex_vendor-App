import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../generated/l10n.dart';

class CouponAppliedDialog extends StatelessWidget {
  final String couponCode;
  final String savedAmount;
  final String route;

  const CouponAppliedDialog({
    super.key,
    required this.couponCode,
    required this.savedAmount,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            // Close button
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Get.back(),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
            // Content
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Orange circle with checkmark
                route.toString() == "restaurant"
                    ? Image.asset(
                        "lib/assets/images/success.png",
                        height: 30,
                        width: 30,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        "lib/assets/images/checkout_succes.png",
                        fit: BoxFit.contain,
                        height: 50,
                        width: 50,
                      ),
                const SizedBox(height: 10),
                // Coupon code applied text
                Text(
                  "'$couponCode'" + " " + S.of(context).applied,
                  style: GoogleFonts.rubik(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 12),
                // Saved amount text
                Text(
                  S.of(context).youSaved +
                      " " +
                      savedAmount +
                      " " +
                      S.of(context).mruOnThisOrder,
                  style: GoogleFonts.rubik(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void show(
    BuildContext context,
    String couponCode,
    String savedAmount,
    String route,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CouponAppliedDialog(
          couponCode: couponCode,
          savedAmount: savedAmount,
          route: route,
        );
      },
    );
  }
}
