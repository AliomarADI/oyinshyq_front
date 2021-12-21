import 'package:flutter/material.dart';
import 'package:oyinshyq/app/data/models/profile.dart';
import 'package:oyinshyq/base/base_bloc.dart';

class ProfileProvider extends BaseBloc {
  var user = User(
      imagePath: 'assets/images/png/maveric.jpg',
      name: 'Didar',
      phone: '+7 707 934 58 25',
      about:
          'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.');

  changeProfile(String name, String phone) {
    user.name = name;
    user.phone = phone;
    notifyListeners();
  }
}
