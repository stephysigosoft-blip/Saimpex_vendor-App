import 'package:flutter/material.dart';

class ShimmerTextContent extends StatefulWidget {
  const ShimmerTextContent({super.key});

  @override
  State<ShimmerTextContent> createState() => _ShimmerTextContentState();
}

class _ShimmerTextContentState extends State<ShimmerTextContent>
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(35, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _buildShimmerLine(
                width: index % 3 == 0 ? double.infinity : MediaQuery.of(context).size.width * 0.8,
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildShimmerLine({required double width}) {
    return Container(
      height: 13,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
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
}
