import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/cart_controller.dart';
import '../../generated/l10n.dart';
import '../../resources/colors.dart';

class PlaceOrderConfirm extends StatelessWidget {
  const PlaceOrderConfirm({super.key, required this.route});
  final String route;
  static final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    bool buttonPressed = false;

    return Directionality(
      textDirection: localization.currentLocale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Dialog(
        backgroundColor: Colors.transparent, // for dimmed background
        insetPadding: const EdgeInsets.all(24),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).placeOrder,
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Text(
                S.of(context).areYouSureYouWantToPlaceThisOrder,
                style: GoogleFonts.rubik(
                  fontSize: 13,
                  color: Colors.black,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  // NO BUTTON
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: route == "restaurant"
                              ? buttonbg
                              : yellowButtonBg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).no,
                            style: GoogleFonts.rubik(
                              color: route == "restaurant"
                                  ? Colors.red
                                  : yellow,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (buttonPressed == false) {
                          buttonPressed = true;
                          cartController.checkout(
                            context,
                            cartController.data!.redeemedAmount.toString(),
                            route,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: route == "restaurant" ? colorPrimary : yellow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).yes,
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
