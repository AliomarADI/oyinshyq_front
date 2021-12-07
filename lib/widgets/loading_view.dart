import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oyinshyq/shared/theme.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDancingSquare(
        size: MediaQuery.of(context).size.width * 0.4,
        color: AppColors.primaryColor,
      ),
    );
  }
}
