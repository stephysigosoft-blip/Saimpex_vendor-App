import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/resources/colors.dart';

/// A single chat entry in the chat listing: avatar, name, phone,
/// last message preview, and timestamp.
class ChatListingItem extends StatelessWidget {
  const ChatListingItem({
    super.key,
    required this.initials,
    required this.name,
    required this.phone,
    required this.lastMessage,
    required this.timestamp,
    this.onTap,
  });

  final String initials;
  final String name;
  final String phone;
  final String lastMessage;
  final String timestamp;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: chatSenderColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phone,
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: grey500Opacity,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastMessage,
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: mutedTextColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                timestamp,
                style: GoogleFonts.rubik(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: mutedTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: GoogleFonts.rubik(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: colorPrimary,
        ),
      ),
    );
  }
}
