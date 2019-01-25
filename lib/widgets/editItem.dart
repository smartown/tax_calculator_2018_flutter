import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditItem extends StatelessWidget {
  final String title;
  final int maxLength;
  final bool showDivider;
  final Function onTextChanged;

  EditItem(
      {Key key,
      this.title,
      this.maxLength = 9,
      this.showDivider = false,
      this.onTextChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: showDivider
          ? ShapeDecoration(
              shape: Border(bottom: BorderSide(color: Color(0xffeeeeee))))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Text(
              title,
              style: TextStyle(color: Color(0xff999999), fontSize: 16),
            ),
          ),
          Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 16, bottom: 16),
                    counterStyle: TextStyle(fontSize: 0, height: 0),
                    hintText: "请输入",
                    hintStyle:
                        TextStyle(color: Color(0xff999999), fontSize: 16)),
                textAlign: TextAlign.end,
                maxLines: 1,
                maxLength: maxLength,
                keyboardType: TextInputType.number,
                inputFormatters: [],
                onChanged: (text) {
                  onTextChanged(title, text);
                },
                style: TextStyle(
                    color: Color.fromRGBO(20, 26, 50, 1), fontSize: 24),
              ),
              flex: 1)
        ],
      ),
    );
  }
}

class NumberFormatter extends TextInputFormatter {
  RegExp exp = new RegExp(r"(\d.{0,1}\d)");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (exp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
