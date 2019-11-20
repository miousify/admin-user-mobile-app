import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutter/material.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 0),
      child: SimpleBarChart.withSampleData(),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 40),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 75),
      new OrdinalSales('2018', 5),
      new OrdinalSales('2019', 25),
      new OrdinalSales('2020', 100),
      new OrdinalSales('2021', 150),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.Color(g: 10, b: 0, r: 10),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
