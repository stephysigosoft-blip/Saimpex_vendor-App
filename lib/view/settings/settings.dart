import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/controller/profile_controller.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/utils/utils.dart';
import 'package:saimpex_vendor/view/home/home.dart';
// import 'package:saimpex_vendor/view/settings/about_us.dart';
import 'package:saimpex_vendor/view/settings/help_and_support.dart';
import 'package:saimpex_vendor/view/settings/privacy_policy.dart';
import 'package:saimpex_vendor/view/settings/terms_and_conditions.dart';
import 'package:saimpex_vendor/view/settings/about_us.dart';
import 'package:saimpex_vendor/view/settings/app_settings.dart';
// import 'package:saimpex_vendor/utils/widgets/common_background.dart';

import '../../generated/l10n.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    dynamic lang = await getSavedObject("selected_locale");
    setState(() {
      if (lang == "ar") {
        selectedLanguage = "Arabic";
      } else if (lang == "fr") {
        selectedLanguage = "French";
      } else {
        selectedLanguage = "English";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: localization.currentLocale!.languageCode.toString() == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          didChangeDependencies: (state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              state.controller?.getProfile(context);
            });
          },
          builder: (controller) => Stack(
            children: [
              // Custom Top Background (Circular Curve)
              Positioned(
                top: -400,
                left: -context.width * 0.2,
                right: -context.width * 0.2,
                child: Container(
                  height: 600,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFEF2E2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Main Content
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 120), // Spacing for the curve
                    // Profile R1 Icon
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8EEFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "R1",
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Restaurant Name
                    Text(
                      controller.profileData?.name ?? "Restaurant 1",
                      style: GoogleFonts.rubik(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF333E63),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Details Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: 350,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: borderColor, width: 1),
                        ),
                        child: Column(
                          children: [
                            _buildDetailRow(
                              context,
                              S.of(context).name,
                              controller.profileData?.name ?? "Restaurant 1",
                            ),
                            const SizedBox(height: 10),
                            _buildDetailRow(context, "Owner", "Salman"),
                            const SizedBox(height: 10),
                            _buildDetailRow(
                              context,
                              "ID",
                              controller.profileData?.id?.toString() ?? "1",
                            ),
                            const SizedBox(height: 10),
                            _buildDetailRow(
                              context,
                              "Contact",
                              "${controller.profileData?.countryCode ?? '+222'}${controller.profileData?.mobile ?? '41518211'}",
                            ),
                            const SizedBox(height: 10),
                            _buildDetailRow(
                              context,
                              "Email",
                              "rest1@saimpex.com",
                            ),
                            const SizedBox(height: 10),
                            _buildStatusRow(context, "Status", "ACTIVE"),
                            const SizedBox(height: 10),
                            _buildDetailRow(
                              context,
                              "Address",
                              "Restaurant Block 5, Mauritania",
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // Language Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Language",
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF333E63),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Language Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Container(
                        width: 354,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFFFE0D8,
                          ), // Changed from Color(0xFFFFE0D8) if needed, but keeping it for now
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildLanguageButton("English", 'en'),
                            _buildLanguageButton("French", 'fr'),
                            _buildLanguageButton("Arabic", 'ar'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // Settings Options Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Container(
                        width: 354,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _buildMenuItem(
                              context,
                              "Settings",
                              const AssetImage(
                                "lib/assets/images/Settings vendor.png",
                              ),
                              () {
                                Get.to(() => const AppSettings());
                              },
                            ),
                            _buildMenuItem(
                              context,
                              "About Us",
                              const AssetImage(
                                "lib/assets/images/about_us_icon.png",
                              ),
                              () {
                                Get.to(() => const AboutUs());
                              },
                            ),
                            // const Divider(height: 1),
                            _buildMenuItem(
                              context,
                              "Help & Support",
                              AssetImage("lib/assets/images/Help&Support.png"),
                              () {
                                Get.to(() => HelpAndSupport());
                              },
                            ),
                            // const Divider(height: 1),
                            _buildMenuItem(
                              context,
                              "Terms & Conditions",
                              AssetImage(
                                "lib/assets/images/Terms&Conditions.png",
                              ),
                              () {
                                Get.to(() => const TermsandConditions());
                              },
                            ),
                            // const Divider(height: 1),
                            _buildMenuItem(
                              context,
                              "Privacy Policy",
                              AssetImage(
                                "lib/assets/images/Privacy policy.png",
                              ),
                              () {
                                Get.to(() => const PrivacyPolicy());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // Logout
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: InkWell(
                        onTap: () =>
                            _showLogoutBottomSheet(context, controller),
                        child: SizedBox(
                          width: 314,
                          height: 33,
                          child: Row(
                            children: [
                              Image.asset(
                                "lib/assets/images/Logout.png",
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(width: 15),
                              Text(
                                S.of(context).logout,
                                style: GoogleFonts.rubik(
                                  color: colorPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Version
                    Text(
                      "V${controller.version}",
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Check for update",
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              // Back Button (Floating on top)
              Positioned(
                top: 50,
                left: 20,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutBottomSheet(
    BuildContext context,
    ProfileController controller,
  ) {
    showConfirmationBottomSheet(
      context: context,
      title: "Logout",
      message: "Are you sure you want to logout?",
      leftButtonText: "No",
      rightButtonText: "Logout",
      onConfirm: () => controller.logout(context),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.rubik(
            fontSize: 13,
            color: const Color(0xFF8E99AF),
            fontWeight: FontWeight.w400,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: GoogleFonts.rubik(
              fontSize: 13,
              color: const Color(0xFF333E63),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusRow(BuildContext context, String label, String status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.rubik(
            fontSize: 13,
            color: const Color(0xFF8E99AF),
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: lightgreen,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            status,
            style: GoogleFonts.rubik(
              fontSize: 11,
              color: greenlight,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageButton(String title, String langCode) {
    bool isSelected = selectedLanguage == title;
    return InkWell(
      onTap: () async {
        localization.translate(langCode);
        var locale = Locale(langCode);
        await savename("selected_locale", langCode);
        Get.updateLocale(locale);
        setState(() => selectedLanguage = title);
        Get.offAll(const Home());
      },
      child: Container(
        width: 99,
        height: 37,
        decoration: BoxDecoration(
          color: isSelected ? colorPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.rubik(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    ImageProvider image,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: ImageIcon(image, color: Colors.grey[600], size: 24),
      title: Text(
        title,
        style: GoogleFonts.rubik(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF333E63),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      visualDensity: VisualDensity.compact,
    );
  }
}
