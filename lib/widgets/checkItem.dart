import 'package:flutter/material.dart';

class CheckItem extends StatelessWidget {
  final String title;
  final bool showDivider;
  final bool isCheck;
  final Function onClick;

  CheckItem(
      {Key key,
      this.title,
      this.isCheck = false,
      this.showDivider = false,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 64,
        decoration: showDivider
            ? ShapeDecoration(
                shape: Border(bottom: BorderSide(color: Color(0xffeeeeee))))
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              isCheck
                  ? "images/check_box_check.png"
                  : "images/check_box_uncheck.png",
              width: 24,
              height: 24,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(20, 26, 50, 1),
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
