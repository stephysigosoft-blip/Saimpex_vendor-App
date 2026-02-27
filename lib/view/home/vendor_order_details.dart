import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:saimpex_vendor/utils/widgets/dotted_line_painter.dart';
import 'package:saimpex_vendor/utils/widgets/success_dialog.dart';

class VendorOrderDetails extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String status;
  final String dateTime;
  final double price;

  const VendorOrderDetails({
    super.key,
    required this.orderId,
    required this.customerName,
    required this.status,
    required this.dateTime,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          "Order Details",
          style: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F1F1F),
          ),
        ),
        centerTitle: true,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),
                  // Order Summary Card
                  Container(
                    width: 350,
                    constraints: const BoxConstraints(minHeight: 220),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ORDER #$orderId",
                              style: GoogleFonts.rubik(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: colorPrimary,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: status.toLowerCase() == 'pending'
                                    ? const Color(0xFFF59E0B)
                                    : status.toLowerCase() == 'accepted' ||
                                          status.toLowerCase() == 'ready'
                                    ? const Color(0xFF22C55E)
                                    : status.toLowerCase() == 'delivered'
                                    ? const Color(0xFF15803D)
                                    : status.toLowerCase() == 'preparing'
                                    ? const Color(0xFF60A5FA)
                                    : status.toLowerCase() == 'cancelled'
                                    ? const Color(0xFFEF4444)
                                    : const Color(0xFFFFB800),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                status.toUpperCase(),
                                style: GoogleFonts.rubik(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8), // Reduced gap
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                customerName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1F2937),
                                ),
                              ),
                            ),
                            if (status.toLowerCase() == 'preparing')
                              Text(
                                "00:05:00 min",
                                style: GoogleFonts.rubik(
                                  fontSize: 10,
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 14), // Gap 14px
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _infoCol(
                              "ITEMS",
                              "3 Items • ${price.toStringAsFixed(2)} MRU",
                              isPrice: true,
                            ),
                            _infoCol("DATE & TIME", dateTime),
                          ],
                        ),
                        const SizedBox(height: 14), // Gap 14px
                        Text(
                          "DELIVERY ADDRESS",
                          style: GoogleFonts.rubik(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF9CA3AF),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Sahara View Home, Near Marhaba Supermarket, Nouakchott, Mauritania",
                                style: GoogleFonts.rubik(
                                  fontSize: 11,
                                  color: const Color(0xFF4B5563),
                                  height: 1.4,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "lib/assets/images/Map Icon.png", // Using existing marker as placeholder or similar
                                width: 78,
                                height: 48,
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) => Container(
                                  width: 48,
                                  height: 48,
                                  color: Colors.grey[200],
                                  child: const Icon(
                                    Icons.map,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (status.toLowerCase() == 'ready' ||
                      status.toLowerCase() == 'delivered') ...[
                    const SizedBox(height: 24),
                    _driverDetails(),
                  ],
                  const SizedBox(height: 32),
                  Text(
                    "ORDER ITEMS (3)",
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Order Items List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) =>
                        _itemTile("Double Cheeseburger", 14.16, 1),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "CUSTOMER NOTES",
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 350,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFBEB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFFEF3C7),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "lib/assets/images/Customer note.png",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "\"Please leave the package at the front door and ring the bell. Thank you!\"",
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFF92400E),
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "PAYMENT SUMMARY",
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Payment Summary Card
                  Container(
                    width: 350,
                    height: 240,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        _summaryRow("Subtotal", "37.50 MRU"),
                        const SizedBox(height: 16), // Gap 16px as requested
                        _summaryRow("Delivery Fee", "5.00 MRU"),
                        const SizedBox(height: 16), // Gap 16px
                        _summaryRow("Tax", "5.00 MRU"),
                        const SizedBox(height: 16), // Gap 16px
                        _summaryRow(
                          "Payment Type",
                          "Online Payment",
                          isGreen: true,
                        ),
                        const SizedBox(height: 8),
                        _summaryRow("Payment On", dateTime, isSmall: true),
                        const SizedBox(height: 16), // Gap 16px
                        CustomPaint(
                          painter: DottedLinePainter(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: const SizedBox(
                            width: double.infinity,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 16), // Gap 16px
                        _summaryRow("Total Amount", "47.50 MRU", isTotal: true),
                      ],
                    ),
                  ),
                  if (status.toLowerCase() != 'pending') ...[
                    const SizedBox(height: 32),
                    // Order Timeline Tabs
                    Container(
                      width: 350,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(39),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF5216),
                                borderRadius: BorderRadius.circular(39),
                              ),
                              child: Center(
                                child: Text(
                                  "Order Timeline",
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Order Duration Breakdown",
                                style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Timeline items
                    _timelineItem(
                      "Order Placed",
                      "Order successfully placed by Aicha Mint Ahmed",
                      "Feb 07, 2026 10:45 AM",
                      isCompleted: true,
                      isFirst: true,
                    ),
                    _timelineItem(
                      "Order Accepted",
                      "Restaurant has accepted your order and will start cooking soon.",
                      "Feb 07, 2026 10:50 AM",
                      isCompleted: true,
                    ),
                    _timelineItem(
                      "Preparing Food",
                      "The chef is preparing your food",
                      status.toLowerCase() == 'ready' ||
                              status.toLowerCase() == 'delivered'
                          ? "Feb 07, 2026 10:53 AM"
                          : "",
                      isCompleted:
                          status.toLowerCase() == 'ready' ||
                          status.toLowerCase() == 'delivered',
                      asset: "lib/assets/images/Preparing food.png",
                    ),
                    _timelineItem(
                      "Delivery Boy Accepted",
                      "Your order will be picked up shortly",
                      status.toLowerCase() == 'ready' ||
                              status.toLowerCase() == 'delivered'
                          ? "Feb 07, 2026 10:55 AM"
                          : "",
                      isCompleted:
                          status.toLowerCase() == 'ready' ||
                          status.toLowerCase() == 'delivered',
                      asset: "lib/assets/images/Delivery.png",
                    ),
                    _timelineItem(
                      "Reached Restaurant",
                      "Your delivery partner has arrived at the restaurant",
                      status.toLowerCase() == 'ready' ||
                              status.toLowerCase() == 'delivered'
                          ? "Feb 07, 2026 10:57 AM"
                          : "",
                      isCompleted:
                          status.toLowerCase() == 'ready' ||
                          status.toLowerCase() == 'delivered',
                      asset: "lib/assets/images/Reached Restaurant.png",
                    ),
                    _timelineItem(
                      "Order Delivered",
                      "Final step of the journey.",
                      status.toLowerCase() == 'delivered'
                          ? "Feb 07, 2026 11:15 AM"
                          : "",
                      asset: "lib/assets/images/Order delivered.png",
                      isCompleted: status.toLowerCase() == 'delivered',
                      isLast: true,
                    ),
                  ],
                  const SizedBox(height: 120), // Spacing for bottom buttons
                ],
              ),
            ),
          ),
          // Bottom Buttons
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: status.toLowerCase() == 'pending'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 119,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF1F5F9),
                            foregroundColor: const Color(0xFFEF4444),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Text(
                            "Reject",
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 189,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF5216),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Text(
                            "Accept Order",
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (status.toLowerCase() == 'accepted' ||
                      status.toLowerCase() == 'preparing')
                ? SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (status.toLowerCase() == 'accepted') {
                          showSuccessDialog(
                            "Order preparation started successfully",
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5216),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        status.toLowerCase() == 'preparing'
                            ? "Mark as Ready"
                            : "Prepare Order",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _infoCol(String label, String value, {bool isPrice = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.rubik(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF9CA3AF),
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: GoogleFonts.rubik(
              fontSize: 11,
              color: const Color(0xFF4B5563),
            ),
            children: isPrice
                ? [
                    TextSpan(text: value.split('•')[0] + " • "),
                    TextSpan(
                      text: value.split('•')[1],
                      style: const TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                : [TextSpan(text: value)],
          ),
        ),
      ],
    );
  }

  Widget _itemTile(String name, double price, int qty) {
    return Container(
      width: 350,
      height: 98,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "lib/assets/images/Food vendor.png", // Using generic food image
              width: 74,
              height: 74,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) =>
                  Container(width: 74, height: 74, color: Colors.grey[100]),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${price.toStringAsFixed(2)} MRU",
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: colorPrimary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Qty: $qty",
              style: GoogleFonts.rubik(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF4B5563),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    bool isGreen = false,
    bool isTotal = false,
    bool isSmall = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.rubik(
            fontSize: isTotal ? 14 : 13,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: const Color(0xFF4B5563),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.rubik(
            fontSize: isTotal ? 14 : (isSmall ? 11 : 13),
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isGreen
                ? const Color(0xFF10B981)
                : (isTotal
                      ? colorPrimary
                      : (isSmall
                            ? const Color(0xFF9CA3AF)
                            : const Color(0xFF1F2937))),
          ),
        ),
      ],
    );
  }

  Widget _timelineItem(
    String title,
    String subtitle,
    String time, {
    bool isCompleted = false,
    bool isFirst = false,
    bool isLast = false,
    String? asset,
    IconData? icon,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? const Color(0xFFFF5216)
                      : const Color(0xFFE2E8F0),
                  shape: BoxShape.circle,
                ),
                child: isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : asset != null
                    ? Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Image.asset(
                          asset,
                          color: const Color(0xFF94A3B8),
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.circle,
                                color: Color(0xFF94A3B8),
                                size: 12,
                              ),
                        ),
                      )
                    : Icon(
                        icon ?? Icons.circle,
                        color: const Color(0xFF94A3B8),
                        size: 16,
                      ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: const Color(0xFFE2E8F0)),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isCompleted
                              ? const Color(0xFF1E293B)
                              : const Color(0xFF94A3B8),
                        ),
                      ),
                      if (time.isNotEmpty)
                        Text(
                          time,
                          style: GoogleFonts.rubik(
                            fontSize: 10,
                            color: const Color(0xFF94A3B8),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.rubik(
                      fontSize: 11,
                      color: const Color(0xFF94A3B8),
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

  Widget _driverDetails() {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "lib/assets/images/Delivery.png",
                width: 18,
                height: 18,
                color: const Color(0xFFFF5216),
              ),
              const SizedBox(width: 8),
              Text(
                "Driver Details",
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "lib/assets/images/logo.png", // Placeholder for driver avatar
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(
                    width: 48,
                    height: 48,
                    color: Colors.grey[200],
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Abdallahi Ould Ahmed",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Assigned Delivery Partner",
                      style: GoogleFonts.rubik(
                        fontSize: 11,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.phone_outlined,
                    size: 16,
                    color: Color(0xFFFF5216),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "+222 34567895",
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.phone, color: Colors.white, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
