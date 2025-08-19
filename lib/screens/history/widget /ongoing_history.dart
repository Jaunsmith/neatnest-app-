import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/data_screen.dart';

class OngoingHistory extends StatefulWidget {
  const OngoingHistory({super.key});

  @override
  State<OngoingHistory> createState() => _OngoingHistoryState();
}

class _OngoingHistoryState extends State<OngoingHistory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return DataScreen(text1: 'Cancel', text2: 'E-Receipt', index: index);
        },
      ),
    );
  }
}
