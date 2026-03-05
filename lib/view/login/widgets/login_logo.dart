import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.05,
      left: 0,
      right: 0,
      child: Center(
        child: Image.asset(
          'lib/assets/images/logo.png',
          height: size.height * 0.35,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
