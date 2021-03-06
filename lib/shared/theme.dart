import 'package:flutter/material.dart';
import 'package:oyinshyq/shared/size_config.dart';

class AppColors {
  ///[_Primary Colors]
  static const Color primaryColor = Color(0xff0D70E3);
  static const Color secondaryColor = Color(0xff0DB0E3);

  ///[_System Colors]
  static const Color systemBlackColor = Color(0xff041538);
  static const Color systemDarkGrayColor = Color(0xff4F5C74);
  static const Color systemLightGrayColor = Color(0xff8F98A8);
  static const Color systemWhiteColor = Color(0xffffffff);
  static const Color systemGreenColor = Color(0xff3BD79E);
  static const Color systemRedColor = Color(0xffF63535);
  static const Color inactiveColor = Color(0xffafb2b5);
  static const Color profileInfoLinesColor = Color(0xffEFF2F7);

  ///[_Divider]
  static const Color dividerColor = Color(0xffE9E9E9);

  ///[_Bottom nav bar]
  static const Color bottomNavBgColor = Color(0xffF1F1F1);

  ///[_Background Colors]
  static Color bgBlueColor = Color(0xff0D70E3).withOpacity(0.5);
  static const Color bgColor = Color(0xffF7F7F7);

  ///[_Whatsapp, Telegram]
  static const Color whatsAppColor = Color(0xff55CB6D);
  static const Color telegramColor = Color(0xff3B98DE);
}

final BoxDecoration kAppBarDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Color(0xff000000).withOpacity(0.05),
      spreadRadius: 4,
      blurRadius: 16,
      offset: Offset(0.0, 0.75),
    ),
  ],
);

final BoxDecoration kPinPutDecoration = BoxDecoration(
  color: Color(0xffF8F8F8),
  borderRadius: BorderRadius.circular(8),
);

final TextStyle kLargeTitleTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(18),
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
  color: AppColors.systemBlackColor,
);

final BoxShadow kWhiteBoxshadow = BoxShadow(
  color: Color(0xff000000).withOpacity(0.05),
  spreadRadius: 2,
  blurRadius: 16,
);
