import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/chat/chat_message_item.dart';
import '../../generated/l10n.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({
    super.key,
    this.contactName = 'Aicha Mint Ahmed',
  });

  final String contactName;

  @override
  Widget build(BuildContext context) {
    final localization = FlutterLocalization.instance;
    final isRtl = localization.currentLocale?.languageCode == 'ar';

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context, isRtl),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: _dummyMessages.length,
                  itemBuilder: (context, index) {
                    final item = _dummyMessages[index];
                    return ChatMessageItem(
                      message: item.message,
                      timestamp: item.timestamp,
                      isSent: item.isSent,
                      showCheckmark: item.isSent,
                    );
                  },
                ),
              ),
              _buildInputBar(context),
            ],
          ),
        ),
      ),
    );
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
        contactName,
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildInputBar(BuildContext context,) {
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
                // controller: controller.messageController,
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
              onTap: () {

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
                    'lib/assets/images/send.png',
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static final List<({String message, String timestamp, bool isSent})> _dummyMessages = [
    (message: 'Hi', timestamp: '10:00 PM', isSent: false),
    (message: 'Hi', timestamp: '10:00 PM', isSent: true),
  ];
}
