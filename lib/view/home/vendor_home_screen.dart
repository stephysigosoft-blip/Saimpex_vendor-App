import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/controller/home_controller.dart';
import 'package:saimpex_vendor/controller/vendor_home_controller.dart';
import 'package:saimpex_vendor/generated/l10n.dart';
import 'package:saimpex_vendor/model/home_model.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:saimpex_vendor/utils/widgets/custom_search_box.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_dashboard_button.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_home_top_bar.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_membership_card.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_order_list_item.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_orders_header.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_stats_section.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_status_tabs.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_success_dialog.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key});

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  final VendorHomeController vendorHomeController =
      const VendorHomeController();
  final HomeController homeController = Get.find<HomeController>();
  String selectedTab = "Pending";
  static const int _defaultLimit = 10;
  final Map<String, int> _tabCounts = {
    "Pending": 0,
    "Accepted": 0,
    "Preparing": 0,
    "Ready": 0,
    "Delivered": 0,
    "Cancelled": 0,
  };
  final List<String> tabs = [
    "Pending",
    "Accepted",
    "Preparing",
    "Ready",
    "Delivered",
    "Cancelled",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchOrders();
    });
  }

  int _statusValue(String tab) {
    switch (tab) {
      case "Pending":
        return 1;
      case "Accepted":
        return 2;
      case "Preparing":
        return 3;
      case "Ready":
        return 4;
      case "Delivered":
        return 9;
      case "Cancelled":
        return 10;
      default:
        return 1;
    }
  }

  String _statusLabel(int? status) {
    switch (status) {
      case 1:
        return S.current.pending;
      case 2:
        return S.current.accepted;
      case 3:
        return S.current.preparing;
      case 4:
        return S.current.ready;
      case 9:
        return S.current.delivered;
      case 10:
        return S.current.cancelled;
      default:
        return S.current.pending;
    }
  }

  Future<void> _fetchOrders({String? keyword}) async {
    await homeController.fetchHome(
      context,
      orderStatus: _statusValue(selectedTab),
      keyword: keyword ?? homeController.searchController.text.trim(),
      limit: _defaultLimit,
    );
    _refreshSelectedTabCount();
  }

  void _refreshSelectedTabCount() {
    if (!mounted) return;
    final totalCount =
        homeController.homeData?.data?.orders?.total ??
        homeController.homeData?.data?.orders?.data?.length ??
        0;
    setState(() {
      _tabCounts[selectedTab] = totalCount;
    });
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const VendorSuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final layout = vendorHomeController.getLayoutConfig(
      screenWidth: size.width,
      screenHeight: size.height,
      topPadding: mediaQuery.padding.top,
    );
    return GetBuilder<HomeController>(
      builder: (controller) {
        final membership = controller.homeData?.data?.membership;
        final summary = controller.homeData?.data?.summary;
        final List<OrderData> orders =
            controller.homeData?.data?.orders?.data ?? <OrderData>[];
        final membershipName = membership?.nameEn?.trim().isNotEmpty == true
            ? membership!.nameEn!.trim()
            : S.of(context).membership;
        final expiryText = S
            .of(context)
            .expiresInDays(membership?.expiresInDays?.toString() ?? "0");
        return CommonBackground(
          resizeToAvoidBottomInset: false,
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: layout.topOffset),
                VendorHomeTopBar(horizontalPadding: layout.horizontalPadding),
                const SizedBox(height: 28),
                VendorMembershipCard(
                  horizontalPadding: layout.horizontalPadding,
                  width: size.width,
                  height: layout.membershipCardHeight,
                  membershipName: membershipName,
                  expiryText: expiryText,
                ),
                const SizedBox(height: 24),
                VendorStatsSection(
                  horizontalPadding: layout.horizontalPadding,
                  todayOrders: (summary?.todayOrders ?? 0).toString(),
                  totalOrders: (summary?.totalOrders ?? 0).toString(),
                  totalProducts: (summary?.totalProducts ?? 0).toString(),
                ),
                const SizedBox(height: 24),
                VendorDashboardButton(
                  horizontalPadding: layout.horizontalPadding,
                  width: size.width,
                  height: layout.dashboardButtonHeight,
                ),
                const SizedBox(height: 10),
                VendorOrdersHeader(horizontalPadding: layout.horizontalPadding),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: layout.horizontalPadding,
                  ),
                  child: CustomSearchBox(
                    hintText: S.of(context).searchByIdName,
                    controller: controller.searchController,
                    onChanged: (value) async {
                      await controller.fetchHome(
                        context,
                        orderStatus: _statusValue(selectedTab),
                        keyword: value.trim(),
                        limit: _defaultLimit,
                      );
                      _refreshSelectedTabCount();
                    },
                    boxColor: Colors.white,
                    showSearchIcon: true,
                    width: layout.searchBoxWidth,
                    height: 44,
                  ),
                ),
                const SizedBox(height: 16),
                VendorStatusTabs(
                  height: layout.tabsHeight,
                  leftPadding: layout.horizontalPadding,
                  tabWidth: layout.tabWidth,
                  tabs: tabs,
                  tabCounts: _tabCounts,
                  selectedTab: selectedTab,
                  onTabChanged: (tab) {
                    setState(() {
                      selectedTab = tab;
                    });
                    _fetchOrders();
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: controller.isFirstLoadRunning
                      ? const Center(child: CircularProgressIndicator())
                      : orders.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: layout.horizontalPadding,
                            vertical: 12,
                          ),
                          child: Text(S.of(context).noOrdersFound),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(top: 8, bottom: 100),
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            final price =
                                double.tryParse(order.total ?? "0") ?? 0;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: VendorOrderListItem(
                                horizontalPadding: layout.horizontalPadding,
                                orderId: order.id?.toString() ?? "NA",
                                customerName:
                                    order.userName ?? S.of(context).unknown,
                                itemsCount: order.orderItemsCount ?? 0,
                                price: price,
                                dateTime: order.placedAtFormatted ?? "",
                                status: _statusLabel(order.status),
                                onAccept: () => _showSuccessDialog(context),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
