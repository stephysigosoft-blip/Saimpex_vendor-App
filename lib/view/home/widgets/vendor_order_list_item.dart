import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/view/home/vendor_order_details.dart';
import 'package:saimpex_vendor/view/home/widgets/vendor_order_card.dart';

class VendorOrderListItem extends StatelessWidget {
  const VendorOrderListItem({
    super.key,
    required this.horizontalPadding,
    required this.orderId,
    required this.customerName,
    required this.itemsCount,
    required this.price,
    required this.dateTime,
    required this.status,
    required this.onAccept,
    this.deliveryBoyName,
  });

  final double horizontalPadding;
  final String orderId;
  final String customerName;
  final int itemsCount;
  final double price;
  final String dateTime;
  final String status;
  final VoidCallback onAccept;
  final String? deliveryBoyName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: VendorOrderCard(
        orderId: orderId,
        customerName: customerName,
        itemsCount: itemsCount,
        price: price,
        dateTime: dateTime,
        status: status,
        onReject: () {},
        onAccept: onAccept,
        deliveryBoyName: deliveryBoyName,
        onTap: () {
          if (status.toLowerCase() != 'cancelled') {
            Get.to(() => VendorOrderDetails(orderId: orderId.toString()));
          }
        },
      ),
    );
  }
}
