import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:ui'; // Import this for ImageFilter.

class RecentActivityGraphWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Align(
        alignment: Alignment.topCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.bar_chart, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        minY: 50, // Set minimum y-value to include 50
                        maxY: 100, // Set maximum y-value to include 100
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          horizontalInterval: 10, // Increased for reduced frequency
                          verticalInterval: 1, // Adjust as needed for vertical lines
                        ),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return Text('1');
                                  case 1:
                                    return Text('2');
                                  case 2:
                                    return Text('3');
                                  case 3:
                                    return Text('4');
                                  case 4:
                                    return Text('5');
                                  default:
                                    return Text('');
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                TextStyle customStyle = TextStyle(
                                  fontSize: 12, // Adjusted font size
                                  fontWeight: FontWeight.bold,
                                );
                                // Convert value to int to remove the decimal point
                                return Text(value.toInt().toString(), style: customStyle);
                              },
                              reservedSize: 40, // Adjusted reserved size for labels
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 70),
                              FlSpot(1, 85),
                              FlSpot(2, 75),
                              FlSpot(3, 90),
                              FlSpot(4, 95),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            barWidth: 5,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
