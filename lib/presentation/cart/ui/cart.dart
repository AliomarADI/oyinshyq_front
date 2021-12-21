import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/cart/provider/cart_provider.dart';
import 'package:oyinshyq/presentation/index/index_provider.dart';
import 'package:oyinshyq/shared/theme.dart';
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
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
            ),
            body: model.isLoading
                ? LoadingView()
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
                    child: ListView.separated(
                      itemCount: model.payments.length,
                      // shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            trailing: Icon(FontAwesomeIcons.arrowRight),
                            leading: Icon(FontAwesomeIcons.tenge),
                            title: Text(
                              "Номер покупки: #${model.payments[index].id.toString()}",
                              style: TextStyle(fontSize: 19),
                            ),
                            subtitle: Text("Стоимость покупки: "
                                "${model.payments[index].amount.toString()}"
                                "тг"),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 3,
                        );
                      },
                    ),
                  )

            // ListView.builder(
            //     itemCount: model.payments.length,
            //     // shrinkWrap: true,
            //     physics: BouncingScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         trailing: Icon(Icons.arrow_right),
            //         leading: Icon(Icons.monetization_on),
            //         title: Text("Номер покупки: #" +
            //             model.payments[index].id.toString()),
            //         subtitle: Text("Стоимость покупки: " +
            //             model.payments[index].amount.toString() +
            //             "тг"),
            //       );
            //     }),
            );
      },
    );
  }
}
