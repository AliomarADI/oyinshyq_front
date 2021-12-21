import 'package:flutter/material.dart';
import 'package:oyinshyq/base/base_bloc.dart';

class ChangeProfileProvider extends BaseBloc {
  bool isButtonEnabled = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  init(String? name, String? phone) {
    nameController.text = name!;
    phoneController.text = phone!;
    // changeUserData(context);
  }

  checkValues() {
    if(nameController.text.length > 1) {
      isButtonEnabled = true;
      notifyListeners();
    } else {
      isButtonEnabled = false;
      notifyListeners();
    }
  }
}