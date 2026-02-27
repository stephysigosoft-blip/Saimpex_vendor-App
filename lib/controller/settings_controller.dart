import 'package:flutter/foundation.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final FlutterLocalization localization = FlutterLocalization.instance;
  String htmlData = "";
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getAboutUs() async {
    try {
      isLoading = true;
      update();
      await Future.delayed(const Duration(seconds: 1));
      htmlData = "Mock About Us Content";
    } catch (error) {
      debugPrint("aboutus mock Error: $error");
      htmlData = "No results found";
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getPrivacy() async {
    try {
      isLoading = true;
      update();
      await Future.delayed(const Duration(seconds: 1));
      htmlData = "Mock Privacy Policy Content";
    } catch (error) {
      debugPrint("privacy mock Error: $error");
      htmlData = "No results found";
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getTerms() async {
    try {
      isLoading = true;
      update();
      await Future.delayed(const Duration(seconds: 1));
      htmlData = "Mock Terms and Conditions Content";
    } catch (error) {
      debugPrint("terms mock Error: $error");
      htmlData = "No results found";
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getHelpAndSupport() async {
    try {
      isLoading = true;
      update();
      await Future.delayed(const Duration(seconds: 1));
      // contact can be mocked if needed
    } catch (error) {
      debugPrint("HelpAndSupport mock Error: $error");
    } finally {
      isLoading = false;
      update();
    }
  }
}
