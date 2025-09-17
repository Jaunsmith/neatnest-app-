import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: primaryText(text: 'Notifications'),
          leading: AppBarIcon(
            icons: Icons.arrow_back,
            function: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              20.ht,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  primaryText(text: "Today", fontSize: 15.sp),
                  GestureDetector(
                    onTap: () {},
                    child: primaryText(
                      text: "mark all as read",
                      color: AppColors.primaryColor,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
