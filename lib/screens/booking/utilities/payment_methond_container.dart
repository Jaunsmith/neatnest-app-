import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/models/payment_method_model.dart';
import 'package:neat_nest/screens/booking/notifiers/selected_payment_index.dart';
import 'package:neat_nest/screens/history/utilities/app_bar_icon.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

Widget paymentMethodContainer({
  required int index,
  required PaymentMethodModel paymentMethod,
  required WidgetRef ref,
  required int? selectedPayment,
  Color? iconColor,
}) {
  return GestureDetector(
    onTap: () {
      ref.read(selectedPaymentIndexProvider.notifier).pickedIndex(index);
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.containerLightBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppBarIcon(
                icons: paymentMethod.icon,
                function: () {},
                iconColor: AppColors.primaryColor,
                bckColor: AppColors.primaryColor.withValues(alpha: 0.1),
              ),
              10.wt,
              primaryText(text: paymentMethod.title, fontSize: 15.sp),
            ],
          ),
          Radio<int>(
            value: index,
            activeColor: AppColors.primaryColor,
            groupValue: selectedPayment,
            onChanged: (value) {
              ref
                  .read(selectedPaymentIndexProvider.notifier)
                  .pickedIndex(value!);
            },
          ),
        ],
      ),
    ),
  );
}
