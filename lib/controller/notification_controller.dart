import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/model/notification_model.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("NotificationController initialized");
    scrollController.addListener(_loadMoreNotifications);
  }

  @override
  void onClose() {
    scrollController.removeListener(_loadMoreNotifications);
    scrollController.dispose();
    super.onClose();
  }

  List<AppNotification> notificationList = [];
  bool isLoading = false;

  // Pagination variables
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;
  bool _hasNextPage = true;
  final ScrollController scrollController = ScrollController();

  void _loadMoreNotifications() async {
    if (_hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        scrollController.hasClients &&
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

  Future<void> getNotifications(BuildContext context) async {
    try {
      isFirstLoadRunning = true;
      isLoading = true;
      update();

      await Future.delayed(const Duration(seconds: 1));

      // Mock data matching the design
      notificationList = [
        AppNotification(
          id: 1,
          titleEn: "ORD-882111",
          titleAr: "",
          titleFr: "",
          contentEn: "3 Items • 42.50 MRU",
          contentFr: "",
          contentAr: "",
          date: "Today",
          time: "Feb 07, 2026 10:45 AM",
          notificationsCreatedAt: "2026-02-07 10:45:00",
        ),
        AppNotification(
          id: 2,
          titleEn: "ORD-882112",
          titleAr: "",
          titleFr: "",
          contentEn: "4 Items • 60.50 MRU",
          contentFr: "",
          contentAr: "",
          date: "Yesterday",
          time: "Feb 06, 2026 10:45 AM",
          notificationsCreatedAt: "2026-02-06 10:45:00",
        ),
      ];
      _hasNextPage = false;

      isFirstLoadRunning = false;
      isLoading = false;
      update();
    } catch (error) {
      isFirstLoadRunning = false;
      isLoading = false;
      update();
      debugPrint("getNotifications Mock Error: $error");
    }
  }
}
