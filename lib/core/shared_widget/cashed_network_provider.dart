import 'package:barter_app/core/helper/app_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CashedImageProvider extends StatelessWidget {
  final bool isDetailProfile;
  final String pic;
  final double? width;

  const CashedImageProvider({
    super.key,
    this.isDetailProfile = false,
    required this.pic,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width?.w ?? double.infinity,
      imageUrl: pic,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          border: isDetailProfile
              ? Border.all(color: AppConstants.primaryColor, width: 3)
              : null,
          borderRadius: BorderRadius.circular(isDetailProfile ? 100 : 18),
          image: DecorationImage(
            image: imageProvider,
            fit: isDetailProfile ? BoxFit.fill : BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
