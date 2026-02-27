import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saimpex_vendor/controller/profile_controller.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/utils/Widgets/custom_app_bar.dart';
import 'package:saimpex_vendor/view/Profile/edit_profile.dart';
import 'package:saimpex_vendor/view/Profile/widgets/delete_account_bottom_sheet.dart';
import 'package:saimpex_vendor/view/settings/widgets/notification_item.dart';
import 'package:saimpex_vendor/view/settings/widgets/settings_item.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

import '../../generated/l10n.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Directionality(
      textDirection: localization.currentLocale!.languageCode.toString() == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: CommonBackground(
        appBar: CustomAppBar(
          title: S.of(context).settings,
          onTap: () {
            Get.back();
          },
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: media.size.width * 0.05),
          child: GetBuilder<ProfileController>(
            init: ProfileController(),
            didChangeDependencies: (state) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                state.controller?.getNotificationStatus(context);
              });
            },
            builder: (controller) => Column(
              children: [
                SizedBox(height: media.size.height * 0.02),
                SettingsItem(
                  title: S.of(context).editProfile,
                  onTap: () {
                    Get.to(() => const EditProfile());
                  },
                ),
                SizedBox(height: media.size.height * 0.01),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                NotificationItem(
                  title: S.of(context).notification,
                  isEnabled: controller.notificationEnabled,
                  onChanged: (value) {
                    controller.notificationEnabled = value;
                    controller.updateNotificationStatus(context);
                  },
                ),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                SizedBox(height: media.size.height * 0.01),
                SettingsItem(
                  title: S.of(context).deleteAccount,
                  textColor: colorPrimary,
                  onTap: () {
                    DeleteAccountBottomSheet.show(
                      context,
                      onCancel: () {},
                      onDelete: () {
                        controller.deleteAccount(context);
                      },
                    );
                  },
                ),
                SizedBox(height: media.size.height * 0.01),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
