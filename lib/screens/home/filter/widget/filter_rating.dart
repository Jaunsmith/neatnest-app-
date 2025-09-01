import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/widget/app_text.dart';

class FilterRating extends StatelessWidget {
  const FilterRating({super.key, required this.index});

  final int index;
  final List<String> ratingTextRange = const [
    "5.0",
    "4.0 - 4.9",
    "3.0 - 3.9",
    "2.0 - 2.9",
    "1.0 - 1.9",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.containerLightBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: AppColors.ratingStarColor),
          secondaryText(text: ratingTextRange[index]),
        ],
      ),
    );
  }
}
