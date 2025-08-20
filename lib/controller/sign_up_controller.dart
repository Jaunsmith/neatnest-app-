import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SignUpController {
  SignUpController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isChecked = false;

  void setChecked(bool val) {
    isChecked = val;
    if (kDebugMode) {
      print('the value of val is:  $val');
    }
  }

  void testingData() {
    final String mail;
    final String password;
    final String confirmPassword;
    final String name;
    final String address;

    mail = emailController.text;
    password = passwordController.text;
    name = nameController.text;
    address = addressController.text;
    confirmPassword = confirmPasswordController.text;

    debugPrint(
      "The user name enter is $mail and the password entered is $password and the check value is $isChecked",
    );
  }
}
