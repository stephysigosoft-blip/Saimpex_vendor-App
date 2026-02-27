import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/controller/settings_controller.dart';
import 'package:saimpex_vendor/utils/widgets/custom_app_bar.dart';
import 'package:saimpex_vendor/view/shimmer_loading/shimmer_text_content.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

import '../../generated/l10n.dart';

class HelpAndSupport extends StatelessWidget {
  HelpAndSupport({super.key});
  final localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: localization.currentLocale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: CommonBackground(
        appBar: CustomAppBar(title: S.of(context).helpSupport),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15,
            end: 15,
            bottom: 15,
          ),
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
                      const SizedBox(height: 15),
                      Text(
                        S.of(context).callUs,
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse("tel:+911234567890"));
                        },
                        child: Text(
                          "+91 1234567890",
                          style: GoogleFonts.rubik(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        S.of(context).emailUs,
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(
                            Uri.parse("mailto:support@example.com"),
                          );
                        },
                        child: Text(
                          "support@example.com",
                          style: GoogleFonts.rubik(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
