import 'package:flutter/material.dart';
import 'package:tax_calculator_2018/entity/constants.dart';
import 'package:tax_calculator_2018/result.dart';
import 'package:tax_calculator_2018/widgets/checkItem.dart';
import 'package:tax_calculator_2018/widgets/editItem.dart';
import 'package:tax_calculator_2018/widgets/gradientButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<Main> {
  List<String> checkedItems = List();
  Map<String, String> values = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(20, 26, 50, 1),
        appBar: AppBar(
          title: Center(
            child: Text(title),
          ),
          backgroundColor: Color.fromRGBO(20, 26, 50, 1),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                EditPart(
                  items: [sqyx, sbgrjn, gjjgrjn],
                  onTextChanged: _updateValue,
                ),
                checkedItems.length > 0
                    ? EditPart(
                        items: checkedItems,
                        onTextChanged: _updateValue,
                      )
                    : Container(),
                GradientButton(
                  title: add(zxfjkc),
                  margin: EdgeInsets.all(8),
                  onClick: () {
                    _showDialog(context);
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatButton(
          checkInput: _checkInput,
        ));
  }

  _showDialog(context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
            checkedItems: List.from(checkedItems, growable: true),
            onConfirm: (checkedItems) {
              setState(() {
                this.checkedItems = checkedItems;
              });
            },
          ),
    );
  }

  _updateValue(title, text) {
    values[title] = text;
  }

  _isEmpty(String text) {
    return text == null || text.length <= 0;
  }

  _checkInput(context) {
    var yuexin = values[sqyx];
    if (_isEmpty(yuexin)) {
      _showSnackBar(context, pleaseInput(sqyx));
      return;
    }
    var shebao = values[sbgrjn];
    if (_isEmpty(shebao)) {
      _showSnackBar(context, pleaseInput(sbgrjn));
      return;
    }
    var gongjijin = values[gjjgrjn];
    if (_isEmpty(gongjijin)) {
      _showSnackBar(context, pleaseInput(gjjgrjn));
      return;
    }
    Map<String, String> params = Map();
    params[sqyx] = yuexin;
    params[sbgrjn] = shebao;
    params[gjjgrjn] = gongjijin;
    int kouchu = 0;
    for (var item in checkedItems) {
      var value = values[item];
      if (_isEmpty(value)) {
        _showSnackBar(context, pleaseInputDiscount(item));
        return;
      }
      params[item] = value;
      kouchu += int.parse(value);
    }
    params[zxfjkc] = kouchu.toString();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new Result(params: params);
    }));
  }

  _showSnackBar(context, text) {
    print(text);
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      backgroundColor: Color(0xffff365d),
    ));
  }
}

class FloatButton extends StatelessWidget {
  final Function checkInput;

  FloatButton({Key key, this.checkInput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkInput(context);
      },
      child: Container(
        decoration:
            ShapeDecoration(color: Color(0xff59d0cf), shape: CircleBorder()),
        width: 64,
        height: 64,
        child: Center(
          child: Image.asset(
            "images/calculate.png",
            width: 32,
            height: 32,
          ),
        ),
      ),
    );
  }
}

class Part extends StatelessWidget {
  final List<Widget> widgets;

  const Part({
    Key key,
    this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)))),
      child: Column(
        children: widgets,
      ),
    );
  }
}

class EditPart extends StatelessWidget {
  final List<String> items;
  final Function onTextChanged;

  const EditPart({Key key, this.items, this.onTextChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List(items.length);
    for (int i = 0; i < items.length; i++) {
      widgets[i] = EditItem(
        title: items[i],
        showDivider: i != items.length - 1,
        onTextChanged: onTextChanged,
      );
    }
    return Part(
      widgets: widgets,
    );
  }
}

class Dialog extends StatefulWidget {
  final List<String> checkedItems;
  final Function onConfirm;

  const Dialog({Key key, this.checkedItems, this.onConfirm}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DialogState(checkedItems, onConfirm);
  }
}

class DialogState extends State<Dialog> {
  List<String> items = [znjy, jxjy, dbyl, zfdklx, zfzj, sylr];
  List<String> checkedItems = List();
  final Function onConfirm;

  DialogState(this.checkedItems, this.onConfirm);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List(items.length);
    for (int i = 0; i < items.length; i++) {
      widgets[i] = CheckItem(
        title: items[i],
        isCheck: checkedItems.contains(items[i]),
        showDivider: i != items.length - 1,
        onClick: () {
          _switchSelection(items[i]);
        },
      );
    }
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Material(
        type: MaterialType.transparency,
        child: Container(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Part(
                    widgets: widgets,
                  ),
                  GradientButton(
                    title: confirm,
                    margin: EdgeInsets.all(8),
                    onClick: () {
                      Navigator.pop(context);
                      onConfirm(checkedItems);
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }

  _switchSelection(title) {
    setState(() {
      if (checkedItems.contains(title)) {
        checkedItems.remove(title);
      } else {
        checkedItems.add(title);
      }
    });
  }
}
