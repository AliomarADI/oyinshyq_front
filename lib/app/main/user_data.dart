import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  void setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    print('token set: $token');
  }

  void deleteToken() async {
    print('delete token called');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', "");
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('token');
    return value ?? "";
  }
}
