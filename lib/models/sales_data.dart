import 'package:flutter/material.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final int year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  Color? color;
}

// class ChartDataTwo {
//   ChartDataTwo(this.x, this.y);
 
//   final String x;
//   final double y;
// }