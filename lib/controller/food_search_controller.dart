import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

import '../model/restaurant_search_model.dart';

class FoodSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();

  int currentIndex = 0;
  int selectedcurrentIndex = 0;
  final FlutterLocalization localization = FlutterLocalization.instance;
  String selectedLocation = '';
  List<Restaurant> restaurantList = [];
  RestaurantSearchModel? homeData;
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
    getSearchResults();
  }

  // Clear specific filters
  void clearOffersFilter() {
    offers = "";
    selectedOfferFilter = null;
    getSearchResults();
  }

  void clearVegFilter() {
    veg = "";
    getSearchResults();
  }

  void clearNonVegFilter() {
    nonVeg = "";
    getSearchResults();
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
    getSearchResults();
  }

  List<String> sortOptions = [
    "Relevance",
    "Delivery Time",
    "Cost: Low to High",
    "Cost: High to Low",
  ];

  void _loadMore() async {
    if (_hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        scrollController.position.extentAfter < 300) {
      isLoadMoreRunning = true;
      update();

      await Future.delayed(const Duration(seconds: 1));
      // Mock: No more pages
      _hasNextPage = false;

      isLoadMoreRunning = false;
      update();
    }
  }

  Future<void> getSearchResults() async {
    try {
      isFirstLoadRunning = true;
      update();
      await Future.delayed(const Duration(seconds: 1));

      // Mock data setup
      restaurantList = [];
      _hasNextPage = false;

      isFirstLoadRunning = false;
      update();
    } catch (e) {
      isFirstLoadRunning = false;
      update();
      debugPrint('Mock getSearchResults error: $e');
    }
  }

  Future<RestaurantSearchModel?> getSearchResultsApi(
    int limit,
    int page,
  ) async {
    return null; // Neutralized
  }
}
