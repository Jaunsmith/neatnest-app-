import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class HomeScreenIcons extends StatelessWidget {
  const HomeScreenIcons({super.key, required this.text, required this.icons});

  final String text;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: AppColors.primaryColor.withOpacity(0.1),
          ),
          child: Center(child: Icon(icons, color: AppColors.primaryColor)),
        ),
        5.ht,
        primaryText(text: text, fontSize: 12),
      ],
    );
  }
}
