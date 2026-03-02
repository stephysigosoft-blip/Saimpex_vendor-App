import 'package:flutter/material.dart';

class CommonBackground extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final double gradientHeight;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;

  const CommonBackground({
    super.key,
    required this.child,
    this.appBar,
    this.bottomSheet,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.gradientHeight = 300,
    this.backgroundColor = const Color(0xFFFDFDFD),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          // Top Gradient Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: gradientHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 255, 188, 156).withOpacity(0.9),
                    backgroundColor ?? Colors.white,
                  ],
                  stops: const [0.0, 1.5],
                ),
              ),
            ),
          ),
          // Main Content
          child,
        ],
      ),
    );
  }
}
