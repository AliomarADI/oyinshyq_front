import 'package:flutter/material.dart';
import 'package:oyinshyq/app/data/models/toy_model.dart';
import 'package:oyinshyq/app/data/services/search_service.dart';
import 'package:oyinshyq/base/base_bloc.dart';
import 'package:oyinshyq/core/freezed/network_error.dart';
import 'package:oyinshyq/core/freezed/result.dart';

class SearchinProvider extends BaseBloc {
  TextEditingController textController = TextEditingController();
  SearchService searchService = SearchService();
  List<ToyModel> toys = [];

  search(String value) async {
    setLoading(true);
    Result<List<ToyModel>, NetworkError> t =
        await searchService.getAllToysByName(textController.text);
    t.when(
        success: (response) {
          toys = response;
        },
        failure: (error) {});
    setLoading(false);
  }
}
