import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/utils/Widgets/custom_button.dart';
import '../../controller/grocery_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/food_search_controller.dart';
import '../../controller/grocery_search_controller.dart';
import '../../controller/grocery_details_controller.dart';
import '../../generated/l10n.dart';
import '../../resources/colors.dart';

class FilterBottomSheet extends StatefulWidget {
  final bool isGrocery;
  final bool isSearch;
  final bool isDetails;
  const FilterBottomSheet({super.key, this.isGrocery = false, this.isSearch = false, this.isDetails = false});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  
  HomeController get homeController => Get.find<HomeController>();
  GroceryController get groceryController => Get.find<GroceryController>();
  FoodSearchController get foodSearchController => Get.find<FoodSearchController>();
  GrocerySearchController get grocerySearchController => Get.find<GrocerySearchController>();
  GroceryDetailsController get groceryDetailsController => Get.find<GroceryDetailsController>();
  
  dynamic get controller {
    if (widget.isDetails && widget.isGrocery) {
      return groceryDetailsController;
    } else if (widget.isSearch) {
      return widget.isGrocery ? grocerySearchController : foodSearchController;
    } else {
      return widget.isGrocery ? groceryController : homeController;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: localization.currentLocale!.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height * 0.43,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    S.of(context).filtersSorting,
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Divider(height: 1, thickness: 1, color: boxColor),
                const SizedBox(height: 15),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: widget.isDetails && widget.isGrocery
                        ? GetBuilder<GroceryDetailsController>(
                            builder: (groceryDetailsController) {
                              return _buildFilterContent(groceryDetailsController);
                            },
                          )
                        : widget.isSearch
                            ? (widget.isGrocery
                                ? GetBuilder<GrocerySearchController>(
                                    builder: (grocerySearchController) {
                                      return _buildFilterContent(grocerySearchController);
                                    },
                                  )
                                : GetBuilder<FoodSearchController>(
                                    builder: (foodSearchController) {
                                      return _buildFilterContent(foodSearchController);
                                    },
                                  ))
                            : (widget.isGrocery
                                ? GetBuilder<GroceryController>(
                                    builder: (groceryController) {
                                      return _buildFilterContent(groceryController);
                                    },
                                  )
                                : GetBuilder<HomeController>(
                                    builder: (homeController) {
                                      return _buildFilterContent(homeController);
                                    },
                                  )),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: S.of(context).clearAll,
                            backgroundColor: widget.isGrocery
                                ? yellowButtonBg
                                : buttonbg,
                            textColor: widget.isGrocery ? yellow : colorPrimary,
                            onPressed: () {
                              controller.clearAllFilters();
                              Get.back();
                            },
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: CustomButton(
                            text: S.of(context).apply,
                            backgroundColor: widget.isGrocery
                                ? yellow
                                : colorPrimary,
                            textColor: Colors.white,
                            onPressed: () {
                              // Apply filters by calling appropriate method
                              if (widget.isDetails && widget.isGrocery) {
                                groceryDetailsController.getGroceryItems();
                              } else if (widget.isSearch) {
                                if (widget.isGrocery) {
                                  grocerySearchController.getSearchResults();
                                } else {
                                  foodSearchController.getSearchResults();
                                }
                              } else {
                                if (widget.isGrocery) {
                                  groceryController.getGroceryHome();
                                } else {
                                  homeController.getHome();
                                }
                              }
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )

    );
  }

  Widget _buildFilterContent(dynamic controller) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.filterOptions.asMap().entries.map<Widget>((
            entry,
          ) {
            int rowIndex = entry.key;
            List<String> groupList = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: groupList.length,
                  itemBuilder: (context, index) {
                    String filter = groupList[index];
                    bool isSelected = controller.isFilterSelected(rowIndex, filter);

                    return GestureDetector(
                      onTap: () {
                        controller.selectFilter(rowIndex, filter);
                      },
                      child: Container(
                        margin:
                            const EdgeInsetsDirectional.only(
                              end: 8,
                            ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: isSelected
                              ? widget.isGrocery
                                    ? yellow
                                    : colorPrimary
                              : greybg,
                        ),
                        child: Center(
                          child: Text(
                            filter,
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 10),

        Center(
          child: Text(
            S.of(context).sortBy,
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),

        const SizedBox(height: 10),
        Divider(height: 1, thickness: 1, color: boxColor),
        const SizedBox(height: 15),

        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.sortOptions.length,
            itemBuilder: (context, index) {
              String option = controller.sortOptions[index];
              bool isSelected =
                  controller.selectedSort == option;

              return GestureDetector(
                onTap: () {
                  controller.selectedSort = option;
                  controller.update();
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.only(
                    end: 8,
                  ),
                  padding:
                      const EdgeInsetsDirectional.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isSelected
                        ? widget.isGrocery
                              ? yellow
                              : colorPrimary
                        : greybg,
                  ),
                  child: Center(
                    child: Text(
                      option,
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? Colors.white
                            : Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
