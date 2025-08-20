import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';

Widget iconHolder({required String imagePath}) {
  return Container(
    height: 70.h,
    width: 100.w,
    padding: EdgeInsets.all(10),
    color: AppColors.containerLightBackground,
    child: Center(
      child: ClipRRect(child: CachedNetworkImage(imageUrl: imagePath)),
    ),
  );
}
