import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/utils/localization_service.dart';
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
            textDirection: LocalizationService().getTextDirection(),
            child: SizedBox.expand(
              child: Stack(
                children: [
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
                  LoginLanguageDropdown(
                    topPadding: mediaQuery.padding.top,
                    currentLanguageCode:
                        localization.currentLocale!.languageCode,
                    onLanguageChanged: (val) async {
                      await LocalizationService().updateLocale(val);
                      if (mounted) {
                        setState(() {});
                      }
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
