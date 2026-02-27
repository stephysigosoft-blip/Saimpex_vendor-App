import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/controller/restaurant_details_controller.dart';
import 'package:saimpex_vendor/view/login/login.dart';
import 'package:saimpex_vendor/view/login/widgets/login_to_continue_alert_dialogue.dart';
import '../../config/api_configs.dart';
import '../../generated/l10n.dart';
import '../../model/restaurant_items_model.dart';
import '../../resources/colors.dart';
import '../../view/restaurant/item_customization_bottom_sheet.dart';
import '../Utils.dart';
import 'replace_cart_dialog.dart';

class FoodProductItem extends StatefulWidget {
  final MenuItem item;
  final CartInfo? cartItems;

  const FoodProductItem({
    super.key,
    required this.item,
    required this.cartItems,
  });

  @override
  State<FoodProductItem> createState() => _FoodProductItemState();
}

class _FoodProductItemState extends State<FoodProductItem> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: localization.currentLocale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Stack(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 8,
                  ), // extra bottom padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // IMAGE + OFFER
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              color: Colors.grey.shade300,
                              child: CachedNetworkImage(
                                imageUrl:
                                    ApiConfigs.IMAGE_URL +
                                    widget.item.image.toString(),
                                height: 100,
                                fit: BoxFit.contain,
                                width: double.infinity,
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                      'lib/assets/images/logo.png',
                                      fit: BoxFit.contain,
                                    ),
                              ),
                            ),
                          ),

                          if (widget.item.offerPercentage.toString() !=
                                  "null" &&
                              widget.item.offerPercentage.toString() != "" &&
                              widget.item.offerPercentage.toString() != "0")
                            widget.item.hasStock == true
                                ? Positioned(
                                    top: 4,
                                    left: 4,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'lib/assets/images/offer.png',
                                            height: 18,
                                            width: 18,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            S.of(context).upto +
                                                " " +
                                                widget.item.offerPercentage
                                                    .toString()! +
                                                "% " +
                                                S.of(context).off,
                                            style: GoogleFonts.rubik(
                                              fontSize: 11,
                                              color: green,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.currentLocale!.languageCode
                                          .toString() ==
                                      'en'
                                  ? widget.item.nameEn.toString()
                                  : localization.currentLocale!.languageCode
                                            .toString() ==
                                        "ar"
                                  ? widget.item.nameAr ??
                                        widget.item.nameEn.toString()
                                  : widget.item.nameFr ??
                                        widget.item.nameEn.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 3,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                widget.item.isVeg.toString() == "1"
                                    ? "lib/assets/images/green_dot.png"
                                    : "lib/assets/images/red_dot.png",
                                height: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 3),
                      widget.item.ratingCount == 0
                          ? Container()
                          : Row(
                              children: [
                                Icon(Icons.star, size: 16, color: starColor),
                                const SizedBox(width: 4),
                                Text(
                                  double.parse(
                                    widget.item.rating.toString(),
                                  ).toStringAsFixed(1),
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  " (${formatRatingCount(widget.item.ratingCount)} ${S.of(context).reviews})",
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),

                      const SizedBox(height: 6),

                      widget.item.offerPercentage.toString() == "0" ||
                              widget.item.offerPercentage.toString() ==
                                  "null" ||
                              widget.item.offerPercentage.toString() == ""
                          ? Text(
                              "${widget.item.price} MRU",
                              style: GoogleFonts.rubik(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Row(
                              children: [
                                Text(
                                  "${widget.item.discountPrice} MRU",
                                  style: GoogleFonts.rubik(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    widget.item.price.toString() + " MRU",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -0,
                right: 10,
                child: InkWell(
                  onTap: () async {
                    var token = await getSavedObject("token");
                    if (token.toString() == "null" || token.toString() == "") {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black54,
                        builder: (context) => Dialog(
                          insetPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.1,
                            vertical: MediaQuery.of(context).size.height * 0.25,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: LoginToContinueAlertDialogue(
                            onCancel: () {
                              Navigator.pop(context);
                            },
                            onDelete: () {
                              Navigator.pop(context);
                              Get.offAll(LoginScreen());
                            },
                          ),
                        ),
                      );
                    } else {
                      if (widget.cartItems != null &&
                          (widget.cartItems!.vendorId.toString() !=
                              widget.item.restaurantId.toString())) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => ReplaceCartDialog(
                            restaurant1: widget.cartItems!.vendorName
                                .toString(),
                            restaurant2: widget.item.restaurantName.toString(),
                            isGrocery: false,
                          ),
                        );
                      } else {
                        if (widget.item.hasStock == true) {
                          RestaurantDetailsController controller =
                              Get.find<RestaurantDetailsController>();
                          controller.selectedPortion = 0;
                          controller.selectedVariantPrice = 0;
                          controller.qty = 1;
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            builder: (context) {
                              return SafeArea(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(24),
                                        ),
                                      ),
                                      padding: EdgeInsets.only(top: 20),
                                      child: ItemCustomizationBottomSheet(
                                        data: widget.item.items,
                                        productName:
                                            localization
                                                    .currentLocale!
                                                    .languageCode
                                                    .toString() ==
                                                'en'
                                            ? widget.item.nameEn.toString()
                                            : localization
                                                      .currentLocale!
                                                      .languageCode
                                                      .toString() ==
                                                  "ar"
                                            ? widget.item.nameAr ??
                                                  widget.item.nameEn.toString()
                                            : widget.item.nameFr ??
                                                  widget.item.nameEn.toString(),
                                        image: widget.item.image.toString(),
                                      ),
                                    ),

                                    Positioned(
                                      top: -50,
                                      right:
                                          MediaQuery.of(context).size.width /
                                              2 -
                                          20,
                                      child: GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.65,
                                            ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.15,
                                                ),
                                                blurRadius: 6,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          showToast(context, S.of(context).productOutOfStock);
                        }
                      }
                    }
                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 8,
                      ),
                      child: Text(
                        S.of(context).add,
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: colorPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (widget.item.hasStock == false)
            Positioned.fill(
              child: Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 15, start: 15),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        S.of(context).outOfStock,
                        style: GoogleFonts.rubik(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 5, start: 15),
                      child: Text(
                        S.of(context).availableAt +
                            " " +
                            convertToAmPm(
                              widget
                                  .item
                                  .availabilityTiming!
                                  .timings![0]
                                  .openTime
                                  .toString(),
                            ) +
                            " " +
                            S.of(context).today,
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
