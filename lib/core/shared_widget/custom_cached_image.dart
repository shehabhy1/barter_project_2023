import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width,
      this.size,
      this.radius,
      this.fit});
  final String imageUrl;
  final double height;
  final double width;
  final double? size;
  final double? radius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit ?? BoxFit.cover,
          // width:width.w,
          // height: height.h,
          placeholder: (context, s) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                color: Colors.grey.shade200,
              ),
            );
          },
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 16),
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Icon(
              Icons.error,
              size: size?.h ?? 60.h,
            ),
          ),
        ),
      ),
    );
  }
}
