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
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
            ),
            body: model.isLoading
                ? LoadingView()
                : Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(0),
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
                                    child: Image.asset(index == 1
                                        ? 'assets/images/png/home_image.jpg'
                                        : index % 3 == 0
                                            ? "assets/images/png/toy1.jpg"
                                            : index % 5 == 0
                                                ? "assets/images/png/toy2.jpg"
                                                : index % 7 == 0
                                                    ? "assets/images/png/toy3.jpg"
                                                    : index % 8 == 0
                                                        ? "assets/images/png/toy4.jpg"
                                                        : index % 9 == 0
                                                            ? "assets/images/png/toy1.jpg"
                                                            : "assets/images/png/toy6.jpg")),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(model.toys[index].name ??
                                            'Игрушка'),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              model.addToLikedToys(model.toys
                                                  .indexOf(model.toys[index]));
                                              print('added');
                                            },
                                            icon: model.likedToys[index]
                                                ? Icon(Icons.check)
                                                : Icon(Icons.add))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.systemWhiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.primaryColor
                                          .withOpacity(0.25),
                                      offset: Offset(2, 3),
                                      blurRadius: 1,
                                      spreadRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(15)),
                          );
                        }),
                  ),
          );
        });
  }
}
