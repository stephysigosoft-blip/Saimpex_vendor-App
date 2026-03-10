import 'package:flutter/material.dart';

class ShimmerLoadingRestaurants extends StatefulWidget {
  @override
  State<ShimmerLoadingRestaurants> createState() =>
      _ShimmerLoadingRestaurantsState();
}

class _ShimmerLoadingRestaurantsState extends State<ShimmerLoadingRestaurants>
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

    _animation = Tween<double>(
      begin: -2.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Section header shimmer
              _buildSectionHeaderShimmer(),

              const SizedBox(height: 12),

              // Restaurant list shimmer
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildRestaurantItemShimmer();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Section header shimmer
  Widget _buildSectionHeaderShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildShimmerContainer(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.3,
            borderRadius: 4,
          ),
          _buildShimmerContainer(height: 16, width: 60, borderRadius: 4),
        ],
      ),
    );
  }

  // Restaurant item shimmer
  Widget _buildRestaurantItemShimmer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
      ),
      child: Column(
        children: [
          // Image shimmer
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: _buildShimmerContainer(
              height: MediaQuery.of(context).size.height * 0.18,
              width: double.infinity,
              borderRadius: 0,
            ),
          ),

          // Details shimmer
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and rating row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildShimmerContainer(
                        height: 18,
                        width: MediaQuery.of(context).size.width * 0.4,
                        borderRadius: 4,
                      ),
                    ),
                    const SizedBox(width: 10),
                    _buildShimmerContainer(
                      height: 24,
                      width: 50,
                      borderRadius: 15,
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Time and distance row
                Row(
                  children: [
                    _buildShimmerContainer(
                      height: 14,
                      width: 80,
                      borderRadius: 4,
                    ),
                    const SizedBox(width: 15),
                    _buildShimmerContainer(
                      height: 14,
                      width: 60,
                      borderRadius: 4,
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Offer shimmer
                _buildShimmerContainer(
                  height: 14,
                  width: MediaQuery.of(context).size.width * 0.25,
                  borderRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable shimmer container
  Widget _buildShimmerContainer({
    required double height,
    required double width,
    required double borderRadius,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius > 0
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        gradient: LinearGradient(
          begin: Alignment(_animation.value - 1, 0),
          end: Alignment(_animation.value, 0),
          colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
