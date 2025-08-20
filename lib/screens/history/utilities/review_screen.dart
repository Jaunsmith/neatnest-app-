import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/history/utilities/app_bar_icon.dart';
import 'package:neat_nest/screens/history/utilities/text_filed_holder.dart';
import 'package:neat_nest/utilities/app_data.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

import '../../../utilities/app_button.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 270.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ClipRRect(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: AppData.imagePathway[index],
                ),
              ),
            ),
            Positioned(
              top: 40.h,
              left: 20.w,
              child: AppBarIcon(
                icons: Icons.arrow_back,
                function: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: 240.h,
              right: 0,
              left: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          primaryText(
                            text: AppData.serviceName[index],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      5.ht,
                      Row(
                        children: [
                          secondaryText(
                            text: AppData.serviceProviderName[index],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          5.wt,
                          secondaryText(text: '|'),
                          5.wt,
                          Icon(
                            Icons.star,
                            size: 12.sp,
                            color: AppColors.ratingStarColor,
                          ),
                          secondaryText(
                            text: '4.2',
                            color: AppColors.ratingStarColor,
                            fontSize: 10.sp,
                          ),
                          3.wt,
                          secondaryText(text: "(530 Reviews)", fontSize: 10.sp),
                        ],
                      ),
                      20.ht,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Icon(
                              Icons.star,
                              color: AppColors.ratingStarColor,
                            ),
                          );
                        }),
                      ),
                      20.ht,
                      DottedLine(
                        dashColor: AppColors.secondaryTextColor.withOpacity(
                          0.5,
                        ),
                      ),
                      20.ht,
                      TextFiledHolder(titleText: 'Drop a Tip'),
                      20.ht,
                      TextFiledHolder(
                        titleText: 'Leave A review',
                        hintText: 'Enter here...',
                        textAlign: TextAlign.start,
                      ),
                      35.ht,
                      AppButton(
                        text: 'Submit',
                        bckColor: AppColors.primaryColor,
                        textColor: Colors.white,
                        function: () {
                          debugPrint("The Download button is clicked");
                        },
                        width: double.maxFinite,
                        verticalHeight: 13.h,
                        fontSize: 17.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
