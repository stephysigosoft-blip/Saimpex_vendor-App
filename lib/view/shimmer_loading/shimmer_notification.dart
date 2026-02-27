import 'package:flutter/material.dart';

class ShimmerNotification extends StatefulWidget {
  const ShimmerNotification({super.key});

  @override
  State<ShimmerNotification> createState() => _ShimmerNotificationState();
}

class _ShimmerNotificationState extends State<ShimmerNotification>
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
        return ListView.separated(
          padding: EdgeInsets.only(
            left: size.width * 0.04,
            right: size.width * 0.04,
            bottom: size.height * 0.02,
            top: size.height * 0.012,
          ),
          itemCount: 15,
          separatorBuilder: (context, index) =>
              SizedBox(height: size.height * 0.012),
          itemBuilder: (context, index) {
            return _buildNotificationCardShimmer(media);
          },
        );
      },
    );
  }

  Widget _buildNotificationCardShimmer(MediaQueryData media) {
    final size = media.size;

    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.width * 0.035),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShimmerContainer(
              height: size.height * 0.016,
              width: size.width * 0.75,
              borderRadius: size.width * 0.01,
            ),
            SizedBox(height: size.height * 0.006),
            _buildShimmerContainer(
              height: size.height * 0.016,
              width: size.width * 0.65,
              borderRadius: size.width * 0.01,
            ),
            SizedBox(height: size.height * 0.006),
            _buildShimmerContainer(
              height: size.height * 0.016,
              width: size.width * 0.55,
              borderRadius: size.width * 0.01,
            ),
            SizedBox(height: size.height * 0.012),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: _buildShimmerContainer(
                height: size.height * 0.016,
                width: size.width * 0.15,
                borderRadius: size.width * 0.01,
              ),
            ),
          ],
        ),
      ),
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
