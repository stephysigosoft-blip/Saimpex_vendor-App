import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VendorStatusTabs extends StatelessWidget {
  const VendorStatusTabs({
    super.key,
    required this.height,
    required this.leftPadding,
    required this.tabWidth,
    required this.tabs,
    required this.tabCounts,
    required this.selectedTab,
    required this.onTabChanged,
  });

  final double height;
  final double leftPadding;
  final double tabWidth;
  final List<String> tabs;
  final Map<String, int> tabCounts;
  final String selectedTab;
  final ValueChanged<String> onTabChanged;

  Color _tabColor(String tab) {
    if (tab == "Pending") return const Color(0xFFF59E0B);
    if (tab == "Accepted" || tab == "Ready") return const Color(0xFF22C55E);
    if (tab == "Delivered") return const Color(0xFF15803D);
    if (tab == "Preparing") return const Color(0xFF60A5FA);
    if (tab == "Cancelled") return const Color(0xFFEF4444);
    return const Color(0xFFFF5216);
  }

  String _tabCount(String tab) {
    final count = tabCounts[tab] ?? 0;
    return count.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: EdgeInsets.only(left: leftPadding),
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isSelected = selectedTab == tab;
          final tabColor = _tabColor(tab);
          return GestureDetector(
            onTap: () => onTabChanged(tab),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: tabWidth,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? tabColor : Colors.white,
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(
                      color: isSelected ? tabColor : const Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      tab,
                      style: GoogleFonts.rubik(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ),
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
                        _tabCount(tab),
                        style: GoogleFonts.rubik(
                          color: tabColor,
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
    );
  }
}
