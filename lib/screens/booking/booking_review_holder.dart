import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

import '../../utilities/app_data.dart';

class BookingReviewHolder extends StatelessWidget {
  const BookingReviewHolder({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.containerLightBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          height: 40.h,
                          width: 40.w,
                          fit: BoxFit.cover,
                          imageUrl: AppData.imagePathway[index],
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: AppColors.primaryColor,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40.r,
                          ),
                        ),
                      ),
                    ),
                    10.wt,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        primaryText(text: "User 1", fontSize: 13.sp),
                        secondaryText(text: "2 Days ago", fontSize: 13.sp),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18.sp,
                      color: AppColors.ratingStarColor,
                    ),
                    secondaryText(
                      text: '4.2',
                      color: AppColors.ratingStarColor,
                      fontSize: 18.sp,
                    ),
                  ],
                ),
              ],
            ),
            10.ht,
            secondaryText(
              text:
                  " I love his work hes is ver smart and it cleaning skills is top notch and also very friendly ",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
