import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

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

  void submitData() {}
}
