import 'package:flutter/material.dart';
import 'package:oyinshyq/presentation/index/index.dart';
import 'package:oyinshyq/presentation/onboarding/onboarding.dart';
import 'package:oyinshyq/shared/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adaptive Education',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        backgroundColor: AppColors.bgColor,
        fontFamily: 'Manrope',
      ),
      home:
          // IndexScreen()
          OnboardingScreen(),
    );
  }
}
