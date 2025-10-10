import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neat_nest/screens/user/widgets/row_data_holder.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/utilities/route/app_naviation_helper.dart';
import 'package:neat_nest/utilities/route/app_route_names.dart';
import 'package:neat_nest/widget/app_bar_holder.dart';

import '../../utilities/app_data.dart';
import '../../widget/app_text.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  final String role = "Worker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarHolder(
        title: 'Profile',
        function: () =>
            AppNavigatorHelper.go(context, AppRoute.bottomNavigation),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.ht,
            Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: AppColors.primaryColor,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      height: 60.r,
                      width: 60.r,
                      fit: BoxFit.cover,
                      imageUrl: AppData.imagePathway[1],
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: AppColors.primaryColor,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.person, color: Colors.white, size: 50.r),
                    ),
                  ),
                ),
                20.wt,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    primaryText(text: AppData.serviceProviderName[1]),
                    secondaryText(text: 'username'),
                  ],
                ),
              ],
            ),
            30.ht,
            DottedLine(
              dashColor: AppColors.secondaryTextColor.withValues(alpha: .5),
            ),
            30.ht,
            RowDataHolder(
              text: 'Edit Profile ',
              icons: FontAwesomeIcons.pencil,
              function: () {
                AppNavigatorHelper.push(context, AppRoute.editProfile);
              },
            ),
            20.ht,
            RowDataHolder(
              text: 'Manage Address',
              icons: Icons.location_on_outlined,
              function: () {},
            ),
            20.ht,
            RowDataHolder(
              text: role == "Worker" ? "Verification" : 'Payment Methods',
              icons: role == "Worker"
                  ? FontAwesomeIcons.addressCard
                  : FontAwesomeIcons.creditCard,
              function: () {
                if (role == "Worker") {
                  AppNavigatorHelper.push(
                    context,
                    AppRoute.workerVerificationScreen,
                  );
                } else {
                  print("This is user profile");
                }
              },
            ),
            20.ht,
            RowDataHolder(
              text: role == "Worker" ? "My Account Summary" : 'My booking',
              icons: Icons.calendar_month_outlined,
              function: () {},
            ),
            20.ht,
            RowDataHolder(
              text: 'Settings',
              icons: Icons.settings,
              function: () {},
            ),
            20.ht,
            RowDataHolder(
              text: 'Help Center',
              icons: FontAwesomeIcons.hireAHelper,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
