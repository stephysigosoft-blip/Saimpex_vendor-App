// Shimmer food product item widget
import 'package:flutter/material.dart';

class ShimmerFoodProductItem extends StatefulWidget {
  @override
  State<ShimmerFoodProductItem> createState() => ShimmerFoodProductItemState();
}

class ShimmerFoodProductItemState extends State<ShimmerFoodProductItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildShimmerBox({
    required double width,
    required double height,
    double? borderRadius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius)
            : null,
        gradient: LinearGradient(
          begin: Alignment(_animation.value - 1, 0),
          end: Alignment(_animation.value, 0),
          colors: [
            Colors.grey[300]!,
            Colors.grey[100]!,
            Colors.grey[300]!,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IMAGE SHIMMER
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: _buildShimmerBox(
                        width: double.infinity,
                        height: 100,
                        borderRadius: 12,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // NAME AND VEG/NON-VEG INDICATOR ROW
                    Row(
                      children: [
                        Expanded(
                          child: _buildShimmerBox(
                            width: double.infinity,
                            height: 16,
                            borderRadius: 4,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Card(
                          elevation: 3,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: _buildShimmerBox(
                              width: 12,
                              height: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),

                    // RATING SHIMMER
                    Row(
                      children: [
                        _buildShimmerBox(
                          width: 80,
                          height: 14,
                          borderRadius: 4,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // PRICE SHIMMER
                    Row(
                      children: [
                        _buildShimmerBox(
                          width: 80,
                          height: 16,
                          borderRadius: 4,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: _buildShimmerBox(
                            width: double.infinity,
                            height: 14,
                            borderRadius: 4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ADD BUTTON SHIMMER (positioned at bottom right)
            Positioned(
              bottom: 0,
              right: 10,
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 8,
                  ),
                  child: _buildShimmerBox(
                    width: 40,
                    height: 16,
                    borderRadius: 4,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
