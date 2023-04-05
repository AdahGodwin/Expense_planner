import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String day;
  double amount;
  final charts.Color color;

  BarChartModel({
    required this.day,
    required this.amount,
    required this.color,
  });
}
