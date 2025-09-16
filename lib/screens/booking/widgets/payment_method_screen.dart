import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/booking/notifiers/selected_payment_index.dart';
import 'package:neat_nest/screens/booking/utilities/dotted_container.dart';
import 'package:neat_nest/screens/booking/utilities/payment_methond_container.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/app_data.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class PaymentMethodScreen extends ConsumerWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPaymentIndex = ref.watch(selectedPaymentIndexProvider);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 40.h),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: primaryText(text: "Select Payment Method"),
          leading: AppBarIcon(
            icons: Icons.arrow_back_ios,
            function: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            20.ht,
            primaryText(text: "Cash"),
            10.ht,
            paymentMethodContainer(
              index: 0,
              paymentMethod: AppData.addPayment[0],
              ref: ref,
              selectedPayment: myPaymentIndex,
              iconColor: AppColors.primaryColor,
            ),
            20.ht,
            primaryText(text: "More payment options", fontSize: 15.sp),
            20.ht,
            ...List.generate(AppData.addPayment.length - 1, (index) {
              final newIndex = index + 1;
              return paymentMethodContainer(
                index: newIndex,
                paymentMethod: AppData.addPayment[newIndex],
                ref: ref,
                selectedPayment: myPaymentIndex,
              );
            }),
            20.ht,
            DottedContainer(text: "Add new card"),
            50.ht,
            AppButton(
              text: "Continue",
              fontSize: 18.sp,
              width: double.infinity,
              bckColor: AppColors.primaryColor,
              textColor: Colors.white,
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentMethodScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
