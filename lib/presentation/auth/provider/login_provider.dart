import 'package:flutter/material.dart';
import 'package:oyinshyq/base/base_bloc.dart';
import 'package:oyinshyq/presentation/auth/ui/verifictaion.dart';

class LoginProvider extends BaseBloc {
  TextEditingController controller = TextEditingController();

  bool isButtonEnabled = false;
  checkPhoneNumber(String value) {
    if (value.length == 12) {
      isButtonEnabled = true;
      notifyListeners();
    } else {
      isButtonEnabled = false;
      notifyListeners();
    }
  }

  void toVerification(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VerificationScreen()));
  }
}
