import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/history/utilities/app_bar_icon.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: primaryText(text: 'MY Booking'),
          leading: AppBarIcon(icons: Icons.arrow_back),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.ht,
            TabBar(
              controller: _controller,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.secondaryTextColor,
              labelStyle: TextStyle(fontWeight: FontWeight.w500),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: AppColors.primaryColor,
                ),
                insets: EdgeInsets.symmetric(horizontal: -20, vertical: 0),
              ),
              tabs: [
                Text(
                  'Ongoing',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Cancelled',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            20.ht,
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  Center(child: Text('Ongoing content')),
                  Center(child: Text('Completed content')),
                  Center(child: Text('Cancelled content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
