import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/constant/colors.dart';

class PopulaServiceImages extends StatelessWidget {
  const PopulaServiceImages({super.key, required this.imagePath});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.containerLightBackground,
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: imagePath),
        ),
      ),
    );
  }
}
