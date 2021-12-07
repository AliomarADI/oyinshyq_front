import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:oyinshyq/app/main/user_data.dart';
import 'package:oyinshyq/base/base_bloc.dart';

class MyAppModel extends BaseBloc {
  final UserData _userData = UserData();
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();
  var _isAuthenticated = false;
  bool _isPrefillingRequired = false;
  bool _isActivationRequired = false;
  bool isOpeningFirstTime = false;
  Locale _appLocale = Locale("ru");

  Locale get appLocale => _appLocale;

  bool get isAuthenticated => _isAuthenticated;

  bool get isPrefillingRequired => _isPrefillingRequired;

  bool get isActivationRequired => _isActivationRequired;

  init() async {
    log('init called');
    var result = await Connectivity().checkConnectivity();
    log('result from init is: $result');
    connectionStatusController.add(result);
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      log('Internet result is: $result');
      connectionStatusController.add(result);
    });
  }

  Future<void> checkAuth() async {
    String? token = await _userData.getToken();
    print('token from init is $token');
    _isAuthenticated = token != "";
  }

  // Widget getHomeScreen() {
  //   if (_isAuthenticated && !_isPrefillingRequired && !_isActivationRequired) {
  //     return IndexScreen();
  //   } else if (_isAuthenticated && _isPrefillingRequired) {
  //     return CompanyNameScreen();
  //   } else if (_isAuthenticated &&
  //       !_isPrefillingRequired &&
  //       _isActivationRequired) {
  //     return ActivationScreen();
  //   } else {
  //     if (isOpeningFirstTime) {
  //       return SelectLanguage();
  //     } else {
  //       return LoginScreen();
  //     }
  //   }
  // }
}
