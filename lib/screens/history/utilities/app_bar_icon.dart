import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/constant/colors.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key, required this.icons, required this.function});

  final IconData icons;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: AppColors.containerLightBackground,
        ),
        child: Center(child: Icon(icons, color: AppColors.blackTextColor)),
      ),
    );
  }
}
