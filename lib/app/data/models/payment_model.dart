import 'package:oyinshyq/core/network/interfaces/base_network_model.dart';

class PaymentModel extends BaseNetworkModel<PaymentModel> {
  int? id;
  String? paymentType;
  int? amount;
  bool? successful;

  PaymentModel({this.id, this.paymentType, this.amount, this.successful});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentType = json['paymentType'];
    amount = json['amount'];
    successful = json['successful'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paymentType'] = this.paymentType;
    data['amount'] = this.amount;
    data['successful'] = this.successful;
    return data;
  }

  @override
  PaymentModel fromJson(Map<String, dynamic> json) {
    return PaymentModel.fromJson(json);
  }
}
