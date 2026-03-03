import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:saimpex_vendor/utils/widgets/custom_search_box.dart';
import 'package:saimpex_vendor/view/restaurant/add_menu_screen.dart';
import 'package:saimpex_vendor/view/restaurant/add_items_screen.dart';
import 'package:saimpex_vendor/view/restaurant/edit_items_screen.dart';
import 'package:saimpex_vendor/view/restaurant/menu_item_details_screen.dart';

class VendorRestaurantScreen extends StatefulWidget {
  const VendorRestaurantScreen({super.key});

  @override
  State<VendorRestaurantScreen> createState() => _VendorRestaurantScreenState();
}

class _VendorRestaurantScreenState extends State<VendorRestaurantScreen> {
  String selectedMenu = "Account";

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            // Header Card
            Container(
              width: 350,
              height: 189,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo R1
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        "R1",
                        style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFF5216),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Restaurant 1",
                    style: GoogleFonts.rubik(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F1F1F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Rating Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF166534),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFF59E0B),
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "4.6",
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Menu Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildMenuButton("Account"),
                  const SizedBox(width: 10),
                  _buildMenuButton("Working Hours"),
                  const SizedBox(width: 10),
                  _buildMenuButton("Leaves"),
                  const SizedBox(width: 10),
                  _buildMenuButton("Menu"),
                  const SizedBox(width: 10),
                  _buildMenuButton("Items"),
                  const SizedBox(width: 10),
                  _buildMenuButton("Menu Bulk Import"),
                  const SizedBox(width: 10),
                  _buildMenuButton("Basket"),
                  const SizedBox(width: 10),
                  _buildMenuButton("Received Payouts"),
                  const SizedBox(width: 10),
                  _buildMenuButton("Restaurant Reports"),
                ],
              ),
            ),
            const SizedBox(height: 24),

            if (selectedMenu == "Account") ...[
              _sectionHeader("RESTAURANT DETAILS"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 231,
                child: Column(
                  children: [
                    _detailRow("Name", "Restaurant 1"),
                    _detailRow("Owner", "Salman"),
                    _detailRow("ID", "1"),
                    _detailRow("Contact", "+22241518211"),
                    _detailRow("Email", "rest1@saimpex.com"),
                    _detailRow("Status", "ACTIVE", isStatus: true),
                    _detailRow("Address", "Restaurant Block 5, Mauritania"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("BANK DETAILS"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 124,
                child: Column(
                  children: [
                    _detailRow("Holder Name", "Salman H"),
                    _detailRow("IBAN Number", "121236218936189111"),
                    _detailRow("SWIFT Code", "TESTMRMR001"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("ABOUT THE RESTAURANT"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 69,
                child: Column(children: [_detailRow("Category", "Non-Veg")]),
              ),
              const SizedBox(height: 24),
              _sectionHeader("REGISTRATION DETAILS"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 124,
                child: Column(
                  children: [
                    _detailRow("Reg. Number", "REST11MAUR13"),
                    _detailRow("Reg. Date", "Dec 7, 2025"),
                    _detailRow("GST Number", "GSTRMAU127444"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("PAYMENT DETAILS"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 96,
                child: Column(
                  children: [
                    _detailRow("Commission %", "5.00%"),
                    _detailRow("Total Profit", "0 MRU", isBoldValue: true),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("OWNER IDENTITY PROOF"),
              const SizedBox(height: 12),
              _buildDetailCard(height: 98, child: const SizedBox.shrink()),
              const SizedBox(height: 24),
              _sectionHeader("CERTIFICATES"),
              const SizedBox(height: 12),
              _buildDetailCard(height: 98, child: const SizedBox.shrink()),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _sectionHeader("RATING & REVIEWS"),
                  Text(
                    "View All",
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFF5216),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildReviewCard(),
              const SizedBox(height: 12),
              _buildReviewCard(),
            ] else if (selectedMenu == "Working Hours") ...[
              _buildWorkingHours(),
            ] else if (selectedMenu == "Leaves") ...[
              _buildLeaves(),
            ] else if (selectedMenu == "Menu") ...[
              _buildMenuSection(),
            ] else if (selectedMenu == "Items") ...[
              _buildItemsSection(),
            ] else ...[
              const SizedBox(
                height: 200,
                child: Center(child: Text("Coming Soon")),
              ),
            ],

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkingHours() {
    final List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    return Container(
      width: 350,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: days.map((day) {
          bool isLast = day == days.last;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  day,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1EE),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "24 Hr",
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFF5216),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuButton(String title) {
    bool isSelected = selectedMenu == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMenu = title;
        });
      },
      child: Container(
        width: 125,
        height: 42,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF5216) : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(9999),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF5216)
                : const Color.fromARGB(255, 200, 202, 203),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.rubik(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : const Color(0xFF64748B),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.rubik(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1F1F1F),
      ),
    );
  }

  Widget _buildDetailCard({required double height, required Widget child}) {
    return Container(
      width: 350,
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
      ),
      child: child,
    );
  }

  Widget _detailRow(
    String label,
    String value, {
    bool isStatus = false,
    bool isBoldValue = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 12,
              color: const Color(0xFF94A3B8),
              fontWeight: FontWeight.w400,
            ),
          ),
          if (isStatus)
            Text(
              value,
              style: GoogleFonts.rubik(
                fontSize: 12,
                color: const Color(0xFF22C55E),
                fontWeight: FontWeight.bold,
              ),
            )
          else
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  color: const Color(0xFF1F1F1F),
                  fontWeight: isBoldValue ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFDCFCE7),
                child: Text(
                  "S",
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF22C55E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Aicha Mint Ahmed",
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1F1F1F),
                          ),
                        ),
                        Text(
                          "12 Jan 2026, 07:13 am",
                          style: GoogleFonts.rubik(
                            fontSize: 10,
                            color: const Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            index < 1 ? Icons.star : Icons.star_border,
                            color: const Color(0xFFF59E0B),
                            size: 14,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "1.0",
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            color: const Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Price was too high, Quality not as expected.",
            style: GoogleFonts.rubik(
              fontSize: 12,
              color: const Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  "Order: ",
                  style: GoogleFonts.rubik(
                    fontSize: 11,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
                Text(
                  "ORD-000091",
                  style: GoogleFonts.rubik(
                    fontSize: 11,
                    color: const Color(0xFF111827),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaves() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("MARK LEAVE"),
        const SizedBox(height: 12),
        _buildMarkLeaveCard(),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _sectionHeader("LEAVES HISTORY"),
            Text(
              "View All",
              style: GoogleFonts.rubik(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFF5216),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _subtitleLabel("Upcoming Leaves", color: const Color(0xFF3B82F6)),
        const SizedBox(height: 12),
        _buildLeaveHistoryCard(
          date: "Feb 20 - Feb 25, 2026",
          status: "SCHEDULED",
          reason: "Renovation Work",
          isScheduled: true,
        ),
        const SizedBox(height: 12),
        _buildLeaveHistoryCard(
          date: "Feb 20 - Feb 25, 2026",
          status: "SCHEDULED",
          reason: "Renovation Work",
          isScheduled: true,
        ),
        const SizedBox(height: 24),
        _subtitleLabel("Completed Leaves", color: const Color(0xFF22C55E)),
        const SizedBox(height: 12),
        _buildLeaveHistoryCard(
          date: "Jan 20 - Jan 25, 2025",
          status: "COMPLETED",
          reason: "Renovation Work",
          isScheduled: false,
        ),
        const SizedBox(height: 12),
        _buildLeaveHistoryCard(
          date: "Jan 20 - Jan 25, 2025",
          status: "COMPLETED",
          reason: "Renovation Work",
          isScheduled: false,
        ),
      ],
    );
  }

  Widget _buildMarkLeaveCard() {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
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
              Expanded(child: _buildInputFieldLabel("From Date")),
              const SizedBox(width: 15),
              Expanded(child: _buildInputFieldLabel("To Date")),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildDateField("dd-mm-yyyy")),
              const SizedBox(width: 15),
              Expanded(child: _buildDateField("dd-mm-yyyy")),
            ],
          ),
          const SizedBox(height: 15),
          _buildInputFieldLabel("Reason For Leave"),
          const SizedBox(height: 8),
          _buildTextAreaField("e.g. Annual vacation, renovation..."),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5216),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                "Mark Leave",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputFieldLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.rubik(
        fontSize: 12,
        color: const Color(0xFF94A3B8).withOpacity(0.8),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildDateField(String hint) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: GoogleFonts.rubik(
              fontSize: 12,
              color: const Color(0xFF1F1F1F),
            ),
          ),
          const Icon(
            Icons.calendar_month_outlined,
            size: 18,
            color: Color(0xFF64748B),
          ),
        ],
      ),
    );
  }

  Widget _buildTextAreaField(String hint) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Text(
        hint,
        style: GoogleFonts.rubik(fontSize: 12, color: const Color(0xFF94A3B8)),
      ),
    );
  }

  Widget _buildLeaveHistoryCard({
    required String date,
    required String status,
    required String reason,
    required bool isScheduled,
  }) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
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
                date,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isScheduled
                      ? const Color(0xFFDBEAFE)
                      : const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.rubik(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isScheduled
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFF22C55E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            reason,
            style: GoogleFonts.rubik(
              fontSize: 12,
              color: const Color(0xFF64748B),
            ),
          ),
          if (isScheduled) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFF5216)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Cancel Leave",
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF5216),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        _buildMenuSearchRow(),
        const SizedBox(height: 16),
        _buildMenuActionRow(),
        const SizedBox(height: 16),
        _buildMenuItemCard(),
        const SizedBox(height: 16),
        _buildMenuItemCard(),
      ],
    );
  }

  Widget _buildItemsSection() {
    return Column(
      children: [
        _buildMenuSearchRow(),
        const SizedBox(height: 16),
        _buildItemsActionRow(),
        const SizedBox(height: 16),
        _buildItemsCard(name: "Zesty Chicken Burger (Half)", isAvailable: true),
        const SizedBox(height: 16),
        _buildItemsCard(
          name: "Zesty Chicken Burger (Full)",
          isAvailable: false,
        ),
      ],
    );
  }

  Widget _buildItemsActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildItemsActionButton(
          label: "Download",
          icon: Icons.file_download_outlined,
          bgColor: const Color(0xFFFFF1EE),
          borderColor: const Color(0xFFFF5216),
          textColor: const Color(0xFFFF5216),
        ),
        _buildItemsActionButton(
          label: "Upload Menu",
          icon: Icons.file_upload_outlined,
          bgColor: const Color(0xFFEEF2FF),
          borderColor: const Color(0xFF3B82F6),
          textColor: const Color(0xFF3B82F6),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddItemsScreen()),
            );
          },
          child: _buildItemsActionButton(
            label: "Add Item",
            icon: Icons.add,
            bgColor: Colors.white,
            borderColor: const Color(0xFFFF5216),
            textColor: const Color(0xFFFF5216),
            iconOnRight: false,
          ),
        ),
      ],
    );
  }

  Widget _buildItemsActionButton({
    required String label,
    required IconData icon,
    required Color bgColor,
    required Color borderColor,
    required Color textColor,
    bool iconOnRight = true,
  }) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: borderColor, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!iconOnRight) ...[
            Icon(icon, color: textColor, size: 16),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          if (iconOnRight) ...[
            const SizedBox(width: 4),
            Icon(icon, color: textColor, size: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildItemsCard({required String name, required bool isAvailable}) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image container
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("lib/assets/images/Burger.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "New Arrival",
                          style: GoogleFonts.rubik(
                            fontSize: 10,
                            color: const Color(0xFFFF5216),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ID: # 33",
                          style: GoogleFonts.rubik(
                            fontSize: 10,
                            color: const Color(0xFF94A3B8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        _buildMoreMenu(context),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      name,
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F1F1F),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1EE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Chinese",
                        style: GoogleFonts.rubik(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFF5216),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "50.00 MRU",
                              style: GoogleFonts.rubik(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1F1F1F),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "100.00 MRU",
                              style: GoogleFonts.rubik(
                                fontSize: 10,
                                color: const Color(0xFF94A3B8),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: isAvailable
                                    ? const Color(0xFF22C55E)
                                    : const Color(0xFFEF4444),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              isAvailable ? "Available" : "Out Of Stock",
                              style: GoogleFonts.rubik(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: isAvailable
                                    ? const Color(0xFF22C55E)
                                    : const Color(0xFFEF4444),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MenuItemDetailsScreen(itemId: '33'),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFF5216)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "View Details",
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFF5216),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSearchRow() {
    return Row(
      children: [
        CustomSearchBox(
          hintText: "Search by ID, item name",
          boxColor: Colors.white,
          showSearchIcon: true,
          width: 280,
          height: 41,
        ),
        const SizedBox(width: 5),
        Container(
          width: 54,
          height: 41,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF1F5F9)),
          ),
          child: const Icon(Icons.tune, color: Color(0xFF64748B), size: 20),
        ),
      ],
    );
  }

  Widget _buildMenuActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(color: const Color(0xFFFF5216), width: 0.5),
          ),
          child: Row(
            children: [
              Text(
                "All Categories",
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF1F1F1F),
                size: 18,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddMenuScreen()),
            );
          },
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: const Color(0xFFFF5216), width: 0.5),
            ),
            child: Row(
              children: [
                const Icon(Icons.add, color: Color(0xFFFF5216), size: 18),
                const SizedBox(width: 4),
                Text(
                  "Add Menu",
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF5216),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItemCard() {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image container
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("lib/assets/images/Burger.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "New Arrival",
                          style: GoogleFonts.rubik(
                            fontSize: 10,
                            color: const Color(0xFFFF5216),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ID: # 33",
                          style: GoogleFonts.rubik(
                            fontSize: 10,
                            color: const Color(0xFF94A3B8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        _buildMoreMenu(context),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Zesty Chicken Burger",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F1F1F),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1EE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Chinese",
                        style: GoogleFonts.rubik(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFF5216),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "50.00 MRU",
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1F1F1F),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "100.00 MRU",
                          style: GoogleFonts.rubik(
                            fontSize: 10,
                            color: const Color(0xFF94A3B8),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MenuItemDetailsScreen(itemId: '33'),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFF5216)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "View Details",
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFF5216),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subtitleLabel(String text, {required Color color}) {
    return Text(
      text,
      style: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  Widget _buildMoreMenu(BuildContext context) {
    final GlobalKey key = GlobalKey();
    return GestureDetector(
      key: key,
      onTap: () async {
        final RenderBox renderBox =
            key.currentContext!.findRenderObject() as RenderBox;
        final Offset offset = renderBox.localToGlobal(Offset.zero);
        final Size size = renderBox.size;

        await showMenu(
          context: context,
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
          ),
          constraints: const BoxConstraints(minWidth: 138.52, maxWidth: 138.52),
          position: RelativeRect.fromLTRB(
            offset.dx - 138.52 + size.width,
            offset.dy + size.height + 4,
            offset.dx + size.width,
            offset.dy + size.height + 4 + 66.07,
          ),
          items: [
            PopupMenuItem(
              padding: EdgeInsets.zero,
              height: 0,
              value: 'edit',
              child: _buildMenuOption(Icons.edit_outlined, 'Edit'),
            ),
            PopupMenuItem(
              padding: EdgeInsets.zero,
              height: 0,
              value: 'delete',
              child: _buildMenuOption(Icons.delete_outline, 'Delete'),
            ),
          ],
        ).then((value) {
          if (value == 'edit') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EditItemsScreen(itemId: '33'),
              ),
            );
          } else if (value == 'delete') {
            // TODO: handle delete item
          }
        });
      },
      child: const Icon(Icons.more_vert, color: Color(0xFF94A3B8), size: 18),
    );
  }

  Widget _buildMenuOption(IconData icon, String label) {
    return SizedBox(
      width: 121.69,
      height: 33,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 14, color: const Color(0xFF1F1F1F)),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1F1F1F),
                  ),
                ),
              ],
            ),
            const Icon(Icons.chevron_right, size: 14, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }
}
