import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/config/api_configs.dart';
import 'package:saimpex_vendor/utils/Utils.dart';
import 'package:saimpex_vendor/view/chat/chat_details.dart';
import 'package:saimpex_vendor/view/login/login.dart';
import 'package:saimpex_vendor/view/login/widgets/login_to_continue_alert_dialogue.dart';
import 'package:saimpex_vendor/view/restaurant/restaurant_details_with_items.dart';

import '../../controller/restaurant_details_controller.dart';
import '../../generated/l10n.dart';
import '../../utils/widgets/no_data_widget.dart';
import '../../utils/widgets/restaurant_details_widget.dart';
import '../shimmer_loading/shimmer_category_item.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({
    super.key,
    required this.restaurantId,
    required this.name,
    required this.rating,
    required this.preparationTime,
    required this.distance,
    required this.offer,
  });

  final String restaurantId;
  final String name;
  final String rating;
  final String preparationTime;
  final String distance;
  final String offer;

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  bool _hasCalledApi = false;

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;

    return Directionality(
      textDirection: localization.currentLocale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

        body: GetBuilder<RestaurantDetailsController>(
          init: RestaurantDetailsController(),
          builder: (controller) {
            // Call API once when screen loads
            if (!_hasCalledApi) {
              _hasCalledApi = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  controller.fetchCategories(context, widget.restaurantId, "");
                }
              });
            }
            return Stack(
              children: [
                // BACKGROUND IMAGE
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/assets/images/resbg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // ACTUAL CONTENT
                _buildContent(
                  context,
                  widget.restaurantId,
                  widget.name,
                  widget.distance,
                  widget.rating,
                  widget.preparationTime,
                  widget.offer,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildContent(
  BuildContext context,
  String restaurantId,
  String name,
  String distance,
  String rating,
  String preparationTime,
  String offer,
) {
  return GetBuilder<RestaurantDetailsController>(
    init: RestaurantDetailsController(),
    builder: (controller) {
      return Directionality(
        textDirection:
            controller.localization.currentLocale!.languageCode == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RestaurantDetailsWidget(
                  restaurantName: name,
                  rating: rating,
                  time: preparationTime,
                  distance: distance,
                  offerText: offer,
                  onChatNow: () async {
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
                      Get.to(ChatDetails(vendorId: int.parse(restaurantId)));
                    }
                  },
                ),
                const SizedBox(height: 15),

                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: controller.searchController,
                    onChanged: (value) {
                      controller.fetchCategories(context, restaurantId, value);
                    },
                    style: GoogleFonts.rubik(fontSize: 15),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: S.of(context).searchCategories,
                      hintStyle: GoogleFonts.rubik(
                        fontSize: 13,
                        color: Colors.grey,
                      ),

                      // Remove borders
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          height: 6,
                          width: 6,
                          child: Image.asset(
                            'lib/assets/images/search.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: Text(
                    S.of(context).pickYourFavouritesAndStartYourFeast,
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    'lib/assets/images/line.png',
                    height: 15,
                    width: 70,
                  ),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: controller.isLoadingCategories
                      ? _buildShimmerGrid()
                      : controller.categoriesList.isEmpty
                      ? NoDataWidget(
                          context,
                          S.of(context).noCategoriesFound,
                          S.of(context).trySearchingWithDifferentKeywords,
                          "lib/assets/images/nodata.png",
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: controller.categoriesList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.8,
                              ),
                          itemBuilder: (context, index) {
                            var item = controller.categoriesList[index];

                            return InkWell(
                              onTap: () {
                                Get.to(
                                  RestaurantDetailsWithItems(
                                    categoryId: item.categoryId.toString(),
                                    restaurantId: restaurantId,
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child:
                                        item.image != null &&
                                            item.image!.isNotEmpty
                                        ? CachedNetworkImage(
                                            height: 60,
                                            width: 70,
                                            imageUrl:
                                                ApiConfigs.IMAGE_URL +
                                                item.image.toString(),
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (
                                                  context,
                                                  url,
                                                  error,
                                                ) => Image.asset(
                                                  'lib/assets/images/logo.png',
                                                  fit: BoxFit.cover,
                                                ),
                                          )
                                        : Image.asset(
                                            'lib/assets/images/logo.png',
                                            height: 60,
                                            width: 70,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    controller
                                                .localization
                                                .currentLocale!
                                                .languageCode
                                                .toString() ==
                                            "en"
                                        ? item.nameEn.toString()
                                        : controller
                                                  .localization
                                                  .currentLocale!
                                                  .languageCode
                                                  .toString() ==
                                              "ar"
                                        ? item.nameAr ?? item.nameEn.toString()
                                        : item.nameFr ?? item.nameEn.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.rubik(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// Shimmer effect widget for loading categories
Widget _buildShimmerGrid() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const AlwaysScrollableScrollPhysics(),
    itemCount: 16,
    // Show 8 shimmer items
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 0.8,
    ),
    itemBuilder: (context, index) {
      return ShimmerCategoryItem();
    },
  );
}

