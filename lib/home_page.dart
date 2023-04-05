import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'models/bar_chart_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<BarChartModel> data = [
    
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.day,
        measureFn: (BarChartModel series, _) => series.amount,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bar Chart"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}
