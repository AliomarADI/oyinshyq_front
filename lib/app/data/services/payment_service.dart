import 'package:oyinshyq/app/clients/json_api_client.dart';
import 'package:oyinshyq/app/data/models/payment_model.dart';
import 'package:oyinshyq/core/freezed/network_error.dart';
import 'package:oyinshyq/core/freezed/result.dart';
import 'package:oyinshyq/core/network/layers/network_executer.dart';

class PaymentService {
  Future<Result<List<PaymentModel>, NetworkError>> getAllPayments() async {
    return NetworkExecuter.execute(
        route: PlaceHolderClient.getAllPayments(),
        responseType: PaymentModel());
  }
}
