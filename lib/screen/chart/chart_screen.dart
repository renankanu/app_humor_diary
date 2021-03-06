import 'package:app_humor_diary/helper/humordata.dart';
import 'package:app_humor_diary/model/humor_card.dart';
import 'package:app_humor_diary/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class HumorChart extends StatefulWidget {
  @override
  _HumorChartState createState() => _HumorChartState();
}

class _HumorChartState extends State<HumorChart> {
  List<CircleAvatar> colors = [
    CircleAvatar(backgroundColor: Colors.red),
    CircleAvatar(backgroundColor: Colors.black),
    CircleAvatar(backgroundColor: Colors.pink),
    CircleAvatar(backgroundColor: Colors.purple),
    CircleAvatar(backgroundColor: Colors.green),
    CircleAvatar(backgroundColor: Colors.blue)
  ];

  List<String> colornames = ['Red', 'Black', 'Pink', 'Purple', 'Green', 'Blue'];
  double a = 0;
  double b = 0;
  double c = 0;
  double d = 0;
  double e = 0;
  double f = 0;
  double g = 0;
  double h = 0;
  double i = 0;
  double j = 0;
  double k = 0;
  double l = 0;
  double m = 0;
  double n = 0;
  double o = 0;
  double p = 0;
  double q = 0;
  double r = 0;
  double s = 0;

  Map<String, double> dataMap = Map();
  Map<String, double> dataMap2 = Map();
  void initState() {
    super.initState();
    Provider.of<HumorCard>(context, listen: false).data.forEach((element) {
      if (element.humorno == 1)
        a = a + 1;
      else if (element.humorno == 2)
        b = b + 1;
      else if (element.humorno == 3)
        c = c + 1;
      else if (element.humorno == 4)
        d = d + 1;
      else if (element.humorno == 5)
        e = e + 1;
      else
        f = f + 1;
    });

    Provider.of<HumorCard>(context, listen: false).actiname.forEach((element) {
      if (element == 'Sports')
        g = g + 1;
      else if (element == 'Sleep')
        h = h + 1;
      else if (element == 'Shop')
        i = i + 1;
      else if (element == 'Relax')
        j = j + 1;
      else if (element == 'Read')
        k = k + 1;
      else if (element == 'Movies')
        l = l + 1;
      else if (element == 'Gaming')
        m = m + 1;
      else if (element == 'Drink')
        n = n + 1;
      else if (element == 'Music')
        o = o + 1;
      else if (element == 'Excercise')
        p = p + 1;
      else if (element == 'Eat')
        q = q + 1;
      else if (element == 'Date')
        r = r + 1;
      else if (element == 'Clean') s = s + 1;
    });

    dataMap.putIfAbsent("Happy", () => b);
    dataMap.putIfAbsent("Sad", () => c);
    dataMap.putIfAbsent("Angry", () => a);
    dataMap.putIfAbsent("Surprised", () => d);
    dataMap.putIfAbsent("Scared", () => f);
    dataMap.putIfAbsent("Loving", () => e);
    dataMap2.putIfAbsent('Sports', () => g);
    dataMap2.putIfAbsent('Sleep', () => h);
    dataMap2.putIfAbsent('Shop', () => i);
    dataMap2.putIfAbsent('Relax', () => j);
    dataMap2.putIfAbsent('Read', () => k);
    dataMap2.putIfAbsent('Movies', () => l);
    dataMap2.putIfAbsent('Gaming', () => m);
    dataMap2.putIfAbsent('Drink', () => n);
    dataMap2.putIfAbsent('Music', () => o);
    dataMap2.putIfAbsent('Excercise', () => p);
    dataMap2.putIfAbsent('Eat', () => q);
    dataMap2.putIfAbsent('Date', () => r);
    dataMap2.putIfAbsent('Clean', () => s);
  }

  @override
  Widget build(BuildContext context) {
    List<HumorData> data = Provider.of<HumorCard>(context, listen: true).data;
    List<charts.Series<HumorData, String>> series = [
      charts.Series(
        id: 'Humors',
        data: data,
        domainFn: (HumorData series, _) => series.date,
        measureFn: (HumorData series, _) => series.humorno,
        colorFn: (HumorData series, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      )
    ];

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text('Humor Graph'),
          backgroundColor: CustomColors.comet),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              showLegends: true,
              legendPosition: LegendPosition.right,
              legendStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.watusi),
              decimalPlaces: 0,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.disc,
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 330,
              width: 400,
              child: PieChart(
                dataMap: dataMap2,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width / 2.7,
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                showLegends: true,
                legendPosition: LegendPosition.right,
                legendStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.watusi),
                decimalPlaces: 0,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.blueGrey[900].withOpacity(0.9),
                ),
                chartType: ChartType.disc,
              ),
            )
          ],
        ),
      ),
    );
  }
}
