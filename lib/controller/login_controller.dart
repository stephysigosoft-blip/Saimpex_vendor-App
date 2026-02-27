import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import '../Utils/Utils.dart';
import '../view/otp/otp.dart';

class LoginController extends GetxController {
  final FlutterLocalization localization = FlutterLocalization.instance;
  Country selectedCountry = Country.parse('MR');
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendOtp(
    BuildContext context,
    String countryCode,
    String mobile,
    String route,
  ) async {
    try {
      showLoadingDialog(context);
      if (context.mounted) {
        Get.back();
      }
      update();
      if (route == "login") {
        if (context.mounted) {
          Get.to(Otp(country_code: countryCode, mobile: mobile));
        }
      }
    } catch (error) {
      if (context.mounted) {
        Get.back();
        showToast(context, error.toString());
      }
      debugPrint("Login Error: $error");
    }
  }
}
