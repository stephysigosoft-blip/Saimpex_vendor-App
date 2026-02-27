import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

import '../../controller/settings_controller.dart';
import '../../generated/l10n.dart';
import '../../utils/widgets/custom_app_bar.dart';
import '../../view/shimmer_loading/shimmer_text_content.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = FlutterLocalization.instance;
    return Directionality(
      textDirection: localization.currentLocale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: CommonBackground(
        appBar: CustomAppBar(title: S.of(context).termsConditions),
        child: GetBuilder<SettingsController>(
          init: SettingsController(),
          didChangeDependencies: (state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              state.controller!.getTerms();
            });
          },
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
                end: 15,
                bottom: 15,
                top: 15,
              ),
              child: controller.isLoading
                  ? const ShimmerTextContent()
                  : Html(
                      data: controller.htmlData,
                      style: {
                        "p": Style(
                          fontSize: FontSize(14),
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          lineHeight: LineHeight(1.2),
                          color: Colors.black87,
                        ),
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
