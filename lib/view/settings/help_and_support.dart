import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/controller/settings_controller.dart';
import 'package:saimpex_vendor/view/shimmer_loading/shimmer_text_content.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = FlutterLocalization.instance;
    return Directionality(
      textDirection: localization.currentLocale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleSpacing: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF333E63),
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Help & Support",
            style: GoogleFonts.rubik(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF333E63),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Divider(color: Colors.grey.withOpacity(0.1), height: 1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<SettingsController>(
            init: SettingsController(),
            didChangeDependencies: (state) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                state.controller!.getHelpAndSupport();
              });
            },
            builder: (controller) => controller.isLoading
                ? const SingleChildScrollView(child: ShimmerTextContent())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Call us",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse("tel:+22245123456"));
                        },
                        child: Text(
                          "+222 45 12 34 56",
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF333E63),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Email us",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(
                            Uri.parse("mailto:saimpex@gmail.com"),
                          );
                        },
                        child: Text(
                          "saimpex@gmail.com",
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF333E63),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Divider(
                        color: Colors.grey.withOpacity(0.1),
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
