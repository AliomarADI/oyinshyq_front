import 'package:flutter/src/widgets/framework.dart';
import 'package:oyinshyq/app/data/models/payment_model.dart';
import 'package:oyinshyq/app/data/services/payment_service.dart';
import 'package:oyinshyq/base/base_bloc.dart';
import 'package:oyinshyq/core/freezed/network_error.dart';
import 'package:oyinshyq/core/freezed/result.dart';

class CartProvider extends BaseBloc {
  List<PaymentModel> payments = [];
  PaymentService paymentService = PaymentService();

  init(BuildContext context) async {
    setLoading(true);
    Result<List<PaymentModel>, NetworkError> p =
        await paymentService.getAllPayments();

    p.when(
        success: (response) {
          payments = response;
        },
        failure: (error) {});
    setLoading(false);
  }
}
