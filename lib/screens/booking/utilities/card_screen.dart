import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: double.infinity,
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h, bottom: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.black.withValues(alpha: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CachedNetworkImage(
                height: 40.h,
                width: 40.w,
                imageUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Mastercard_2019_logo.svg/1200px-Mastercard_2019_logo.svg.png",
              ),
            ],
          ),
          primaryText(
            text: "4536 **** **** 6971",
            color: Colors.white,
            fontSize: 15.sp,
          ),
          20.ht,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  secondaryText(text: "Card Holder Name"),
                  5.ht,
                  primaryText(
                    text: "Owovickky",
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ],
              ),
              20.wt,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  secondaryText(text: "Expiry Date"),
                  5.ht,
                  primaryText(
                    text: "30/03/27",
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
