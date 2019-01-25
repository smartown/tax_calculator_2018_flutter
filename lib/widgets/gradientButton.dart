import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry margin;
  final Function onClick;

  const GradientButton({Key key, this.title, this.margin, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: margin,
        height: 48,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            gradient:
                LinearGradient(colors: [Color(0xffff8755), Color(0xffff365d)])),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
