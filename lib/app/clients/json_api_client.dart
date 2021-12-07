import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oyinshyq/app/main/user_data.dart';
import 'package:oyinshyq/core/network/interfaces/base_client_generator.dart';
part 'json_api_client.freezed.dart';

@freezed
class PlaceHolderClient extends BaseClientGenerator with _$PlaceHolderClient {
  static final UserData _userData = UserData();
  // Routes
  const PlaceHolderClient._() : super();

  const factory PlaceHolderClient.getAllToy() = _GetAllToy;
  const factory PlaceHolderClient.getAllPayments() = _GetAllPayments;
  const factory PlaceHolderClient.getAllToyByName(String name) =
      _GetAllToyByName;

  @override
  String get baseURL => "http://localhost:8081/";

  @override
  Future<Map<String, dynamic>> get header async {
    return {
      // "accept": "application/json",
      // "content_language": await _userData.getLocale(),
      // "authorization": "Bearer " + await _userData.getToken(),
    };
  }

  @override
  String get path {
    return this.when<String>(
      getAllToy: () => 'card/toy/get/all',
      getAllToyByName: (String name) => 'card/toy/get/all/$name',
      getAllPayments: () => 'payment/payment/get/all',
    );
  }

  @override
  String get method {
    return this.maybeWhen<String>(
      orElse: () => 'GET',
      // login: (String phoneNumber) => 'POST',
    );
  }

  @override
  dynamic get body {
    return this.maybeWhen(
      orElse: () {
        return null;
      },
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return this.maybeWhen(
      orElse: () {
        return null;
      },
    );
  }
}
