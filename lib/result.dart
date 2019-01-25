import 'package:flutter/material.dart';
import 'package:tax_calculator_2018/entity/constants.dart';
import 'package:tax_calculator_2018/main.dart';
import 'package:tax_calculator_2018/widgets/resultItem.dart';

class Result extends StatelessWidget {
  final Map<String, String> params;

  const Result({Key key, this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> result = calculate(params, rule20181001);
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 26, 50, 1),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(20, 26, 50, 1),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Part(
              widgets: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      "到手工资",
                      style: TextStyle(fontSize: 16, color: Color(0xff999999)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 8),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      result[dsgz],
                      style: TextStyle(
                          fontSize: 48,
                          color: Color.fromRGBO(20, 26, 50, 1)),
                    ),
                  ),
                ),
                ResultItem(title: sqyx, value: result[sqyx]),
                ResultItem(title: sbgrjn, value: result[sbgrjn]),
                ResultItem(title: gjjgrjn, value: result[gjjgrjn]),
                ResultItem(title: zxfjkc, value: result[zxfjkc]),
                ResultItem(title: qzd, value: result[qzd]),
                ResultItem(title: ynse, value: result[ynse]),
                ResultItem(title: sl, value: result[sl]),
                ResultItem(title: sskcs, value: result[sskcs]),
                ResultItem(title: grsds, value: result[grsds]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
