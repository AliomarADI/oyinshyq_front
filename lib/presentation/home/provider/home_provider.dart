import 'package:flutter/src/widgets/framework.dart';
import 'package:oyinshyq/app/data/models/toy_model.dart';
import 'package:oyinshyq/app/data/services/home_service.dart';
import 'package:oyinshyq/base/base_bloc.dart';
import 'package:oyinshyq/core/freezed/network_error.dart';
import 'package:oyinshyq/core/freezed/result.dart';
import 'package:oyinshyq/presentation/home/ui/home.dart';

class HomeProvider extends BaseBloc {
  HomeService homeService = HomeService();
  List<ToyModel> toys = [];

  init(BuildContext context) async {
    setLoading(true);
    Result<List<ToyModel>, NetworkError> t = await homeService.getAllToys();
    t.when(success: (response) {
      toys = response;
      print('LENGTH:');
      print(toys.length);
    }, failure: (error) {
      //TODO write error text
    });
    setLoading(false);
  }
}
