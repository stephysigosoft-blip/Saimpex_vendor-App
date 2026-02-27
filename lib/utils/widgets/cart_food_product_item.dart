import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/api_configs.dart';
import '../../resources/colors.dart';
import '../Utils.dart';

class CartFoodProductItem extends StatefulWidget {
  final String? imageUrl;
  final String? name;
  final String? description;
  final String? price;
  final String? quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onDelete;

  const CartFoodProductItem({
    super.key,
    this.imageUrl,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.onIncrement,
    this.onDecrement,
    this.onDelete,
  });

  @override
  State<CartFoodProductItem> createState() => _CartFoodProductItemState();
}

class _CartFoodProductItemState extends State<CartFoodProductItem> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: ApiConfigs.IMAGE_URL + widget.imageUrl!,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      'lib/assets/images/logo.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    'lib/assets/images/logo.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
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
                        widget.name ?? "",
                        style: GoogleFonts.rubik(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onDelete,
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                if (widget.description != null &&
                    widget.description!.isNotEmpty)
                  Text(
                    widget.description!,
                    style: GoogleFonts.rubik(fontSize: 12, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${getCurrencySymbol()}${widget.price ?? "0"}",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colorPrimary,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: widget.onDecrement,
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.remove, size: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              widget.quantity ?? "1",
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onIncrement,
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.add, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
