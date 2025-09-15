import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';

class BookingReviewHolder extends StatelessWidget {
  const BookingReviewHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.containerLightBackground,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: []),
    );
  }
}
