import 'package:oyinshyq/app/clients/json_api_client.dart';
import 'package:oyinshyq/app/data/models/toy_model.dart';
import 'package:oyinshyq/core/freezed/network_error.dart';
import 'package:oyinshyq/core/freezed/result.dart';
import 'package:oyinshyq/core/network/layers/network_executer.dart';

class SearchService {
  Future<Result<List<ToyModel>, NetworkError>> getAllToysByName(
      String name) async {
    return NetworkExecuter.execute(
        route: PlaceHolderClient.getAllToyByName(name),
        responseType: ToyModel());
  }
}
