import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neat_nest/utilities/bottom_nav/bottom_navigation_screen.dart';

import '../widget/app_text.dart';

class SignUpController {
  SignUpController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isChecked = false;
  String? role;

  void setChecked(bool val) {
    isChecked = val;
    if (kDebugMode) {
      print('the value of val is:  $val');
    }
  }

  void setRole(String value) {
    role = value;
  }

  void testingData(BuildContext context) {
    final String mail;
    final String password;
    final String confirmPassword;
    final String name;
    final String address;

    mail = emailController.text;
    password = passwordController.text;
    name = nameController.text;
    confirmPassword = confirmPasswordController.text;

    if (mail.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        confirmPassword.isEmpty ||
        role == null) {
      debugPrint("Please kindly filled all field");
    } else if (!EmailValidator.validate(mail)) {
      debugPrint("Please Kindly enter a valid email address");
    } else if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: primaryText(
            text: "Password cant be less than 8 character",
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          elevation: 6,
          duration: Duration(seconds: 1),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10.r),
          // ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationScreen(yesData: true),
        ),
      );
    }
  }
}
