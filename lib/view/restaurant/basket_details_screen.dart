import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/generated/l10n.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

class BasketDetailsScreen extends StatelessWidget {
  const BasketDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          S.of(context).basketDetailsTitle,
          style: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F1F1F),
          ),
        ),
        centerTitle: false,
      ),
      body: CommonBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Header Details Container
              Container(
                width: 358,
                height: 415,
                padding: const EdgeInsets.all(16),
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
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF2FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "R1",
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF5216),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    S.of(context).restaurantOne,
                                    style: GoogleFonts.rubik(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1F1F1F),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDCFCE7),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      S.of(context).active.toUpperCase(),
                                      style: GoogleFonts.rubik(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF22C55E),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${S.of(context).basketIdLabel("12")} • ${S.of(context).createdLabel("Nov 25, 2025")}",
                                style: GoogleFonts.rubik(
                                  fontSize: 10,
                                  color: const Color(0xFF94A3B8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Info Grid
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _infoBox(
                                context,
                                S.of(context).vendor.toUpperCase(),
                                S.of(context).restaurantOne,
                              ),
                              const SizedBox(width: 12),
                              _infoBox(
                                context,
                                S.of(context).priceLabel,
                                "2000 Pts",
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _infoBox(
                                context,
                                S.of(context).redeemPointsLabel,
                                "2000",
                              ),
                              const SizedBox(width: 12),
                              _infoBox(
                                context,
                                S.of(context).quantity.toUpperCase(),
                                "10",
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _infoBox(
                                context,
                                S.of(context).itemsCountLabel,
                                "3 ${S.of(context).items}",
                              ),
                              const SizedBox(width: 12),
                              _infoBox(
                                context,
                                S.of(context).ordersCountLabel,
                                "3",
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _infoBox(
                                context,
                                S.of(context).address.toUpperCase(),
                                "Restaurant Block 5, Mauritania",
                                isFullWidth: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "${S.of(context).basketItemsHeader} ",
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F1F1F),
                    ),
                  ),
                  Text(
                    "(3)",
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildBasketItemTile(
                context,
                "Chicken Fried Rice",
                S.of(context).aboutDescription, // Mock localized description
                "lib/assets/images/Chicken Fried Rice.png",
                "13",
                S.of(context).qtyLabel("2"),
              ),
              const SizedBox(height: 12),
              _buildBasketItemTile(
                context,
                "Dry fruit falooda",
                S.of(context).aboutDescription,
                "lib/assets/images/Dry fruit falooda.png",
                "14",
                S.of(context).qtyLabel("2"),
              ),
              const SizedBox(height: 12),
              _buildBasketItemTile(
                context,
                "Chicken Soup",
                S.of(context).aboutDescription,
                "lib/assets/images/Chicken Soupe.png",
                "15",
                S.of(context).qtyLabel("1"),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).redeemedCustomersHeader,
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F1F1F),
                    ),
                  ),
                  Text(
                    S.of(context).viewAll,
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFF5216),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildCustomerTile(
                context,
                "Aicha Mint Ahmed",
                "+222 62345678",
                "2000",
                "Feb 18 2025, 10:23 AM",
              ),
              const SizedBox(height: 12),
              _buildCustomerTile(
                context,
                "Aicha Mint Ahmed",
                "+222 62345678",
                "2000",
                "Feb 18 2025, 10:23 AM",
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBox(
    BuildContext context,
    String label,
    String value, {
    bool isFullWidth = false,
  }) {
    return Expanded(
      flex: isFullWidth ? 2 : 1,
      child: Container(
        height: isFullWidth ? 70 : 64,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: GoogleFonts.rubik(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.rubik(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F1F1F),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasketItemTile(
    BuildContext context,
    String name,
    String desc,
    String image,
    String id,
    String qty,
  ) {
    return Container(
      width: 358,
      height: 121,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ID: #$id",
                  style: GoogleFonts.rubik(
                    fontSize: 10,
                    color: const Color(0xFF94A3B8),
                    fontWeight: FontWeight.w500,
                  ),
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
                Text(
                  desc,
                  style: GoogleFonts.rubik(
                    fontSize: 11,
                    color: const Color(0xFF94A3B8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    qty,
                    style: GoogleFonts.rubik(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F1F1F),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerTile(
    BuildContext context,
    String name,
    String phone,
    String points,
    String date,
  ) {
    return Container(
      width: 358,
      height: 161,
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFEEF2FF),
                child: Text(
                  "AM",
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF5216),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F1F1F),
                      ),
                    ),
                    Text(
                      phone,
                      style: GoogleFonts.rubik(
                        fontSize: 11,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  S.of(context).redeemedStatus,
                  style: GoogleFonts.rubik(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF22C55E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).pointsLabel,
                      style: GoogleFonts.rubik(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      points,
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F1F1F),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).dateLabel,
                      style: GoogleFonts.rubik(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F1F1F),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
