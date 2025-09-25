import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neat_nest/utilities/bottom_nav/bottom_navigation_screen.dart';

class SignInController {
  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isChecked = false;

  void setChecked(bool val) {
    isChecked = val;
    if (kDebugMode) {
      print('the value of val is:  $val');
    }
  }

  void submitData(BuildContext context) {
    String email;
    String password;

    email = emailController.text;
    password = passwordController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavigationScreen(yesData: true),
      ),
    );
    // if (email.isEmpty || password.isEmpty) {
    //   debugPrint("Please kindly provide valid login details");
    // } else if (!EmailValidator.validate(email)) {
    //   debugPrint("Please kindly enter a valid mail");
    // } else {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => BottomNavigationScreen(yesData: true),
    //     ),
    //   );
    // }
  }
}
