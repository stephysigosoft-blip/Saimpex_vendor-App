import 'package:flutter/material.dart';

class ShimmerProfile extends StatefulWidget {
  const ShimmerProfile({super.key});

  @override
  State<ShimmerProfile> createState() => _ShimmerProfileState();
}

class _ShimmerProfileState extends State<ShimmerProfile>
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
    final size = media.size;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            // Background image placeholder
            Positioned.fill(child: Container(color: Colors.grey[50])),
            SingleChildScrollView(
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.08),
                    // Points floating widget shimmer
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: size.width * 0.04),
                        child: _buildShimmerContainer(
                          height: size.height * 0.04,
                          width: size.width * 0.25,
                          borderRadius: size.width * 0.02,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    // Profile picture shimmer (circle)
                    _buildShimmerContainer(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      borderRadius: size.width * 0.125,
                    ),
                    SizedBox(height: size.height * 0.01),
                    // Name shimmer
                    _buildShimmerContainer(
                      height: size.height * 0.02,
                      width: size.width * 0.3,
                      borderRadius: size.width * 0.01,
                    ),
                    SizedBox(height: size.height * 0.01),
                    // Phone number shimmer
                    _buildShimmerContainer(
                      height: size.height * 0.015,
                      width: size.width * 0.4,
                      borderRadius: size.width * 0.01,
                    ),
                    SizedBox(height: size.height * 0.04),
                    // Language selection shimmer
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(size.width * 0.01),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(
                            size.width * 0.05,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildShimmerContainer(
                                height: size.height * 0.04,
                                width: double.infinity,
                                borderRadius: size.width * 0.05,
                              ),
                            ),
                            SizedBox(width: size.width * 0.01),
                            Expanded(
                              child: _buildShimmerContainer(
                                height: size.height * 0.04,
                                width: double.infinity,
                                borderRadius: size.width * 0.05,
                              ),
                            ),
                            SizedBox(width: size.width * 0.01),
                            Expanded(
                              child: _buildShimmerContainer(
                                height: size.height * 0.04,
                                width: double.infinity,
                                borderRadius: size.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    // First menu card shimmer
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                      ),
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            size.width * 0.04,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Column(
                            children: [
                              _buildMenuItemShimmer(media),
                              SizedBox(height: size.height * 0.01),
                              _buildMenuItemShimmer(media),
                              SizedBox(height: size.height * 0.01),
                              _buildMenuItemShimmer(media),
                              SizedBox(height: size.height * 0.01),
                              _buildMenuItemShimmer(media),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    // Second menu card shimmer
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                      ),
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            size.width * 0.04,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Column(
                            children: [
                              _buildMenuItemShimmer(media),
                              SizedBox(height: size.height * 0.01),
                              _buildMenuItemShimmer(media),
                              SizedBox(height: size.height * 0.01),
                              _buildMenuItemShimmer(media),
                              SizedBox(height: size.height * 0.01),
                              _buildMenuItemShimmer(media),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    // Social media buttons shimmer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: size.width * 0.04),
                        _buildShimmerContainer(
                          height: size.width * 0.12,
                          width: size.width * 0.12,
                          borderRadius: size.width * 0.06,
                        ),
                        SizedBox(width: size.width * 0.04),
                        _buildShimmerContainer(
                          height: size.width * 0.12,
                          width: size.width * 0.12,
                          borderRadius: size.width * 0.06,
                        ),
                        SizedBox(width: size.width * 0.04),
                        _buildShimmerContainer(
                          height: size.width * 0.12,
                          width: size.width * 0.12,
                          borderRadius: size.width * 0.06,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.1),
                  ],
                ),
              ),
            ),
            // Back button shimmer
            Positioned(
              top: size.height * 0.08,
              left: size.width * 0.03,
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.02),
                child: _buildShimmerContainer(
                  height: size.width * 0.05,
                  width: size.width * 0.05,
                  borderRadius: size.width * 0.01,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuItemShimmer(MediaQueryData media) {
    final size = media.size;
    return Row(
      children: [
        // Icon shimmer
        _buildShimmerContainer(
          height: size.width * 0.06,
          width: size.width * 0.06,
          borderRadius: size.width * 0.01,
        ),
        SizedBox(width: size.width * 0.04),
        // Text shimmer
        Expanded(
          child: _buildShimmerContainer(
            height: size.height * 0.02,
            width: double.infinity,
            borderRadius: size.width * 0.01,
          ),
        ),
        SizedBox(width: size.width * 0.02),
        // Arrow icon shimmer
        _buildShimmerContainer(
          height: size.width * 0.04,
          width: size.width * 0.04,
          borderRadius: size.width * 0.01,
        ),
      ],
    );
  }

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
