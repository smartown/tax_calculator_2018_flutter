class Rule {
  int start;
  List<Item> rule;

  Rule(this.start, this.rule);
}

class Item {
  int min;
  int max;
  double ratio;
  int quick;

  Item(this.min, this.max, this.ratio, this.quick);
}
