import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A reusable app-wide loading indicator widget.
/// Uses the same Lottie dotted circular animation shown during login.
/// Drop-in replacement for all [CircularProgressIndicator] usages in the app.
class AppLoader extends StatelessWidget {
  /// The size of the Lottie animation. Defaults to 80.
  final double size;

  const AppLoader({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'lib/assets/images/loader.json',
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
