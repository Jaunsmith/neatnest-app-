import 'package:flutter/cupertino.dart';

class EditProfileController {
  EditProfileController();

  TextEditingController fNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  DateTime lastEditedTime = DateTime.now();
  DateTime lastUserNameEdit = DateTime.now();

  void verifiedDetails() {
    fNameController.text = "Owolola Adedeji";
    userNameController.text = "Owovickky";
  }

  bool canEditDetails() {
    final now = DateTime.now();
    final difference = now.difference(lastEditedTime);
    return difference.inSeconds >= 20;
  }

  bool canUserNameDetails() {
    final now = DateTime.now();
    final difference = now.difference(lastUserNameEdit);
    return difference.inSeconds >= 30;
  }

  int timeLeft() {
    final now = DateTime.now();
    final elapsedIn = now.difference(lastEditedTime).inSeconds;
    final resetIn = 20 - elapsedIn;
    return resetIn > 0 ? resetIn : 0;
  }

  int userNameTimeLeft() {
    final now = DateTime.now();
    final elapsedIn = now.difference(lastUserNameEdit).inSeconds;
    final resetIn = 30 - elapsedIn;
    return resetIn > 0 ? resetIn : 0;
  }
}
