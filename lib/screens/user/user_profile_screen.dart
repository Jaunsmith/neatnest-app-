import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neat_nest/screens/history/utilities/app_bar_icon.dart';
import 'package:neat_nest/screens/user/widgets/row_data_holder.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../utilities/app_data.dart';
import '../../widget/app_text.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: primaryText(text: 'Profile'),
          leading: GestureDetector(
            child: AppBarIcon(
              icons: Icons.arrow_back,
              function: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Column(
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
                    primaryText(text: 'Oladiti Yusuf'),
                    secondaryText(text: 'oladiti1@gmail.com'),
                  ],
                ),
              ],
            ),
            30.ht,
            DottedLine(
              dashColor: AppColors.secondaryTextColor.withOpacity(0.5),
            ),
            30.ht,
            RowDataHolder(
              text: 'Edit Profile ',
              icons: FontAwesomeIcons.pencil,
              function: () {},
            ),
            20.ht,
            RowDataHolder(
              text: 'Manage Address',
              icons: Icons.location_on_outlined,
              function: () {},
            ),
            20.ht,
            RowDataHolder(
              text: 'Payment Methods',
              icons: FontAwesomeIcons.creditCard,
              function: () {},
            ),
            20.ht,
            RowDataHolder(
              text: 'My booking',
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
