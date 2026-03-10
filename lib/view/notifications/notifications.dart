import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/controller/notification_controller.dart';
import 'package:saimpex_vendor/model/notification_model.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/utils/widgets/app_loader.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:saimpex_vendor/utils/widgets/no_data_widget.dart';
import '../../generated/l10n.dart';
import '../../utils/widgets/custom_app_bar.dart';
import '../shimmer_loading/shimmer_notification.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = FlutterLocalization.instance;

    return Directionality(
      textDirection: localization.currentLocale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: CommonBackground(
        appBar: CustomAppBar(
          title: S.of(context).notifications,
          onTap: () => Get.back(),
        ),
        child: Stack(
          children: [
            GetBuilder<NotificationController>(
              init: NotificationController(),
              didChangeDependencies: (state) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  state.controller?.getNotifications(context);
                });
              },
              builder: (controller) {
                if (controller.isLoading) {
                  return const ShimmerNotification();
                }
                if (controller.notificationList.isEmpty) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: NoDataWidget(
                      context,
                      S.of(context).noNotifications,
                      S.of(context).noNotificationsFound,
                      "lib/assets/images/nonotifications.png",
                    ),
                  );
                }
                return ListView.separated(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.only(
                    left: 20, // specification: left 20px
                    right: 20,
                    bottom: 30,
                    top: 10, // specification: top 130px
                  ),
                  itemCount:
                      controller.notificationList.length +
                      (controller.isLoadMoreRunning ? 1 : 0),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    if (index == controller.notificationList.length) {
                      return const AppLoader();
                    }

                    final notification = controller.notificationList[index];
                    return _buildNotificationTile(context, notification);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile(
    BuildContext context,
    AppNotification notification,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ORDER #${notification.titleEn}",
            style: GoogleFonts.rubik(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: colorPrimary,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12), // Gap 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ITEMS",
                style: GoogleFonts.rubik(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
              Text(
                "DATE & TIME",
                style: GoogleFonts.rubik(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7), // specification: gap 7px
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.rubik(
                    fontSize: 11,
                    color: const Color(0xFF4B5563),
                  ),
                  children: [
                    TextSpan(
                      text: notification.contentEn.split('•')[0] + " • ",
                    ),
                    TextSpan(
                      text: notification.contentEn.split('•')[1],
                      style: const TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${notification.time}, ${notification.date}",
                style: GoogleFonts.rubik(
                  fontSize: 10,
                  color: const Color(0xFF4B5563),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F5F9),
                    foregroundColor: const Color(0xFFEF4444),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text(
                    "Reject",
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5216),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text(
                    "Accept Order",
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
