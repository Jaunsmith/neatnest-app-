import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  String date() {
    DateTime now = DateTime.now();
    String format = DateFormat(' EEEE,dd MMM,yyyy').format(now);
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://eliezergroup.com/wp-content/webp-express/webp-images/uploads/2019/09/shutterstock_406477204.jpg.webp',
                        ),
                      ),
                    ),
                    10.wt,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        primaryText(text: 'Home Cleaning'),
                        5.ht,
                        secondaryText(text: 'David Palmer'),
                      ],
                    ),
                  ],
                ),
                10.ht,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        primaryText(
                          text: date(),
                          fontSize: 10.sp,
                          color: AppColors.blackTextColor.withOpacity(0.75),
                        ),
                        secondaryText(text: 'Date'),
                      ],
                    ),
                    Row(
                      children: [
                        primaryText(text: '\$1,600'),
                        secondaryText(text: '/hour'),
                      ],
                    ),
                  ],
                ),
                10.ht,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
