import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saimpex_vendor/config/api_configs.dart';
import 'package:saimpex_vendor/model/profile_model.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({
    super.key,
    required this.media,
    required this.profileData,
  });

  final MediaQueryData media;
  final ProfileData profileData;

  String _getImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) return '';
    
    // If it's already a full URL, return as is
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return imagePath;
    }
    
    // Otherwise, it's a relative path from API, prepend IMAGE_URL
    return ApiConfigs.IMAGE_URL + imagePath;
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _getImageUrl(profileData.image);
    final initial = profileData.name?.substring(0, 1).toUpperCase() ?? '';

    return ClipOval(
      child: imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: media.size.width * 0.25,
              height: media.size.height * 0.12,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: media.size.width * 0.25,
                height: media.size.height * 0.12,
                decoration: const BoxDecoration(
                  color: lightOrange,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: media.size.width * 0.25,
                height: media.size.height * 0.12,
                decoration: const BoxDecoration(
                  color: lightOrange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: BoldTextRubik(
                    text: initial,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          : Container(
              width: media.size.width * 0.25,
              height: media.size.height * 0.12,
              decoration: const BoxDecoration(
                color: lightOrange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: BoldTextRubik(
                  text: initial,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
    );
  }
}
