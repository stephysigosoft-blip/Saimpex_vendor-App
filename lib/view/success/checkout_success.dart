import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/utils/widgets/custom_app_bar.dart';
import 'package:saimpex_vendor/utils/widgets/custom_button.dart';
import 'package:saimpex_vendor/view/home/home.dart';
import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

import '../../generated/l10n.dart';

class CheckoutSuccess extends StatelessWidget {
  CheckoutSuccess({
    super.key,
    this.pointsEarned = "0",
    this.onViewOrders,
    required this.route,
  });

  final String pointsEarned;
  final VoidCallback? onViewOrders;
  final String route;
  final FlutterLocalization localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Directionality(
      textDirection: localization.currentLocale!.languageCode.toString() == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: '',
          onTap: () {
            Get.offAll(Home());
          },
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: media.size.height * 0.10),
              SizedBox(
                width: media.size.width * 0.35,
                height: media.size.height * 0.20,
                child: ClipOval(
                  child: route.toString() == "restaurant"
                      ? Image.asset(
                          "lib/assets/images/success.png",
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          "lib/assets/images/checkout_succes.png",
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              SizedBox(height: media.size.height * 0.04),
              BoldTextRubik(
                text: S.of(context).orderPlacedSuccessfully,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
                textAlign: TextAlign.center,
              ),
              SizedBox(height: media.size.height * 0.02),
              pointsEarned == "0" ||
                      pointsEarned == "null" ||
                      pointsEarned == ""
                  ? Container()
                  : BoldTextRubik(
                      text:
                          S.of(context).congratulationsYouveEarned +
                          ' $pointsEarned ' +
                          S.of(context).points,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed:
                        onViewOrders ??
                        () {
                          //Get.offAll(MyOrders(route:"checkout"));
                        },
                    text: S.of(context).viewOrders,
                    backgroundColor: route.toString() == "restaurant"
                        ? colorPrimary
                        : yellow,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
