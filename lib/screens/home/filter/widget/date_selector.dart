import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    super.key,
    required this.initialDate,
    this.onDatePicked,
    this.dateFormatString,
  });

  final DateTime initialDate;
  final ValueChanged<DateTime>? onDatePicked;
  final String? dateFormatString;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime _pickedDate;
  @override
  void initState() {
    _pickedDate = widget.initialDate;
    super.initState();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );

    if (picked != null && picked != _pickedDate) {
      setState(() {
        _pickedDate = picked;
      });
      widget.onDatePicked?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.containerLightBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          secondaryText(
            text: widget.dateFormatString != null
                ? DateFormat(widget.dateFormatString).format(_pickedDate)
                : DateFormat("EEEE,dd MMM,yyyy'").format(_pickedDate),
          ),
          10.wt,
          GestureDetector(
            onTap: () {
              _pickDate(context);
            },
            child: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
