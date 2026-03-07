import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/model/profile_model.dart';
import 'package:saimpex_vendor/view/Login/login.dart';

import '../Utils/Utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:saimpex_vendor/configs/ApiConfigs.dart';
import 'package:saimpex_vendor/configs/Dioclient.dart';

class ProfileController extends GetxController {
  final FlutterLocalization localization = FlutterLocalization.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String countryCode = '';
  bool isNameEditable = false;
  bool isPhoneEditable = false;
  String profilePicture = '';
  final ImagePicker imagePicker = ImagePicker();
  XFile? imageSource;
  bool isOtpSent = false;
  bool isOtpVerified = false;
  Country selectedCountry = Country.parse('MR');
  bool isProfileLoading = false;
  bool notificationEnabled = true;
  String version = '';

  @override
  void onInit() {
    getAppVersion();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    update();
  }

  ProfileData? profileData;
  double points = 0.0;
  double redeemableAmount = 0.0;

  Future<void> logout(BuildContext context) async {
    try {
      showLoadingDialog(context);

      var token = await getSavedObject("token");
      if (token != null) {
        DioClient().updateToken(token);
      } else {
        DioClient().updateToken("");
      }

      final response = await DioClient().post(ApiEndPoints.logout);

      if (context.mounted) {
        Get.back();
      }

      if (response.data['status'] == 'true' ||
          response.data['status'] == true) {
        if (context.mounted) {
          showToast(
            context,
            response.data['message']?.toString() ??
                "You are logged out successfully.",
          );
        }
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        await savename("@isFirstLaunch", "true");
        Get.offAll(const LoginScreen());
      } else {
        if (context.mounted) {
          showToast(
            context,
            response.data['message']?.toString() ?? "Logout failed.",
          );
        }
      }
    } catch (error) {
      if (context.mounted) {
        Get.back();
        showToast(context, error.toString());
      }
    }
  }

  Future<void> getProfile(BuildContext context) async {
    try {
      isProfileLoading = true;
      update();

      var token = await getSavedObject("token");
      if (token != null) {
        DioClient().updateToken(token);
      } else {
        DioClient().updateToken("");
      }

      var vendorType = await getSavedObject("vendorType");

      final response = await DioClient().get(
        ApiEndPoints.profile,
        query: {"vendor_type": vendorType ?? 1},
      );

      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      if (profileModel.status == true) {
        profileData = profileModel.data;
        nameController.text = profileData?.name ?? "";
        phoneController.text = profileData?.mobile ?? "";
        countryCode = profileData?.countryCode ?? "";
        profilePicture = profileData?.image ?? "";
      }
    } catch (error) {
      debugPrint("getProfile Error: $error");
    } finally {
      isProfileLoading = false;
      update();
    }
  }

  Future<void> onGalleryTapped() async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        imageSource = pickedFile;
        profilePicture = pickedFile.path;
        update();
      }
    } catch (e) {
      debugPrint("Error picking image from gallery: $e");
    }
  }

  Future<void> onCameraTapped() async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        imageSource = pickedFile;
        profilePicture = pickedFile.path;
        update();
      }
    } catch (e) {
      debugPrint("Error picking image from camera: $e");
    }
  }

  Future<void> sendOtp(
    BuildContext context,
    String countryCode,
    String mobile,
  ) async {
    try {
      otpController.clear();
      await Future.delayed(const Duration(seconds: 1));
      showToast(context, "OTP sent successfully (Mock)");
      isOtpSent = true;
      update();
    } catch (error) {
      debugPrint("Otp Mock Error: $error");
      isOtpSent = false;
      update();
    }
  }

  Future<void> verifyOtp(
    BuildContext context,
    String countryCode,
    String mobile,
    String otp,
  ) async {
    try {
      showLoadingDialog(context);
      await Future.delayed(const Duration(seconds: 1));
      if (context.mounted) {
        Get.back(); // Close loading dialog
        showToast(context, "OTP Verified successfully (Mock)");
        await postEditProfile(
          context,
          nameController.text,
          countryCode,
          phoneController.text,
        );
        isOtpVerified = true;
        Navigator.of(context).pop();
      }
      update();
    } catch (error) {
      if (context.mounted) {
        Get.back();
        showToast(context, error.toString());
      }
      debugPrint("verify otp Mock Error: $error");
      isOtpVerified = false;
    }
  }

  Future<void> postEditProfile(
    BuildContext context,
    String name,
    String countryCode,
    String mobile,
  ) async {
    try {
      // showLoadingDialog(context); // Already showing or not needed for mock
      await Future.delayed(const Duration(seconds: 1));
      showToast(context, "Profile updated successfully (Mock)");
      isOtpSent = true;
      imageSource = null;
      update();
    } catch (error) {
      debugPrint("postEditProfile Mock Error: $error");
      isOtpSent = false;
      update();
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    try {
      showLoadingDialog(context);

      var token = await getSavedObject("token");
      if (token != null) {
        DioClient().updateToken(token);
      }

      final response = await DioClient().get(ApiEndPoints.deleteAccount);

      if (context.mounted) {
        Get.back();
      }

      if (response.data['status'] == 'true' ||
          response.data['status'] == true) {
        final languageCode = localization.currentLocale?.languageCode;
        final messageObj = response.data['message'];
        String? toastMessage;

        if (messageObj is Map) {
          final list = languageCode == 'fr'
              ? messageObj['message_fr']
              : languageCode == 'ar'
              ? messageObj['message_ar']
              : messageObj['message_en'];
          if (list is List && list.isNotEmpty) {
            toastMessage = list.first.toString();
          }
        }

        if (context.mounted) {
          showToast(context, toastMessage ?? "Account deleted successfully");
        }

        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        await savename("@isFirstLaunch", "true");
        Get.offAll(LoginScreen());
      } else {
        if (context.mounted) {
          showToast(
            context,
            response.data['message']?.toString() ?? "Delete account failed.",
          );
        }
      }
    } catch (error) {
      if (context.mounted) {
        Get.back();
        showToast(context, error.toString());
      }
      debugPrint("deleteAccount Error: $error");
    }
  }

  Future<void> getMyPoints(BuildContext context) async {
    try {
      showLoadingDialog(context);
      await Future.delayed(const Duration(seconds: 1));
      if (context.mounted) {
        Get.back();
      }
      points = 100.0;
      redeemableAmount = 10.0;
      update();
    } catch (error) {
      if (context.mounted) {
        Get.back();
        showToast(context, error.toString());
      }
      debugPrint("getMyPoints Mock Error: $error");
    }
  }

  Future<void> getNotificationStatus(BuildContext context) async {
    try {
      notificationEnabled = true;
      update();
    } catch (error) {
      debugPrint("getNotificationStatus Mock Error: $error");
    }
  }

  Future<void> updateNotificationStatus(BuildContext context) async {
    try {
      showLoadingDialog(context);
      await Future.delayed(const Duration(seconds: 1));
      if (context.mounted) {
        Get.back();
        showToast(context, "Notification status updated successfully (Mock)");
      }
      update();
    } catch (error) {
      if (context.mounted) {
        Get.back();
        showToast(context, error.toString());
      }
      debugPrint("updateNotificationStatus Mock Error: $error");
    }
  }
}
