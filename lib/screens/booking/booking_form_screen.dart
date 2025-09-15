import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/controller/booking_form_controller.dart';
import 'package:neat_nest/screens/booking/notifiers/booking_date_state.dart';
import 'package:neat_nest/screens/booking/notifiers/booking_time_state.dart';
import 'package:neat_nest/screens/booking/widgets/booking_text_field.dart';
import 'package:neat_nest/screens/history/utilities/app_bar_icon.dart';
import 'package:neat_nest/screens/home/filter/widget/date_selector.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../utilities/constant/colors.dart';
import '../../widget/app_text.dart';
import '../history/utilities/text_filed_holder.dart';

class BookingFormScreen extends ConsumerStatefulWidget {
  const BookingFormScreen({super.key});

  @override
  ConsumerState<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends ConsumerState<BookingFormScreen> {
  late BookingFormController _bookingFormController;

  final List<String> times = const [
    "9:00 Am - 12:00Pm",
    "12:00 Am - 3:00Pm",
    "11:00 Am - 1:00Pm",
  ];

  @override
  void didChangeDependencies() {
    _bookingFormController = BookingFormController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bookingTime = ref.watch(bookingTimeStateProvider);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: primaryText(text: "Booking Form"),
          leading: AppBarIcon(
            icons: Icons.arrow_back_ios,
            function: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ht,
              BookingTextField(
                titleText: "Name",
                hintText: "Enter name",
                textEditingController:
                    _bookingFormController.bookingNameController,
              ),
              20.ht,
              BookingTextField(
                titleText: "Email Address",
                hintText: "Enter email Address",
                textEditingController:
                    _bookingFormController.bookingEmailController,
              ),
              20.ht,
              primaryText(text: "Date", fontSize: 15.sp),
              10.ht,
              DateSelector(
                initialDate: ref.watch(bookingDateStateProvider),
                onDatePicked: (date) {
                  ref.read(bookingDateStateProvider.notifier).pickedDate(date);
                },
              ),
              20.ht,
              primaryText(text: "Time", fontSize: 15.sp),
              10.ht,
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.containerLightBackground,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: DropdownButton(
                  hint: secondaryText(text: "Select Time"),
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  isExpanded: true,
                  value: bookingTime.isEmpty ? null : bookingTime,
                  underline: SizedBox(),
                  items: times.map((time) {
                    return DropdownMenuItem(
                      value: time,
                      child: secondaryText(text: time),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(bookingTimeStateProvider.notifier)
                          .timePicked(value);
                    }
                  },
                ),
              ),
              20.ht,
              TextFiledHolder(
                titleText: 'Additional Note',
                containerHeight: 150.h,
                hintText: 'Add note...',
                textAlign: TextAlign.start,
                controller: _bookingFormController.bookingNoteController,
              ),
              20.ht,
              AppButton(
                text: "Continue",
                fontSize: 20.sp,
                width: double.infinity,
                bckColor: AppColors.primaryColor,
                textColor: Colors.white,
                function: () {
                  _bookingFormController.onSubmit(ref, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
