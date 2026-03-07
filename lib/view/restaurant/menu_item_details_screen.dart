import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/generated/l10n.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

class MenuItemDetailsScreen extends StatelessWidget {
  final String itemId;

  const MenuItemDetailsScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          S.of(context).basketDetailsTitle,
          style: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F1F1F),
          ),
        ),
        centerTitle: false,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Main Image ──────────────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'lib/assets/images/Burger.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: double.infinity,
                  height: 200,
                  color: const Color(0xFFF1F5F9),
                  child: const Icon(
                    Icons.fastfood,
                    size: 60,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ── Name & Status ───────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).grilledChicken,
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F1F1F),
                  ),
                ),
                _statusBadge(context, S.of(context).availableStatus, true),
              ],
            ),
            const SizedBox(height: 20),

            // ── Property List ───────────────────────────────────────
            _propertyRow(context, S.of(context).itemIdLabel, '# $itemId'),
            _propertyRow(
              context,
              S.of(context).priceLabel.toLowerCase(),
              '39.00 MRU',
              isPrice: true,
            ),
            _propertyRow(context, S.of(context).serialNoLabel, '788'),
            _propertyRow(
              context,
              S.of(context).preparationTimeLabel,
              '7 ${S.of(context).mins}',
            ),
            _propertyRow(context, S.of(context).categoryLabel, 'Juice'),
            _tagRow(context, S.of(context).tagsLabel, 'Organic'),

            const SizedBox(height: 32),

            // ── AVAILABLE TIME ──────────────────────────────────────
            _sectionHeader(context, S.of(context).availableTimeHeader),
            const SizedBox(height: 12),
            _buildAvailableTimeCard(context),

            const SizedBox(height: 32),

            // ── SALES & PERFORMANCE ─────────────────────────────────
            _sectionHeader(context, S.of(context).salesPerformanceHeader),
            const SizedBox(height: 12),
            _buildSalesPerformanceCard(context),

            const SizedBox(height: 32),

            // ── ITEM ORDERS ─────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _sectionHeader(context, S.of(context).itemOrdersHeader),
                Text(
                  S.of(context).viewAll,
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFF5216),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildOrderCard(context),

            const SizedBox(height: 100), // Spacing for bottom button
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              // TODO: Update logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5216),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              S.of(context).updateDetailsButton,
              style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _statusBadge(BuildContext context, String text, bool isAvailable) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFDCFCE7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF22C55E),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.rubik(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF22C55E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _propertyRow(
    BuildContext context,
    String label,
    String value, {
    bool isPrice = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 14,
              color: const Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isPrice
                  ? const Color(0xFFFF5216)
                  : const Color(0xFF1F1F1F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tagRow(BuildContext context, String label, String tag) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 14,
              color: const Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tag,
              style: GoogleFonts.rubik(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F1F1F),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1F1F1F),
      ),
    );
  }

  Widget _buildAvailableTimeCard(BuildContext context) {
    final List<String> days = [
      S.of(context).monday,
      S.of(context).tuesday,
      S.of(context).wednesday,
      S.of(context).thursday,
      S.of(context).friday,
      S.of(context).saturday,
      S.of(context).sunday,
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: days.map((day) {
          bool isLast = day == days.last;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day,
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1F1F1F),
                      ),
                    ),
                    Text(
                      S.of(context).byHotelLabel,
                      style: GoogleFonts.rubik(
                        fontSize: 10,
                        color: const Color(0xFF94A3B8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  S.of(context).hr24,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F1F1F),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSalesPerformanceCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildStatMiniCard(
                  context,
                  S.of(context).totalOrdersStat,
                  '124',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatMiniCard(
                  context,
                  S.of(context).revenueLabel,
                  '4.8k',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _propertyRowWithIcon(
            context,
            S.of(context).averageRatingLabel,
            '4.8',
            Icons.star,
            const Color(0xFFF59E0B),
          ),
          _propertyRowSimple(context, S.of(context).totalReviewsStat, '12'),
          _propertyRowSimple(
            context,
            S.of(context).lastPurchaseLabel,
            '2 ${S.of(context).hAgo}',
          ),
        ],
      ),
    );
  }

  Widget _buildStatMiniCard(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 10,
              color: const Color(0xFF94A3B8),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.rubik(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F1F1F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _propertyRowWithIcon(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color iconColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 14,
              color: const Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Icon(icon, size: 14, color: iconColor),
              const SizedBox(width: 4),
              Text(
                value,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _propertyRowSimple(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 14,
              color: const Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F1F1F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).orderIdLabel('ORD-882111'),
                style: GoogleFonts.rubik(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFF5216),
                ),
              ),
              _buildDeliverBadge(context),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Aicha Mint Ahmed',
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F1F1F),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).itemsTotalLabel,
                    style: GoogleFonts.rubik(
                      fontSize: 10,
                      color: const Color(0xFF94A3B8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '3 ${S.of(context).items} • 42.50 MRU',
                    style: GoogleFonts.rubik(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF5216),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).dateTimeLabel,
                    style: GoogleFonts.rubik(
                      fontSize: 10,
                      color: const Color(0xFF94A3B8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Feb 07, 2026 10:45 A.M, ${S.of(context).today}',
                    style: GoogleFonts.rubik(
                      fontSize: 10,
                      color: const Color(0xFF94A3B8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF166534),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        S.of(context).delivered.toUpperCase(),
        style: GoogleFonts.rubik(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
