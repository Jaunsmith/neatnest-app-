import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/history/utilities/re_book_screen.dart';

import '../../../utilities/app_data.dart';
import '../utilities/data_screen.dart';

class CancelledHistoryScreen extends StatelessWidget {
  const CancelledHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return DataScreen(
            text1: 'Delete',
            text2: 'Re-Book',
            index: index,
            nextPage: ReBookScreen(),
            serviceName: AppData.serviceName[index],
            serviceProvider: AppData.serviceProviderName[index],
            imagePath: AppData.imagePathway[index],
            price: AppData.price[index],
          );
        },
      ),
    );
  }
}
