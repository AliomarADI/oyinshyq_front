import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/home/provider/home_provider.dart';
import 'package:oyinshyq/presentation/index/index_provider.dart';
import 'package:oyinshyq/shared/theme.dart';
import 'package:oyinshyq/widgets/loading_view.dart';

class HomeScreen extends StatelessWidget {
  final IndexProvider indexProvider;

  HomeScreen({required this.indexProvider});
  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
        model: HomeProvider(),
        onReady: (value) => value.init(context),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Главная"),
              centerTitle: true,
            ),
            body: model.isLoading
                ? LoadingView()
                : Container(
                    padding: EdgeInsets.all(20),
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        // shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: model.toys.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            child: Column(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/png/home_image.jpg')),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        Text(model.toys[index].name ??
                                            'Игрушка'),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              indexProvider.addToLikedToys(
                                                  model.toys[index]);
                                              print('added');
                                            },
                                            icon: Icon(Icons.add))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.systemWhiteColor,
                                borderRadius: BorderRadius.circular(15)),
                          );
                        }),
                  ),
          );
        });
  }
}
