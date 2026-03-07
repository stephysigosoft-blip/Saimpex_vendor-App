import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/generated/l10n.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:saimpex_vendor/utils/widgets/custom_search_box.dart';
import 'package:saimpex_vendor/view/restaurant/add_menu_screen.dart';
import 'package:saimpex_vendor/view/restaurant/add_items_screen.dart';
import 'package:saimpex_vendor/view/restaurant/menu_item_details_screen.dart';
import 'package:saimpex_vendor/view/restaurant/basket_details_screen.dart';

class VendorRestaurantScreen extends StatefulWidget {
  const VendorRestaurantScreen({super.key});

  @override
  State<VendorRestaurantScreen> createState() => _VendorRestaurantScreenState();
}

class _VendorRestaurantScreenState extends State<VendorRestaurantScreen> {
  String selectedMenu = "Account";
  bool isInstructionsExpanded = false;

  String _getLocalizedMenuTitle(String title) {
    if (title == "Account") return S.of(context).home;
    if (title == "Working Hours") return S.of(context).workingHours;
    if (title == "Leaves") return S.of(context).leaves;
    if (title == "Menu") return S.of(context).menu;
    if (title == "Items") return S.of(context).items;
    if (title == "Menu Bulk Import") return S.of(context).menuBulkImport;
    if (title == "Basket") return S.of(context).basket;
    if (title == "Received Payouts") return S.of(context).receivedPayouts;
    if (title == "Restaurant Reports") return S.of(context).restaurantReports;
    return title;
  }

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
                    S.of(context).restaurantOne,
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
                height: 480,
                child: Column(
                  children: [
                    _detailRow("Joined on", "Feb 23, 2025, 11:30 AM"),
                    _detailRow("Status", "Approved", isStatus: true),
                    _detailRow("Vendor Type", "Individual"),
                    _detailRow("Zone", "Main Zone"),
                    _detailRow("Username", "Vendor_Admin"),
                    _detailRow("Address", "123 Business Rd, Suite 4B"),
                    _detailRow("Coordinates", "25.276987, 55.296249"),
                    _detailRow("Owner Name", "John Doe"),
                    _detailRow("Owner Email", "john.doe@example.com"),
                    _detailRow("Owner Phone", "+1 234 567 8900"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("BANK DETAILS"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 140,
                child: Column(
                  children: [
                    _detailRow("Bank Name", "Emirates NBD"),
                    _detailRow("Account Name", "Restaurant One LLC"),
                    _detailRow(
                      "Account Number",
                      "12345678901234567",
                      isBoldValue: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("ABOUT THE RESTAURANT"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 120,
                child: Text(
                  S.of(context).aboutDescription,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("REGISTRATION DETAILS"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 180,
                child: Column(
                  children: [
                    _detailRow("Trade License No", "TL-2025-001"),
                    _detailRow("Vat/Gst Number", "VAT-987654321"),
                    _detailRow("National Id Type", "Emirates ID"),
                    _detailRow("National Id Number", "784-1980-1234567-1"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("PAYMENT DETAILS"),
              const SizedBox(height: 12),
              _buildDetailCard(
                height: 180,
                child: Column(
                  children: [
                    _detailRow("Service Delivery Charge", "\$10.00"),
                    _detailRow(
                      "Restaurant Commission Percentage per Order",
                      "15%",
                    ),
                    _detailRow("Gst/Vat", "5%"),
                    _detailRow("Packaging Cost", "\$2.50"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionHeader("OWNER IDENTITY PROOF"),
              const SizedBox(height: 12),
              _buildImageCard(S.of(context).identityProofDocument),
              const SizedBox(height: 24),
              _sectionHeader("CERTIFICATES"),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildImageCard(
                      S.of(context).tradeLicense,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildImageCard(
                      S.of(context).foodPermit,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _sectionHeader("RATING & REVIEWS"),
              const SizedBox(height: 12),
              _buildRatingCard(),
              const SizedBox(height: 20),
            ] else if (selectedMenu == "Leaves") ...[
              const SizedBox(height: 20),
              _sectionHeader("MARK LEAVE"),
              const SizedBox(height: 12),
              _buildLeaveForm(),
              const SizedBox(height: 24),
              _sectionHeader("LEAVES HISTORY"),
              const SizedBox(height: 12),
              _buildLeaveHistory(),
              const SizedBox(height: 20),
            ] else if (selectedMenu == "Working Hours") ...[
              const SizedBox(height: 20),
              _sectionHeader("WORKING HOURS"),
              const SizedBox(height: 12),
              _buildWorkingHoursList(),
              const SizedBox(height: 20),
            ] else if (selectedMenu == "Menu") ...[
              const SizedBox(height: 20),
              _sectionHeader("ALL MENUS"),
              const SizedBox(height: 12),
              _buildMenuList(),
              const SizedBox(height: 20),
            ] else if (selectedMenu == "Items") ...[
              const SizedBox(height: 20),
              CustomSearchBox(
                hintText: S.of(context).searchByIdName,
                boxColor: Colors.white,
              ),
              const SizedBox(height: 20),
              _sectionHeader("ALL ITEMS"),
              const SizedBox(height: 12),
              _buildItemsList(),
              const SizedBox(height: 20),
            ] else if (selectedMenu == "Menu Bulk Import") ...[
              const SizedBox(height: 20),
              _sectionHeader("MENU BULK IMPORT"),
              const SizedBox(height: 24),
              _buildBulkImportInstructions(),
              const SizedBox(height: 24),
              _buildImportSteps(),
              const SizedBox(height: 40),
            ] else if (selectedMenu == "Basket") ...[
              const SizedBox(height: 20),
              _sectionHeader("BASKETS"),
              const SizedBox(height: 12),
              _buildBasketList(),
              const SizedBox(height: 20),
            ] else if (selectedMenu == "Received Payouts") ...[
              const SizedBox(height: 20),
              _sectionHeader("RECEIVED PAYOUTS"),
              const SizedBox(height: 12),
              _buildPayoutsList(),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildWorkingHoursList() {
    final days = [
      S.of(context).monday,
      S.of(context).tuesday,
      S.of(context).wednesday,
      S.of(context).thursday,
      S.of(context).friday,
      S.of(context).saturday,
      S.of(context).sunday,
    ];
    return Column(
      children: days.map((day) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildDetailCard(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  day,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1F1F1F),
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
                    S.of(context).hr24,
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFF5216),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
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
            _getLocalizedMenuTitle(title),
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
    String localizedTitle = title;
    if (title == "RESTAURANT DETAILS") {
      localizedTitle = S.of(context).restaurantDetails;
    } else if (title == "BANK DETAILS") {
      localizedTitle = S.of(context).bankDetails;
    } else if (title == "ABOUT THE RESTAURANT") {
      localizedTitle = S.of(context).aboutTheRestaurant;
    } else if (title == "REGISTRATION DETAILS") {
      localizedTitle = S.of(context).registrationDetails;
    } else if (title == "PAYMENT DETAILS") {
      localizedTitle = S.of(context).paymentSummaryDetails;
    } else if (title == "OWNER IDENTITY PROOF") {
      localizedTitle = S.of(context).ownerIdentityProof;
    } else if (title == "CERTIFICATES") {
      localizedTitle = S.of(context).certificates;
    } else if (title == "RATING & REVIEWS") {
      localizedTitle = S.of(context).ratingReviews;
    } else if (title == "MARK LEAVE") {
      localizedTitle = S.of(context).markLeave;
    } else if (title == "LEAVES HISTORY") {
      localizedTitle = S.of(context).leavesHistory;
    } else if (title == "WORKING HOURS") {
      localizedTitle = S.of(context).workingHours;
    } else if (title == "ALL MENUS") {
      localizedTitle = S.of(context).allMenus;
    } else if (title == "ALL ITEMS") {
      localizedTitle = S.of(context).allItems;
    } else if (title == "MENU BULK IMPORT") {
      localizedTitle = S.of(context).menuBulkImport;
    } else if (title == "BASKETS") {
      localizedTitle = S.of(context).basket;
    } else if (title == "RECEIVED PAYOUTS") {
      localizedTitle = S.of(context).receivedPayouts;
    } else if (title == "RESTAURANT REPORTS") {
      localizedTitle = S.of(context).restaurantReports;
    }

    return Text(
      localizedTitle,
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
    String localizedLabel = label;
    if (label == "Joined on") localizedLabel = S.of(context).joinedOn;
    if (label == "Status") localizedLabel = S.of(context).status;
    if (label == "Vendor Type") localizedLabel = S.of(context).vendorType;
    if (label == "Zone") localizedLabel = S.of(context).zone;
    if (label == "Username") localizedLabel = S.of(context).username;
    if (label == "Address") localizedLabel = S.of(context).address;
    if (label == "Coordinates") localizedLabel = S.of(context).coordinates;
    if (label == "Owner Name") localizedLabel = S.of(context).ownerName;
    if (label == "Owner Email") localizedLabel = S.of(context).ownerEmail;
    if (label == "Owner Phone") localizedLabel = S.of(context).ownerPhone;
    if (label == "Bank Name") localizedLabel = S.of(context).bankName;
    if (label == "Account Name") localizedLabel = S.of(context).accountName;
    if (label == "Account Number") localizedLabel = S.of(context).accountNumber;
    if (label == "Trade License No")
      localizedLabel = S.of(context).tradeLicenseNo;
    if (label == "Vat/Gst Number") localizedLabel = S.of(context).vatGstNumber;
    if (label == "National Id Type")
      localizedLabel = S.of(context).nationalIdType;
    if (label == "National Id Number")
      localizedLabel = S.of(context).nationalIdNumber;
    if (label == "Service Delivery Charge")
      localizedLabel = S.of(context).serviceDeliveryCharge;
    if (label == "Restaurant Commission Percentage per Order")
      localizedLabel = S.of(context).restaurantCommission;
    if (label == "Gst/Vat") localizedLabel = S.of(context).gstVat;
    if (label == "Packaging Cost") localizedLabel = S.of(context).packagingCost;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            localizedLabel,
            style: GoogleFonts.rubik(
              fontSize: 14,
              color: const Color(0xFF6B7280),
            ),
          ),
          if (isStatus)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFDCFCE7)),
              ),
              child: Text(
                value,
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF166534),
                ),
              ),
            )
          else
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: isBoldValue ? FontWeight.bold : FontWeight.w500,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String label, {double width = 350}) {
    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 180),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder Image Area
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFEEF2FF),
                child: Text(
                  "R1",
                  style: GoogleFonts.rubik(
                    color: const Color(0xFFFF5216),
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
                        Expanded(
                          child: Text(
                            S.of(context).restaurantOne,
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F1F1F),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "4.6",
                          style: GoogleFonts.rubik(
                            color: const Color(0xFFF59E0B),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Continental & Oriental",
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Color(0xFF6B7280),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "Business Bay, Dubai",
                            style: GoogleFonts.rubik(
                              fontSize: 12,
                              color: const Color(0xFF6B7280),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
            label,
            style: GoogleFonts.rubik(
              fontSize: 12,
              color: const Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                S.of(context).clickToView,
                style: GoogleFonts.rubik(
                  color: const Color(0xFF6B7280),
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingCard() {
    return _buildDetailCard(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "4.6",
            style: GoogleFonts.rubik(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFF5216),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_half,
                    color: const Color(0xFFF59E0B),
                    size: 20,
                  );
                }),
              ),
              const SizedBox(height: 8),
              Text(
                "Based on 128 reviews",
                style: GoogleFonts.rubik(
                  color: const Color(0xFF6B7280),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveForm() {
    return _buildDetailCard(
      height: 250,
      child: Column(
        children: [
          _detailRow(S.of(context).startDate, "Mar 10, 2025"),
          _detailRow(S.of(context).endDate, "Mar 12, 2025"),
          _detailRow(S.of(context).durationLabel, "3 Days"),
          _detailRow(S.of(context).reasonLabel, "System Maintenance"),
          const SizedBox(height: 12),
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
              ),
              child: Text(
                S.of(context).submitLeaveRequest,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveHistory() {
    return _buildDetailCard(
      height: 150,
      child: Column(
        children: [
          _detailRow("Feb 10-12", "Annual Leave"),
          _detailRow(S.of(context).status, "Approved", isStatus: true),
          _detailRow(S.of(context).applyOn, "Feb 01, 2025"),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    return Column(
      children: [
        _menuItem(S.of(context).lunchMenu, "24 Items"),
        const SizedBox(height: 12),
        _menuItem(S.of(context).dinnerSpecial, "18 Items"),
        const SizedBox(height: 12),
        _menuItem(S.of(context).breakfast, "12 Items"),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddMenuScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5216),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              S.of(context).addNewMenu,
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _menuItem(String name, String count) {
    return _buildDetailCard(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
              Text(
                count,
                style: GoogleFonts.rubik(
                  fontSize: 13,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Color(0xFF6B7280)),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Color(0xFFEF4444)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return Column(
      children: [
        _foodItem(S.of(context).grilledChicken, "\$25.00"),
        const SizedBox(height: 12),
        _foodItem(S.of(context).vegBurger, "\$15.00"),
        const SizedBox(height: 12),
        _foodItem(S.of(context).sushiPlatter, "\$45.00"),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddItemsScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5216),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              S.of(context).addNewItem,
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _foodItem(String name, String price) {
    return _buildDetailCard(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.fastfood, color: Color(0xFFFF5216)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F1F1F),
                  ),
                ),
                Text(
                  price,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    color: const Color(0xFFFF5216),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MenuItemDetailsScreen(itemId: "33"),
                ),
              );
            },
            icon: const Icon(Icons.chevron_right, color: Color(0xFF6B7280)),
          ),
        ],
      ),
    );
  }

  Widget _buildBulkImportInstructions() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF6366F1).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, color: Color(0xFF4F46E1)),
              const SizedBox(width: 10),
              Text(
                "Instructions",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4F46E1),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    isInstructionsExpanded = !isInstructionsExpanded;
                  });
                },
                icon: Icon(
                  isInstructionsExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: const Color(0xFF4F46E1),
                ),
              ),
            ],
          ),
          if (isInstructionsExpanded) ...[
            const SizedBox(height: 12),
            Text(
              "1. Download the template file.\n"
              "2. Fill in the menu details as per the format.\n"
              "3. Ensure all mandatory fields are filled.\n"
              "4. Upload the completed file below.",
              style: GoogleFonts.rubik(
                fontSize: 14,
                color: const Color(0xFF4338CA),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 160,
              height: 36,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF4F46E1)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Download Template",
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4F46E1),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildImportSteps() {
    return Column(
      children: [
        _importStep(1, "Upload File", "Select your completed menu file"),
        const SizedBox(height: 16),
        _importStep(2, "Review Data", "Verify the imported items"),
        const SizedBox(height: 16),
        _importStep(3, "Complete", "Finalize the bulk import"),
        const SizedBox(height: 32),
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_upload_outlined,
                size: 32,
                color: Color(0xFF9CA3AF),
              ),
              const SizedBox(height: 8),
              Text(
                "Click or drag file to upload",
                style: GoogleFonts.rubik(
                  color: const Color(0xFF6B7280),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _importStep(int number, String title, String subtitle) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFFFF5216),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F1F1F),
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.rubik(
                fontSize: 12,
                color: const Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBasketList() {
    return Column(
      children: [
        _basketItem(
          S.of(context).classicBasket,
          "10 Items",
          S.of(context).activeLabel,
        ),
        const SizedBox(height: 12),
        _basketItem(
          S.of(context).comboOffer,
          "5 Items",
          S.of(context).inactiveLabel,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BasketDetailsScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5216),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              S.of(context).createNewBasket,
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _basketItem(String name, String count, String status) {
    return _buildDetailCard(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
              Text(
                count,
                style: GoogleFonts.rubik(
                  fontSize: 13,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: (status == "Active" || status == S.of(context).activeLabel)
                  ? const Color(0xFFF0FDF4)
                  : const Color(0xFFFEF2F2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: GoogleFonts.rubik(
                fontSize: 12,
                color:
                    (status == "Active" || status == S.of(context).activeLabel)
                    ? const Color(0xFF166534)
                    : const Color(0xFF991B1B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPayoutsList() {
    return Column(
      children: [
        _payoutItem("PO-2025-001", "Mar 01, 2025", "\$450.00"),
        const SizedBox(height: 12),
        _payoutItem("PO-2025-002", "Feb 23, 2025", "\$320.50"),
        const SizedBox(height: 12),
        _payoutItem("PO-2025-003", "Feb 15, 2025", "\$580.00"),
      ],
    );
  }

  Widget _payoutItem(String id, String date, String amount) {
    return _buildDetailCard(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                id,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
              Text(
                date,
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF166534),
            ),
          ),
        ],
      ),
    );
  }
}
