import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

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
                  const SizedBox(width: 12),
                  _buildMenuButton("Working Hour"),
                  const SizedBox(width: 12),
                  _buildMenuButton("Leaves"),
                ],
              ),
            ),
            const SizedBox(height: 24),

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

            const SizedBox(height: 100),
          ],
        ),
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
        width: 105.25,
        height: 42,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF5216) : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(9999),
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
}
