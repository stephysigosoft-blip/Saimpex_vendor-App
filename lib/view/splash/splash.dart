import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

import 'package:saimpex_vendor/view/Login/login.dart';

import '../../Utils/Utils.dart';
import '../home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? isFirstLaunch;
  @override
  void initState() {
    splashNavigation();
    super.initState();
  }

  Future<void> isNameAdded(BuildContext context, String? token) async {
    try {
      if (token == null || token.trim().isEmpty) {
        debugPrint("token is null or empty");
        Get.offAll(() => LoginScreen());
        return;
      }
      debugPrint("token is not null or empty");
      Get.offAll(() => const Home());
    } catch (error) {
      Get.offAll(() => Home());
      debugPrint("name validation Error: $error");
    }
  }

  splashNavigation() async {
    isFirstLaunch = await getSavedObject("@isFirstLaunch");
    Timer(const Duration(seconds: 3), () async {
      if (isFirstLaunch == null) {
        await savename("@isFirstLaunch", "true");
      } else {
        var loginStatus = await getSavedObject("loginStatus");
        var token = await getSavedObject("token");
        debugPrint("loginStatus: $loginStatus");
        debugPrint("token: $token");
        if (loginStatus != null && loginStatus == "true") {
          isNameAdded(context, token?.toString());
        } else {
          Get.offAll(() => LoginScreen());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return CommonBackground(
      child: SizedBox.expand(
        child: Center(
          child: Image.asset(
            'lib/assets/images/logo.png',
            width: media.height * 0.8,
            height: media.width * 0.8,
          ),
        ),
      ),
    );
  }
}
