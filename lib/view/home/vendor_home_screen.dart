import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/view/home/vendor_order_details.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_order_card.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_stat_card.dart';
import 'package:saimpex_vendor/view/notifications/notifications.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

import 'package:saimpex_vendor/view/home/dashboard.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key});

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  String selectedTab = "Pending";
  final List<String> tabs = [
    "Pending",
    "Accepted",
    "Preparing",
    "Ready",
    "Delivered",
    "Cancelled",
  ];

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 316,
          height: 154.52,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.grey, size: 20),
                ),
              ),
              const SizedBox(height: 8),
              Image.asset(
                'lib/assets/images/Success vendor.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 16),
              Text(
                "Order Accepted successfully",
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1F2937),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            // Top Bar / Welcome Box
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('lib/assets/images/logo.png', height: 50),
                      const SizedBox(width: 12),
                      Text(
                        "Welcome to Saimpex Vendor!",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F1F1F),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const Notifications()),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.black87,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            // Membership Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                height: 60.25,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/Silver.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Silver Member",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F1F1F),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE5E5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Expires in 7 days",
                        style: GoogleFonts.rubik(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Stats
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VendorStatCard(
                    title: "Today's Orders",
                    value: "69",
                    icon: Icons.shopping_basket_outlined,
                    backgroundColor: Color(0xFFE5E5FF),
                    iconDecorationColor: Color(0xFF6B6BFF),
                  ),
                  VendorStatCard(
                    title: "Total Orders",
                    value: "100",
                    icon: Icons.account_balance_wallet_outlined,
                    backgroundColor: Color(0xFFD9F9E7),
                    iconDecorationColor: Color(0xFF00D15D),
                  ),
                  VendorStatCard(
                    title: "Products",
                    value: "10",
                    icon: Icons.shopping_bag_outlined,
                    backgroundColor: Color(0xFFFFE5D9),
                    iconDecorationColor: Color(0xFFFF5216),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Dashboard Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const Dashboard());
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFF5216)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Go to Dashboard",
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFF5216),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Orders Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ORDERS",
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F1F1F),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF5216),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF9CA3AF),
                      size: 20,
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 36,
                      maxHeight: 20,
                    ),
                    hintText: "Search by ID, name",
                    hintStyle: GoogleFonts.rubik(
                      fontSize: 14,
                      color: const Color(0xFF9CA3AF),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tabs
            SizedBox(
              height: 38,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedTab == tabs[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = tabs[index];
                      });
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 114,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? (tabs[index] == "Pending"
                                      ? const Color(0xFFF59E0B)
                                      : tabs[index] == "Accepted" ||
                                            tabs[index] == "Ready"
                                      ? const Color(0xFF22C55E)
                                      : tabs[index] == "Delivered"
                                      ? const Color(0xFF15803D)
                                      : tabs[index] == "Preparing"
                                      ? const Color(0xFF60A5FA)
                                      : tabs[index] == "Cancelled"
                                      ? const Color(0xFFEF4444)
                                      : const Color(0xFFFF5216))
                                : Colors.white,
                            borderRadius: BorderRadius.circular(9999),
                            border: Border.all(
                              color: isSelected
                                  ? (tabs[index] == "Pending"
                                        ? const Color(0xFFF59E0B)
                                        : tabs[index] == "Accepted" ||
                                              tabs[index] == "Ready"
                                        ? const Color(0xFF22C55E)
                                        : tabs[index] == "Delivered"
                                        ? const Color(0xFF15803D)
                                        : tabs[index] == "Preparing"
                                        ? const Color(0xFF60A5FA)
                                        : tabs[index] == "Cancelled"
                                        ? const Color(0xFFEF4444)
                                        : const Color(0xFFFF5216))
                                  : const Color(0xFFE5E5E5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              tabs[index],
                              style: GoogleFonts.rubik(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF6B7280),
                              ),
                            ),
                          ),
                        ),
                        // Badge indicator shown when tab is selected
                        if (isSelected)
                          Positioned(
                            top: -4,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.12),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                tabs[index] == "Pending"
                                    ? "02"
                                    : tabs[index] == "Accepted"
                                    ? "03"
                                    : tabs[index] == "Preparing"
                                    ? "05"
                                    : tabs[index] == "Ready"
                                    ? "02"
                                    : tabs[index] == "Delivered"
                                    ? "01"
                                    : "01",
                                style: GoogleFonts.rubik(
                                  color: tabs[index] == "Pending"
                                      ? const Color(0xFFF59E0B)
                                      : tabs[index] == "Accepted" ||
                                            tabs[index] == "Ready"
                                      ? const Color(0xFF22C55E)
                                      : tabs[index] == "Delivered"
                                      ? const Color(0xFF15803D)
                                      : tabs[index] == "Preparing"
                                      ? const Color(0xFF60A5FA)
                                      : tabs[index] == "Cancelled"
                                      ? const Color(0xFFEF4444)
                                      : const Color(0xFFFF5216),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            // Orders List
            _orderCard(
              orderId: "ORD-882111",
              customerName: "Aicha Mint Ahmed",
              itemsCount: 3,
              price: 42.50,
              dateTime: "Feb 07, 2026 10:45 AM, Today",
              status: selectedTab,
            ),
            const SizedBox(height: 16),
            _orderCard(
              orderId: "ORD-882112",
              customerName: "Mariem Mint Sidi",
              itemsCount: 3,
              price: 42.50,
              dateTime: "Feb 07, 2026 10:50 AM, Today",
              status: selectedTab,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _orderCard({
    required String orderId,
    required String customerName,
    required int itemsCount,
    required double price,
    required String dateTime,
    required String status,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: VendorOrderCard(
        orderId: orderId,
        customerName: customerName,
        itemsCount: itemsCount,
        price: price,
        dateTime: dateTime,
        status: status,
        onReject: () {},
        onAccept: () {
          _showSuccessDialog(context);
        },
        onTap: () {
          Get.to(
            () => VendorOrderDetails(
              orderId: orderId.replaceAll("ORD-", ""),
              customerName: customerName,
              status: status,
              dateTime: dateTime,
              price: price,
            ),
          );
        },
      ),
    );
  }
}
