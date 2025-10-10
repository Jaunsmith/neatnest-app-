import 'package:flutter/material.dart';
import 'package:neat_nest/utilities/bottom_nav/bottom_navigation_screen.dart';
import 'package:neat_nest/widget/notificaiton_content.dart';

class SignUpController {
  SignUpController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  bool isChecked = false;
  String? role;

  void setChecked(bool val) {
    isChecked = val;
  }

  void setRole(String value) {
    role = value;
  }

  void testingData(BuildContext context) {
    final String mail;
    final String password;
    final String confirmPassword;
    final String name;
    final String username;

    mail = emailController.text;
    password = passwordController.text;
    name = nameController.text;
    confirmPassword = confirmPasswordController.text;
    username = userNameController.text;

    if (role == null || role!.isEmpty) {
      showErrorNotification(
        context: context,
        message: "Please kindly select a role ",
      );
    } else if (!isChecked) {
      showErrorNotification(
        context: context,
        message: "Please agree to the terms",
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
