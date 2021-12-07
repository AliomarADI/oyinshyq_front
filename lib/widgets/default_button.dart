import 'package:flutter/material.dart';
import 'package:oyinshyq/shared/size_config.dart';
import 'package:oyinshyq/shared/theme.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({this.text, this.press, this.color, this.width});
  final String? text;
  final Function? press;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? null : width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          primary: color == null ? AppColors.primaryColor : color,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w500,
            color: AppColors.systemWhiteColor,
          ),
        ),
      ),
    );
  }
}
