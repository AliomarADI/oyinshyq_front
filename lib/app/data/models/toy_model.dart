import 'package:oyinshyq/core/network/interfaces/base_network_model.dart';

class ToyModel extends BaseNetworkModel<ToyModel> {
  int? id;
  String? name;
  double? price;
  int? quantity;
  String? description;

  ToyModel({this.id, this.name, this.price, this.quantity, this.description});

  ToyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    return data;
  }

  @override
  ToyModel fromJson(Map<String, dynamic> json) {
    return ToyModel.fromJson(json);
  }
}
