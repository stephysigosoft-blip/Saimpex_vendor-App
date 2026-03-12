import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/chat/chat_message_item.dart';
import 'package:saimpex_vendor/utils/widgets/app_loader.dart';
import 'package:saimpex_vendor/controller/chat_controller.dart';
import '../../generated/l10n.dart';

import 'package:intl/intl.dart' hide TextDirection;

class ChatDetails extends StatefulWidget {
  const ChatDetails({
    super.key,
    required this.contactName,
    required this.conversationId,
    this.customerId,
  });

  final String contactName;
  final int conversationId;
  final int? customerId;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.conversationId != 0) {
        Get.find<ChatController>().getConversationDetails(
          context,
          widget.conversationId,
        );
      } else {
        Get.find<ChatController>().currentConversation = null;
        Get.find<ChatController>().update();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = FlutterLocalization.instance;
    final isRtl = localization.currentLocale?.languageCode == 'ar';

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: GetBuilder<ChatController>(
        builder: (controller) {
          final messages = controller.currentConversation?.messages ?? [];
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _buildAppBar(context, isRtl),
            body: SafeArea(
              child: controller.isLoadingMessages
                  ? const Center(child: AppLoader())
                  : Column(
                      children: [
                        Expanded(
                          child: messages.isEmpty
                              ? Center(
                                  // child: Text(
                                  //   S
                                  //       .of(context)
                                  //       .currentlyNoContactsFoundPleaseTryLater,
                                  //   style: GoogleFonts.rubik(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                )
                              : ListView.builder(
                                  controller:
                                      controller.messagesScrollController,
                                  reverse: true,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  itemCount:
                                      messages.length +
                                      (controller.isLoadMoreMessages ? 1 : 0),
                                  itemBuilder: (context, index) {
                                    if (index == messages.length) {
                                      return const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: AppLoader(),
                                        ),
                                      );
                                    }
                                    final item = messages[index];
                                    return ChatMessageItem(
                                      message: item.message ?? "",
                                      timestamp: formatMessageTime(
                                        item.createdAt,
                                      ),
                                      isSent: item.senderType == 'vendor',
                                      showCheckmark: item.isRead ?? false,
                                      messageType: item.messageType ?? 'text',
                                      attachmentUrl: item.attachmentUrl,
                                    );
                                  },
                                ),
                        ),
                        _buildInputBar(context, controller),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  String formatMessageTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return "";
    try {
      DateTime dt = DateTime.parse(timeStr).toLocal();
      return DateFormat('hh:mm a').format(dt);
    } catch (e) {
      return "";
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isRtl) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      forceMaterialTransparency: true,
      elevation: 0,
      leading: IconButton(
        icon: Transform.rotate(
          angle: isRtl ? 3.1416 : 0,
          child: Image.asset(
            'lib/assets/images/back.png',
            height: 35,
            width: 35,
          ),
        ),
        onPressed: () => Get.back(),
      ),
      title: Text(
        widget.contactName.isEmpty ? S.of(context).unknown : widget.contactName,
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildInputBar(BuildContext context, ChatController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.image, color: colorPrimary),
                          title: Text(
                            S.of(context).uploadImage,
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Get.back();
                            controller.pickAndSendImage(
                              context,
                              conversationId: widget.conversationId,
                              customerId: widget.customerId,
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'lib/assets/images/plus.png',
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: controller.messageController,
                cursorColor: Colors.black,
                style: GoogleFonts.rubik(fontSize: 14),
                decoration: InputDecoration(
                  hintText: S.of(context).typeAMessage,
                  hintStyle: GoogleFonts.rubik(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: boxColor1,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: boxColor1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: boxColor1),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: controller.isSendingMessage
                  ? null
                  : () {
                      if (widget.conversationId != 0) {
                        controller.sendMessage(
                          context,
                          conversationId: widget.conversationId,
                        );
                      } else if (widget.customerId != null) {
                        controller.sendMessage(
                          context,
                          customerId: widget.customerId,
                        );
                      }
                    },
              child: Opacity(
                opacity: controller.isSendingMessage ? 0.5 : 1.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'lib/assets/images/send.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
