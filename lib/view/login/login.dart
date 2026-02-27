import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/utils/utils.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:saimpex_vendor/view/home/home.dart';

import '../../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  String _getLanguageName(String code) {
    if (code == 'ar') return 'Arabic';
    if (code == 'fr') return 'French';
    return 'English';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  // Top right Language Dropdown
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 10,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD8CC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _getLanguageName(
                            localization.currentLocale!.languageCode,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'English',
                              child: Text(
                                'English ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Arabic',
                              child: Text(
                                'Arabic',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'French',
                              child: Text(
                                'French',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (val) async {
                            if (val == 'English') {
                              localization.translate('en');
                              await savename("selected_locale", "en");
                            } else if (val == 'Arabic') {
                              localization.translate('ar');
                              await savename("selected_locale", "ar");
                            } else if (val == 'French') {
                              localization.translate('fr');
                              await savename("selected_locale", "fr");
                            }
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          icon: const Icon(
                            Icons.expand_more,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Logo
                  Positioned(
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
                  ),

                  // Login Form Card
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "Welcome to Saimpex Vendor!",
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Please sign-in to your account and start the adventure",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // User Name Field
                          Text(
                            "User Name",
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: loginController.userNameController,
                            decoration: InputDecoration(
                              hintText: "Enter your username",
                              hintStyle: GoogleFonts.rubik(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Password Field
                          Text(
                            "Password",
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: loginController.passwordController,
                            obscureText: !loginController.isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: GoogleFonts.rubik(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.orange,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginController.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () =>
                                    loginController.togglePasswordVisibility(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.offAll(const Home());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF5722),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Login",
                                style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
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
