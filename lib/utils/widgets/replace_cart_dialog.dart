import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/controller/restaurant_details_controller.dart';
import '../../controller/grocery_details_controller.dart';
import '../../generated/l10n.dart';
import '../../resources/colors.dart';

class ReplaceCartDialog extends StatelessWidget {
  ReplaceCartDialog({
    super.key,
    this.restaurant1,
    this.restaurant2,
    this.isGrocery = false,
  });

  final FlutterLocalization localization = FlutterLocalization.instance;
  final String? restaurant1;
  final String? restaurant2;
  final bool? isGrocery;

  final RestaurantDetailsController controller =
      Get.isRegistered<RestaurantDetailsController>()
      ? Get.find<RestaurantDetailsController>()
      : Get.put(RestaurantDetailsController());
  @override
  Widget build(BuildContext context) {
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
                    S.of(context).replaceCartItem,
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
                S.of(context).yourCartHasDishesFrom +
                    " " +
                    restaurant1! +
                    S.of(context).doYouWantToReplaceThemWithDishesFrom +
                    " " +
                    restaurant2! +
                    "?",
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
                          color: isGrocery == true ? yellowButtonBg : buttonbg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).no,
                            style: GoogleFonts.rubik(
                              color: isGrocery == true ? yellow : Colors.red,
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
                        if (isGrocery == true) {
                          GroceryDetailsController controller = Get.put(
                            GroceryDetailsController(),
                          );
                          controller.replaceCart(context, "replace");
                        } else {
                          controller.replaceCart(context, "replace");
                        }
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isGrocery == true ? yellow : colorPrimary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).replace,
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
