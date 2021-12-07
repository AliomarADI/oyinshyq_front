import 'package:flutter/material.dart';
import 'package:oyinshyq/base/base_bloc.dart';
import 'package:oyinshyq/presentation/index/index.dart';

class VerificationProvider extends BaseBloc {
  TextEditingController controller = TextEditingController();
  String? pin;
  bool isButtonEnabled = false;
  bool sendSmsAgain = true;
  String? pinError;

  checkPin(String value) {
    if (value.length == 4) {
      pin = value;
      isButtonEnabled = true;
      notifyListeners();
    } else {
      isButtonEnabled = false;
      notifyListeners();
    }
  }

  void toRegisterCompany(BuildContext context, String? phone) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => IndexScreen()));
  }
}
