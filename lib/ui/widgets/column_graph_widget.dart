import 'package:aisu_realestate/models/sales_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnGraphWidget extends StatelessWidget {
  final List<ChartData> data;
  final bool showLabel;

  const ColumnGraphWidget(
      {super.key, required this.data, required this.showLabel});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        isVisible: showLabel,
      ),
      primaryYAxis: NumericAxis(
        isVisible: showLabel,
        minimum: 0,
        maximum: 40,
        interval: 10,
      ),
      series: <ChartSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: 'Gold',
            width: .5,
            spacing: 2,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: const Color.fromRGBO(8, 142, 255, 1))
      ],
    );
  }
}
