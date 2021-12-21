import 'package:flutter/material.dart';
import 'package:oyinshyq/shared/theme.dart';

class AppBarChildWithBackButton extends StatelessWidget {
  final String title;
  const AppBarChildWithBackButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text(
          title,
          style: kLargeTitleTextStyle,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Container(),
          onPressed: () {},
        ),
      ],
    );
  }
}
