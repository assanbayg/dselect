import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../providers/glucose_level.dart';

class GlucoseLineChart extends StatefulWidget {
  const GlucoseLineChart({super.key});

  @override
  State<GlucoseLineChart> createState() => _GlucoseLineChartState();
}

class _GlucoseLineChartState extends State<GlucoseLineChart> {
  List<Color> gradientColors = [Colors.cyan, Colors.blue.shade700];
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: LineChart(
            showAvg ? avgData() : mainData(),
          ),
        ),
        TextButton(
          onPressed: () => setState(() => showAvg = !showAvg),
          child: const Text('Average sugar'),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        (value.toInt()).toString(),
        style: Theme.of(context).textTheme.bodySmall!,
      ),
    );
  }

  LineChartData mainData() {
    List<double> glucoseList =
        Provider.of<GlucoseLevel>(context).glucoseLevelList;

    double max = glucoseList.last;
    double min = glucoseList.last;
    for (double val in glucoseList) {
      if (val > max) max = val;
      if (val < min) min = val;
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: Colors.grey, strokeWidth: 1);
        },
        getDrawingVerticalLine: (value) {
          return FlLine(color: Colors.grey, strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 2,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 24,
      minY: min - 1,
      maxY: max + 1,
      lineBarsData: [
        LineChartBarData(
          spots: glucoseList.asMap().entries.map((entry) {
            final index = entry.key;
            final value = entry.value;
            return FlSpot(index.toDouble(), value.toDouble());
          }).toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    List<double> glucoseList =
        Provider.of<GlucoseLevel>(context).glucoseLevelList;

    double max = glucoseList.last;
    double min = glucoseList.last;
    double avg = glucoseList.reduce((a, b) => a + b) / 24;
    for (double val in glucoseList) {
      if (val > max) max = val;
      if (val < min) min = val;
    }

    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 2,
          ),
        ),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 24,
      minY: min - 1,
      maxY: max - 1,
      lineBarsData: [
        LineChartBarData(
          spots: glucoseList
              .asMap()
              .entries
              .map((entry) => FlSpot(entry.key.toDouble(), avg))
              .toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
