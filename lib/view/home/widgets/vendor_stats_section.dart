import 'package:flutter/material.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_stat_card.dart';

class VendorStatsSection extends StatelessWidget {
  const VendorStatsSection({
    super.key,
    required this.horizontalPadding,
    required this.todayOrders,
    required this.totalOrders,
    required this.totalProducts,
  });

  final double horizontalPadding;
  final String todayOrders;
  final String totalOrders;
  final String totalProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VendorStatCard(
            title: "Today's Orders",
            value: todayOrders,
            icon: Icons.shopping_basket_outlined,
            backgroundColor: Color(0xFFE5E5FF),
            iconDecorationColor: Color(0xFF6B6BFF),
          ),
          VendorStatCard(
            title: "Total Orders",
            value: totalOrders,
            icon: Icons.account_balance_wallet_outlined,
            backgroundColor: Color(0xFFD9F9E7),
            iconDecorationColor: Color(0xFF00D15D),
          ),
          VendorStatCard(
            title: "Products",
            value: totalProducts,
            icon: Icons.shopping_bag_outlined,
            backgroundColor: Color(0xFFFFE5D9),
            iconDecorationColor: Color(0xFFFF5216),
          ),
        ],
      ),
    );
  }
}
