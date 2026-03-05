import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saimpex_vendor/configs/ApiConfigs.dart';
import 'package:saimpex_vendor/configs/Dioclient.dart';
import 'package:saimpex_vendor/generated/l10n.dart';
import 'package:saimpex_vendor/model/settings_model.dart';
import 'package:saimpex_vendor/view/login/login.dart';
import 'package:saimpex_vendor/view/settings/maintenance.dart';
import 'package:saimpex_vendor/view/settings/need_an_update.dart';

import '../Utils/utils.dart';
import '../model/home_model.dart';
// import 'grocery_controller.dart';
// import 'cart_controller.dart';
// import 'chat_controller.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  int selectedcurrentIndex = 0;
  final FlutterLocalization localization = FlutterLocalization.instance;

  String selectedLocation = '';
  String userName = '';
  TextEditingController searchController = TextEditingController();

  // Home API data
  List<SliderItem> sliderList = [];
  List<Restaurant> restaurantList = [];
  HomeModel? homeData;
  bool _hasNextPage = true;
  bool isFirstLoadRunning = true;
  bool isLoadMoreRunning = false;
  ScrollController scrollController = ScrollController();

  String offers = "";
  String rating = "";
  String priceRange = "";
  String selectedSort = "";

  // Selected filters per row (one selection per row)
  String? selectedOfferFilter; // "Offers"
  String?
  selectedRatingFilter; // "Ratings 4.5+", "Ratings 4.0+", "Ratings 3.5+"
  String?
  selectedPriceRangeFilter; // "Under 200 MRU", "500 - 900 MRU", "Above 500 MRU"

  String veg = "";
  String nonVeg = "";
  bool badge = false;

  @override
  void onInit() {
    initAsync();
    super.onInit();
  }

  Future<void> initAsync() async {
    scrollController = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final List<String> filterCategories = ['Filter', 'Non Veg', 'Veg', 'Offers'];

  Future<void> onTabTapped(int index, BuildContext context) async {
    selectedcurrentIndex = index;
    update();

    // Load corresponding API based on selected tab
    try {
      switch (index) {
        case 0: // Home tab
          await getHome();
          break;
        case 1: // My Restaurant tab
          // Reload restaurant data if needed
          break;
        case 2: // Chat tab
          // Reload chat data if needed
          break;
        case 3: // Settings tab
          // Reload settings/profile data if needed
          break;
      }
    } catch (e) {
      debugPrint("Error loading data for tab $index: $e");
    }
  }

  List<List<String>> filterOptions = [
    ["Offers"],
    ["Ratings 4.5+", "Ratings 4.0+", "Ratings 3.5+"],
    ["Under 200 MRU", "500 - 900 MRU", "Above 500 MRU"],
  ];

  void selectFilter(int rowIndex, String filterValue) {
    if (rowIndex == 0) {
      // Offers row
      if (selectedOfferFilter == filterValue) {
        // Deselect if already selected
        selectedOfferFilter = null;
        offers = "";
      } else {
        selectedOfferFilter = filterValue;
        offers = "1";
      }
    } else if (rowIndex == 1) {
      // Ratings row
      if (selectedRatingFilter == filterValue) {
        // Deselect if already selected
        selectedRatingFilter = null;
        rating = "";
      } else {
        selectedRatingFilter = filterValue;
        // Map rating string to API value
        if (filterValue == "Ratings 4.5+") {
          rating = "4.5";
        } else if (filterValue == "Ratings 4.0+") {
          rating = "4";
        } else if (filterValue == "Ratings 3.5+") {
          rating = "3.5";
        }
      }
    } else if (rowIndex == 2) {
      // Price range row
      if (selectedPriceRangeFilter == filterValue) {
        // Deselect if already selected
        selectedPriceRangeFilter = null;
        priceRange = "";
      } else {
        selectedPriceRangeFilter = filterValue;
        // Map price range string to API value
        if (filterValue == "Under 200 MRU") {
          priceRange = "under_200";
        } else if (filterValue == "500 - 900 MRU") {
          priceRange = "500_900";
        } else if (filterValue == "Above 500 MRU") {
          priceRange = "above_500";
        }
      }
    }
    update();
  }

  bool isFilterSelected(int rowIndex, String filterValue) {
    if (rowIndex == 0) {
      return selectedOfferFilter == filterValue;
    } else if (rowIndex == 1) {
      return selectedRatingFilter == filterValue;
    } else if (rowIndex == 2) {
      return selectedPriceRangeFilter == filterValue;
    }
    return false;
  }

  void clearAllFilters() {
    selectedOfferFilter = null;
    selectedRatingFilter = null;
    selectedPriceRangeFilter = null;
    offers = "";
    rating = "";
    priceRange = "";
    veg = "";
    nonVeg = "";
    selectedSort = "";
    getHome();
  }

  // Clear specific filters
  void clearOffersFilter() {
    offers = "";
    selectedOfferFilter = null;
    getHome();
  }

  void clearVegFilter() {
    veg = "";
    getHome();
  }

  void clearNonVegFilter() {
    nonVeg = "";
    getHome();
  }

  // Check if any bottom sheet filters are active (rating, priceRange, offers from bottom sheet)
  bool hasBottomSheetFilters() {
    return rating.isNotEmpty ||
        priceRange.isNotEmpty ||
        selectedOfferFilter != null;
  }

  // Select offers from horizontal list (should also select in bottom sheet)
  void selectOffersFromList() {
    offers = "1";
    selectedOfferFilter = "Offers";
    getHome();
  }

  List<String> sortOptions = [
    "Relevance",
    "Delivery Time",
    "Cost: Low to High",
    "Cost: High to Low",
  ];

  Future<void> fetchLocation() async {
    var token = await getSavedObject("token");
    dynamic count = await getSavedObject("noti_count");
    if (count != null) {
      if (count == "1") {
        badge = true;
      } else {
        badge = false;
      }
    } else {
      badge = false;
    }
    if (token.toString() == "null" || token.toString() == "") {
      userName = "Guest";
      var address = await getSavedObject("address");
      selectedLocation = address?.toString() ?? "";
    } else {
      var name = await getSavedObject("name");
      userName = name?.toString() ?? "";
      var address = await getSavedObject("address");
      selectedLocation = address?.toString() ?? "";
    }
    update();
  }

  Future<void> settings(BuildContext context) async {
    try {
      // Mock settings success
      await Future.delayed(const Duration(seconds: 1));
      getHome();
    } catch (error) {
      debugPrint("maintenance Mock Error: $error");
    }
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        scrollController.position.extentAfter < 300) {
      isLoadMoreRunning = true;
      update();

      await Future.delayed(const Duration(seconds: 1));
      // Mock: No more pages in mock mode to keep it simple
      _hasNextPage = false;

      isLoadMoreRunning = false;
      update();
    }
  }

  Future<void> getHome() async {
    try {
      isFirstLoadRunning = true;
      update();

      await Future.delayed(const Duration(seconds: 1));

      // Mock data setup
      sliderList = []; // Add mock items if needed for UI testing
      restaurantList = []; // Add mock items if needed for UI testing

      debugPrint("Mock home data loaded");
    } catch (e) {
      debugPrint('Mock Home Error: $e');
    }
    isFirstLoadRunning = false;
    update();
  }

  Future<HomeModel?> getHomeApi(int limit, int page) async {
    return null; // Neutralized
  }

  Future<void> sendBarcode(BuildContext context, String barcode) async {
    try {
      showLoadingDialog(context);
      await Future.delayed(const Duration(seconds: 1));
      if (context.mounted) {
        Get.back();
        showToast(context, "Barcode scanned successfully (Mock)");
      }
    } catch (error) {
      debugPrint("Barcode Mock Error: $error");
      if (context.mounted) {
        Get.back();
        showToast(context, error.toString());
      }
    }
  }

  Future<void> maintenance(BuildContext context) async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String buildNumber = packageInfo.version;
      final response = await DioClient().get(ApiEndPoints.settings);
      SettingsModel model = SettingsModel.fromJson(response.data);
      debugPrint("settings model: $response.data");
      debugPrint("current version delivery: $buildNumber");
      if (model.status == true) {
        if (Platform.isAndroid &&
            model.data?.settings?[0].maintenanceAndroidDelivery.toString() ==
                "1") {
          Get.offAll(
            Maintenance(
              serverDownReason: model
                  .data
                  ?.settings?[0]
                  .maintenanceReasonAndroidDelivery
                  .toString(),
            ),
          );
        } else if (Platform.isIOS &&
            model.data?.settings?[0].maintenanceIos.toString() == "1") {
          Get.offAll(
            Maintenance(
              serverDownReason: model.data?.settings?[0].maintenanceReasonIos
                  .toString(),
            ),
          );
        } else if (Platform.isAndroid &&
            (model.data?.settings?[0].playStoreUpdateDelivery.toString() ==
                    "1" &&
                versionToCode(
                      model.data?.settings?[0].playStoreVersionDelivery
                              .toString() ??
                          "",
                    ) >
                    versionToCode(buildNumber.toString()))) {
          Get.offAll(() => NeedAnUpdate());
        } else if (Platform.isIOS &&
            (model.data?.settings?[0].appStoreUpdate.toString() == "1" &&
                versionToCode(
                      model.data?.settings?[0].appStoreVersion.toString() ?? "",
                    ) >
                    versionToCode(buildNumber.toString()))) {
          Get.offAll(() => NeedAnUpdate());
        } else {
          debugPrint("Getting orders");

          update();
        }
      }
    } catch (error, stackTrace) {
      debugPrint("maintenance Error: $error");
      debugPrint("maintenance StackTrace: $stackTrace");
      if (error.toString() == "Unauthorized") {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        showToast(context, S.of(context).youAreLoggedOutSuccessfully);
        Get.offAll(LoginScreen());
      } else {
        showToast(context, error.toString());
      }
    }
  }

  Future<void> fetchHome(BuildContext context, int status) async {
    try {
      final response = await DioClient().get(ApiEndPoints.home);
      HomeModel model = HomeModel.fromJson(response.data);
      debugPrint("home model: $response.data");
    } catch (error) {
      debugPrint("home Error: $error");
    }
  }
}
