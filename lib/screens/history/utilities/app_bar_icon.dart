import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/constant/colors.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key, required this.icons});

  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Center(child: Icon(icons, color: AppColors.blackTextColor)),
    );
  }
}
