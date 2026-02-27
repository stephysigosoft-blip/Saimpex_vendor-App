import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saimpex_vendor/config/api_configs.dart';
import 'package:saimpex_vendor/resources/colors.dart';
import 'package:saimpex_vendor/view/login/widgets/bold_text-rubik.dart';

class EditProfilePictureWidget extends StatelessWidget {
  const EditProfilePictureWidget({
    super.key,
    required this.media,
    required this.initial,
    this.onEditTap,
    required this.profilePicture,
    this.imageSource,
  });

  final MediaQueryData media;
  final String initial;
  final VoidCallback? onEditTap;
  final String profilePicture;
  final XFile? imageSource;

  String _getImageUrl(String picturePath) {
    if (picturePath.isEmpty) return '';
    
    // If it's already a full URL, return as is
    if (picturePath.startsWith('http://') || picturePath.startsWith('https://')) {
      return picturePath;
    }
    
    // Otherwise, it's a relative path from API, prepend IMAGE_URL
    return ApiConfigs.IMAGE_URL + picturePath;
  }

  bool _isLocalFile(String path) {
    if (path.isEmpty) return false;
    // If it's a URL, it's not a local file
    if (path.startsWith('http://') || path.startsWith('https://')) return false;
    // If it's a relative path from API (starts with /user/ or similar), it's not a local file
    if (path.startsWith('/user/') || path.startsWith('/storage/')) return false;
    // Check if it's a valid local file path
    try {
      if (path.startsWith('/') && File(path).existsSync()) {
        return true;
      }
    } catch (e) {
      // If checking file existence throws an error, it's not a valid local file
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        (imageSource != null)
            ? ClipOval(
                child: Image.file(
                  File(imageSource!.path),
                  width: media.size.width * 0.3,
                  height: media.size.width * 0.3,
                  fit: BoxFit.cover,
                ),
              )
            : (profilePicture.isNotEmpty)
                ? ClipOval(
                    child: _isLocalFile(profilePicture)
                        ? Image.file(
                            File(profilePicture),
                            width: media.size.width * 0.3,
                            height: media.size.width * 0.3,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: _getImageUrl(profilePicture),
                            width: media.size.width * 0.3,
                            height: media.size.width * 0.3,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: media.size.width * 0.3,
                              height: media.size.width * 0.3,
                              decoration: const BoxDecoration(
                                color: lightOrange,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: media.size.width * 0.3,
                              height: media.size.width * 0.3,
                              decoration: const BoxDecoration(
                                color: lightOrange,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: BoldTextRubik(
                                  text: initial,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                  )
                : Container(
                    width: media.size.width * 0.3,
                    height: media.size.width * 0.3,
                    decoration: const BoxDecoration(
                      color: lightOrange,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: BoldTextRubik(
                        text: initial,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
        Positioned(
          bottom: 0,
          right: media.size.width * 0.01,
          child: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset(
                'lib/assets/images/penciledit.png',
                width: 18,
                height: 18,
                color: colorPrimary,
              ),
              onPressed: onEditTap ?? () {},
            ),
          ),
        ),
      ],
    );
  }
}
