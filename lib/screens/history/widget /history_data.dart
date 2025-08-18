import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/data_screen.dart';

class HistoryData extends StatefulWidget {
  const HistoryData({super.key});

  @override
  State<HistoryData> createState() => _HistoryDataState();
}

class _HistoryDataState extends State<HistoryData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return DataScreen();
        },
      ),
    );
  }
}
