import 'package:oyinshyq/app/clients/json_api_client.dart';
import 'package:oyinshyq/app/data/models/toy_model.dart';
import 'package:oyinshyq/core/freezed/network_error.dart';
import 'package:oyinshyq/core/freezed/result.dart';
import 'package:oyinshyq/core/network/layers/network_executer.dart';

class HomeService {
  Future<Result<List<ToyModel>, NetworkError>> getAllToys() async {
    return NetworkExecuter.execute(
        route: PlaceHolderClient.getAllToy(), responseType: ToyModel());
  }
}
