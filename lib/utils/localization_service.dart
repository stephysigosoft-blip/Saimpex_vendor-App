import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/utils/utils.dart';

class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();

  factory LocalizationService() {
    return _instance;
  }

  LocalizationService._internal();

  final FlutterLocalization _localization = FlutterLocalization.instance;

  /// Updates the application locale and persists the selection.
  /// Accepts either language name (English, French, Arabic) or language code (en, fr, ar).
  Future<void> updateLocale(String language) async {
    String langCode = 'en';
    if (language == "English" || language == "en") {
      langCode = 'en';
    } else if (language == "French" || language == "fr") {
      langCode = 'fr';
    } else if (language == "Arabic" || language == "ar") {
      langCode = 'ar';
    }

    _localization.translate(langCode);
    var locale = Locale(langCode);
    await savename("selected_locale", langCode);
    Get.updateLocale(locale);
  }

  /// Returns the readable language name based on the current locale code.
  String getCurrentLanguageName() {
    String code = _localization.currentLocale?.languageCode ?? 'en';
    switch (code) {
      case 'fr':
        return 'French';
      case 'ar':
        return 'Arabic';
      default:
        return 'English';
    }
  }

  /// Returns the current locale's text direction (RTL for Arabic, LTR otherwise).
  TextDirection getTextDirection() {
    return _localization.currentLocale?.languageCode == "ar"
        ? TextDirection.rtl
        : TextDirection.ltr;
  }
}
