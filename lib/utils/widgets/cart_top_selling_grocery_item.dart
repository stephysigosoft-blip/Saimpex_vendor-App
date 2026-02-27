import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/api_configs.dart';
import '../../model/cart_model.dart';
import '../../resources/colors.dart';
import '../Utils.dart';

class CartTopSellingGroceryItem extends StatefulWidget {
  final String? imageUrl;
  final String? name;
  final String? price;
  final VoidCallback? onAdd;
  final AvailabilityTiming? availabilityTime;
  final String? restaurantId;

  const CartTopSellingGroceryItem({
    super.key,
    this.imageUrl,
    this.name,
    this.price,
    this.onAdd,
    this.availabilityTime,
    this.restaurantId,
  });

  @override
  State<CartTopSellingGroceryItem> createState() =>
      _CartTopSellingGroceryItemState();
}

class _CartTopSellingGroceryItemState extends State<CartTopSellingGroceryItem> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: ApiConfigs.IMAGE_URL + widget.imageUrl!,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Image.asset(
                        'lib/assets/images/logo.png',
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      'lib/assets/images/logo.png',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name ?? "",
                    style: GoogleFonts.rubik(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${getCurrencySymbol()}${widget.price ?? "0"}",
                        style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: colorPrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onAdd,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: colorPrimary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
