import 'package:charts_flutter/flutter.dart' as charts;

class HumorData {
  String date;
  int humorno;
  final charts.Color barColor;

  HumorData(this.humorno, this.date, this.barColor);
}
