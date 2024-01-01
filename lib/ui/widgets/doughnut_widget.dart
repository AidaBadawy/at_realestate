import 'package:aisu_realestate/models/sales_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutWidget extends StatelessWidget {
  final List<ChartData> data;
  final bool showLabel;

  const DoughnutWidget(
      {super.key, required this.data, required this.showLabel});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      margin: EdgeInsets.zero,
      //  title: ChartTitle(text: 'Monthly Rent Payment'),
      legend: Legend(isVisible: showLabel, position: LegendPosition.bottom),
      // tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        // Renders doughnut chart
        DoughnutSeries<ChartData, String>(
          enableTooltip: true,
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        )
      ],
    );
  }
}
