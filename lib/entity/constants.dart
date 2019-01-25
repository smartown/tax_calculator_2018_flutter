import 'package:tax_calculator_2018/entity/Rule.dart';

final String sqyx = "税前月薪";
final String sbgrjn = "社保个人缴纳";
final String gjjgrjn = "公积金个人缴纳";
final String znjy = "子女教育";
final String jxjy = "继续教育";
final String dbyl = "大病医疗";
final String zfdklx = "住房贷款利息";
final String zfzj = "住房租金";
final String sylr = "赡养老人";
final String zxfjkc = "专项附加扣除";
final String qzd = "起征点";
final String ynse = "应纳税额";
final String sl = "税率";
final String grsds = "个人所得税";
final String sskcs = "速算扣除数";
final String dsgz = "到手工资";

final String title = "2018新个税计算器";
final String confirm = "确认";

final rule20181001 = Rule(5000, [
  Item(0, 3000, 0.03, 0),
  Item(3000, 12000, 0.1, 210),
  Item(12000, 25000, 0.2, 1410),
  Item(25000, 35000, 0.25, 2660),
  Item(35000, 55000, 0.3, 4410),
  Item(55000, 80000, 0.35, 7160),
  Item(80000, -1, 0.45, 15160),
]);

String add(title) {
  return "添加$title";
}

String pleaseInput(title) {
  return "请输入$title";
}

String pleaseInputDiscount(title) {
  return "请输入$title扣除金额";
}

Map<String, String> calculate(Map<String, String> params, Rule rule) {
  Map<String, String> result = Map<String, String>();
  result.addAll(params);
  //应纳税所得税额
  var yingnashuie = double.parse(params[sqyx]) -
      double.parse(params[sbgrjn]) -
      double.parse(params[gjjgrjn]) -
      double.parse(params[zxfjkc]) -
      rule.start;
  if (yingnashuie < 0) {
    yingnashuie = 0;
  }
  //速算扣除数
  int susuankouchushu = 0;
  //税率
  double shuilv = 0;
  //个人所得税=应纳所得税额×税率-速算扣除数
  double gerensuodeshui = 0;

  if (yingnashuie > 0) {
    Item jisuanguize;
    for (Item item in rule.rule) {
      if (yingnashuie > item.min &&
          (yingnashuie <= item.max || item.max == -1)) {
        jisuanguize = item;
        break;
      }
    }
    if (jisuanguize != null) {
      susuankouchushu = jisuanguize.quick;
      shuilv = jisuanguize.ratio;
      gerensuodeshui = yingnashuie * shuilv - susuankouchushu;
    }
  }
  result[qzd] = rule.start.toString();
  result[ynse] = yingnashuie.toStringAsFixed(2);
  result[sl] = "${(shuilv * 100).toInt()}%";
  result[grsds] = gerensuodeshui.toStringAsFixed(2);
  result[sskcs] = susuankouchushu.toString();
  result[dsgz] = (double.parse(params[sqyx]) -
          double.parse(params[sbgrjn]) -
          double.parse(params[gjjgrjn]) -
          gerensuodeshui)
      .toStringAsFixed(2);
  return result;
}
