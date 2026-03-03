import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:saimpex_vendor/view/chat/chat_listing_item.dart';
import '../../generated/l10n.dart';

class ChatListing extends StatelessWidget {
  const ChatListing({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = FlutterLocalization.instance;
    final isRtl =
        localization.currentLocale?.languageCode == 'ar';

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: CommonBackground(
        appBar: _buildAppBar(context, isRtl),
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          itemCount: _dummyChats.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final chat = _dummyChats[index];
            return ChatListingItem(
              initials: chat.initials,
              name: chat.name,
              phone: chat.phone,
              lastMessage: chat.lastMessage,
              timestamp: chat.timestamp,
              onTap: () {
                // TODO: Navigate to chat screen
              },
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isRtl) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
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
        S.of(context).chat,
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: Material(
            color: colorPrimary,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                // TODO: Start new chat
              },
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static final List<({String initials, String name, String phone, String lastMessage, String timestamp})> _dummyChats = [
    (initials: 'AM', name: 'Aicha Mint Ahmed', phone: '+222 62345678', lastMessage: 'Hello', timestamp: 'Today'),
    (initials: 'AM', name: 'Aicha Mint Ahmed', phone: '+222 62345678', lastMessage: 'Hello', timestamp: 'Today'),
    (initials: 'AM', name: 'Aicha Mint Ahmed', phone: '+222 62345678', lastMessage: 'Hello', timestamp: 'Today'),
    (initials: 'AM', name: 'Aicha Mint Ahmed', phone: '+222 62345678', lastMessage: 'Hello', timestamp: 'Today'),
  ];
}
