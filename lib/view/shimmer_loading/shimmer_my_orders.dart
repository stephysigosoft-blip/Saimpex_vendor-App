import 'package:flutter/material.dart';

class ShimmerMyOrders extends StatefulWidget {
  const ShimmerMyOrders({super.key});

  @override
  State<ShimmerMyOrders> createState() => _ShimmerMyOrdersState();
}

class _ShimmerMyOrdersState extends State<ShimmerMyOrders>
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
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.05,
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              _buildTabBarShimmer(),
              SizedBox(height: size.height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildOrderCardShimmer(isOngoing: true),
                      SizedBox(height: size.height * 0.02),
                      _buildOrderCardShimmer(isOngoing: false),
                      SizedBox(height: size.height * 0.02),
                      _buildOrderCardShimmer(isOngoing: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBarShimmer() {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(6),
      height: size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildShimmerContainer(
              height: size.height * 0.05,
              width: double.infinity,
              borderRadius: 25,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildShimmerContainer(
              height: size.height * 0.05,
              width: double.infinity,
              borderRadius: 25,
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildOrderCardShimmer({required bool isOngoing}) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order header section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _buildShimmerContainer(height: size.height * 0.05, width: size.width * 0.05, borderRadius: size.width * 0.05),
                SizedBox(width: size.width * 0.02),
                Expanded(
                  child: Column(
                    children: [
                      // Restaurant name and order ID row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildShimmerContainer(
                              height: size.height * 0.02,
                              width: size.width * 0.12,
                              borderRadius: 4,
                            ),
                          ),
                          _buildShimmerContainer(
                            height: size.height * 0.02,
                            width: size.width * 0.08,
                            borderRadius: 4,
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          _buildShimmerContainer(
                            height: size.height * 0.02,
                            width: size.width * 0.06,
                            borderRadius: 4,
                          ),
                          const SizedBox(width: 5),
                          _buildShimmerContainer(
                            height: size.height * 0.02,
                            width: size.width * 0.05,
                            borderRadius: 4,
                          ),
                          const Spacer(),
                          _buildShimmerContainer(
                            height: size.height * 0.02,
                            width: size.width * 0.1,
                            borderRadius: 4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!isOngoing)
            Padding(
              padding:  EdgeInsets.only(right:size.width * 0.02, bottom: size.height * 0.02),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: _buildShimmerContainer(
                  height: size.height * 0.02,
                  width: size.width * 0.1,
                  borderRadius: 4,
                ),
              ),
            ),
          CustomPaint(
            painter: DottedLinePainter(color: Colors.grey.shade300),
            child: SizedBox(width: double.infinity, height: size.height * 0.01),
          ),
          if (isOngoing) ...[
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Driver Details text shimmer
                  _buildShimmerContainer(
                    height: size.height * 0.02,
                    width: size.width * 0.1,
                    borderRadius: 4,
                  ),
                  SizedBox(height: size.height * 0.02),
                  // Driver info container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        _buildShimmerContainer(
                          height: size.height * 0.05,
                          width: size.width * 0.05,
                          borderRadius: 10,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildShimmerContainer(
                                height: size.height * 0.02,
                                width: size.width * 0.12,
                                borderRadius: 4,
                              ),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                children: [
                                  _buildShimmerContainer(
                                    height: size.height * 0.02,
                                    width: size.width * 0.02,
                                    borderRadius: 2,
                                  ),
                                  const SizedBox(width: 4),
                                  _buildShimmerContainer(
                                    height: size.height * 0.02,
                                    width: size.width * 0.03,
                                    borderRadius: 4,
                                  ),
                                   SizedBox(width: size.width * 0.02),
                                  _buildShimmerContainer(
                                    height: size.height * 0.02,
                                    width: size.width * 0.08,
                                    borderRadius: 4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Call button shimmer
                        _buildShimmerContainer(
                          height: size.height * 0.03,
                          width: size.width * 0.03,
                          borderRadius: 17,
                        ),
                        SizedBox(width: size.width * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Divider(color: Colors.grey.shade300, thickness: 1),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02, bottom: size.height * 0.02),
              child: Row(
                children: [
                  Expanded(
                    child: _buildShimmerContainer(
                      height: size.height * 0.04,
                      width: double.infinity,
                      borderRadius: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildShimmerContainer(
                      height: size.height * 0.04,
                      width: double.infinity,
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            ),
          ] else
            // Rate Order button shimmer (for completed orders)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: _buildShimmerContainer(
                  height: size.height * 0.02,
                  width: size.width * 0.1,
                  borderRadius: 4,
                ),
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

// Dotted line painter for shimmer
class DottedLinePainter extends CustomPainter {
  final Color color;

  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
