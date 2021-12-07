import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/searching/provider/searching_provider.dart';
import 'package:oyinshyq/shared/theme.dart';
import 'package:oyinshyq/widgets/loading_view.dart';

class SearchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseProvider<SearchinProvider>(
      model: SearchinProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.systemWhiteColor,
              centerTitle: false,
              title: TextFormField(
                controller: model.textController,
                onChanged: (value) async {
                  await model.search(value);
                },
                decoration: InputDecoration(labelText: 'Поиск'),
              )),
          body: model.isLoading
              ? LoadingView()
              : ListView.builder(
                  itemCount: model.toys.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/png/image1.jpg'),
                      ),
                      title: Text(
                          '${model.toys[index].name}: ${model.toys[index].price}tg'),
                    );
                  }),
        );
      },
    );
  }
}
