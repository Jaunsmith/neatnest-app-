import 'package:flutter/material.dart';

import 'app_text.dart';

void showErrorMessage(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: primaryText(text: errorMessage, color: Colors.white),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      duration: Duration(seconds: 1),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.r),
      // ),
    ),
  );
}
