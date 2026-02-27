import 'package:flutter/material.dart';

class ShimmerMyPointsLoading extends StatefulWidget {
  const ShimmerMyPointsLoading({super.key});

  @override
  State<ShimmerMyPointsLoading> createState() => _ShimmerMyPointsLoadingState();
}

class _ShimmerMyPointsLoadingState extends State<ShimmerMyPointsLoading>
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
    final media = MediaQuery.of(context);
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: media.size.height * 0.02),
              _buildPointsSummaryShimmer(media),
              SizedBox(height: media.size.height * 0.03),
              _buildTabNavigationShimmer(media),
              SizedBox(height: media.size.height * 0.02),
              _buildRewardCardShimmer(media, isCompleted: false),
              SizedBox(height: media.size.height * 0.02),
              _buildRewardCardShimmer(media, isCompleted: true),
              SizedBox(height: media.size.height * 0.02),
              _buildRewardCardShimmer(media, isCompleted: false),
            ],
          ),
        );
      },
    );
  }

 
  Widget _buildPointsSummaryShimmer(MediaQueryData media) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.4, 1.0],
            colors: [Colors.grey[300]!, Colors.grey[200]!],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerContainer(
                    height: media.size.height * 0.02,
                    width: media.size.width * 0.12,
                    borderRadius: 4,
                  ),
                  SizedBox(height: media.size.height * 0.01),
                  _buildShimmerContainer(
                    height: media.size.height * 0.014,
                    width: media.size.width * 0.1,
                    borderRadius: 4,
                  ),
                  SizedBox(height: media.size.height * 0.01),
                  _buildShimmerContainer(
                    height: media.size.height * 0.014,
                    width: media.size.width * 0.14,
                    borderRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(width: media.size.width * 0.05),
            _buildShimmerContainer(
              height: media.size.height * 0.1,
              width: media.size.width * 0.18,
              borderRadius: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabNavigationShimmer(MediaQueryData media) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // First tab shimmer (selected)
          Expanded(
            child: _buildShimmerContainer(
              height: media.size.height * 0.04,
              width: double.infinity,
              borderRadius: 20,
            ),
          ),
          SizedBox(width: media.size.width * 0.03),
          Expanded(
            child: _buildShimmerContainer(
              height: media.size.height * 0.04,
              width: double.infinity,
              borderRadius: media.size.width * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  // Reward Card Shimmer
  Widget _buildRewardCardShimmer(
    MediaQueryData media, {
    required bool isCompleted,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image shimmer
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: _buildShimmerContainer(
                height: media.size.height * 0.20,
                width: double.infinity,
                borderRadius: 0,
              ),
            ),
            // Content shimmer
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerContainer(
                    height: media.size.height * 0.018,
                    width: media.size.width * 0.12,
                    borderRadius: 4,
                  ),
                  SizedBox(height: media.size.height * 0.01),
                  _buildShimmerContainer(
                    height: media.size.height * 0.014,
                    width: double.infinity,
                    borderRadius: 4,
                  ),
                  SizedBox(height: media.size.height * 0.005),
                  _buildShimmerContainer(
                    height: media.size.height * 0.014,
                    width: media.size.width * 0.2,
                    borderRadius: 4,
                  ),
                  SizedBox(height: media.size.height * 0.02),
                  _buildShimmerContainer(
                    height: media.size.height * 0.014,
                    width: media.size.width * 0.08,
                    borderRadius: 4,
                  ),
                  SizedBox(height: media.size.height * 0.01),
                  // Progress bar shimmer
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _buildShimmerContainer(
                            height: media.size.height * 0.015,
                            width: double.infinity,
                            borderRadius: 0,
                          ),
                        ),
                      ),
                      SizedBox(width: media.size.width * 0.03),
                      _buildShimmerContainer(
                        height: media.size.height * 0.014,
                        width: media.size.width * 0.06,
                        borderRadius: 4,
                      ),
                    ],
                  ),
                  SizedBox(height: media.size.height * 0.02),
                  // Button shimmer
                  _buildShimmerContainer(
                    height: media.size.height * 0.045,
                    width: double.infinity,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
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
