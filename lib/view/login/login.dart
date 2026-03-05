import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/utils/utils.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:saimpex_vendor/view/login/widgets/login_form_card.dart';
import 'package:saimpex_vendor/view/login/widgets/login_language_dropdown.dart';
import 'package:saimpex_vendor/view/login/widgets/login_logo.dart';

import '../../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return CommonBackground(
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (loginController) {
          return Directionality(
            textDirection:
                localization.currentLocale!.languageCode.toString() == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: SizedBox.expand(
              child: Stack(
                children: [
                  LoginLanguageDropdown(
                    topPadding: mediaQuery.padding.top,
                    currentLanguageCode:
                        localization.currentLocale!.languageCode,
                    onLanguageChanged: (val) async {
                      if (val == "English") {
                        localization.translate('en');
                        var locale = const Locale('en');
                        await savename("selected_locale", "en");
                        Get.updateLocale(locale);
                      } else if (val == "French") {
                        localization.translate('fr');
                        var locale = const Locale('fr');
                        await savename("selected_locale", "fr");
                        Get.updateLocale(locale);
                      } else {
                        localization.translate('ar');
                        var locale = const Locale('ar');
                        await savename("selected_locale", "ar");
                        Get.updateLocale(locale);
                      }
                      if (mounted) {
                        setState(() {});
                      }
                    },
                  ),
                  LoginLogo(size: size),
                  LoginFormCard(
                    size: size,
                    loginController: loginController,
                    onLogin: () {
                      loginController.Login(
                        context,
                        loginController.userNameController.text,
                        loginController.passwordController.text,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
