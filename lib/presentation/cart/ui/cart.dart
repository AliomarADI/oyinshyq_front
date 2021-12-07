import 'package:flutter/material.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/cart/provider/cart_provider.dart';
import 'package:oyinshyq/presentation/index/index_provider.dart';
import 'package:oyinshyq/widgets/loading_view.dart';

class CartScreen extends StatelessWidget {
  IndexProvider? indexProvider;
  CartScreen({required this.indexProvider});
  @override
  Widget build(BuildContext context) {
    return BaseProvider<CartProvider>(
      model: CartProvider(),
      onReady: (value) async => await value.init(context),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("История покупок"),
            centerTitle: true,
          ),
          body: model.isLoading
              ? LoadingView()
              : ListView.builder(
                  itemCount: model.payments.length,
                  // shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Icon(Icons.arrow_right),
                      leading: Icon(Icons.monetization_on),
                      title: Text("Номер покупки: #" +
                          model.payments[index].id.toString()),
                      subtitle: Text("Стоимость покупки: " +
                          model.payments[index].amount.toString() +
                          "тг"),
                    );
                  }),
        );
      },
    );
  }
}
