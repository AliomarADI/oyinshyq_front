import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;
  final BoxDecoration? decoration;

  CustomAppBar({
    required this.child,
    this.height = kToolbarHeight,
    this.decoration,
  }) : super(
          preferredSize: Size.fromHeight(height),
          child: child,
        );

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.only(bottom: 10),
      alignment: Alignment.bottomCenter,
      child: child,
      decoration: decoration,
    );
  }
}
