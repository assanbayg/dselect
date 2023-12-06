import 'package:flutter/material.dart';

import '../../widgets/chart/glucose_status.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/chart/glucose_line_chart.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Analytics'),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: GlucoseLineChart(),
          ),
          GlucoseStatus(),
        ],
      ),
    );
  }
}
