import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final String title;
  final String value;

  ResultItem({Key key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: ShapeDecoration(
          shape: Border(top: BorderSide(color: Color(0xffeeeeee)))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: Text(
                title,
                style: TextStyle(color: Color(0xff999999), fontSize: 16),
              ),
              flex: 1),
          Text(
            value,
            style:
                TextStyle(color: Color.fromRGBO(20, 26, 50, 1), fontSize: 16),
          )
        ],
      ),
    );
  }
}
