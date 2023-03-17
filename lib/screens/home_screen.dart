import 'package:dselect/widgets/insulin_enter.dart';
import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';
import '../widgets/circle_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(title: 'Home'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: const [
            CircleChart(),
            InsulinEnter(),
          ],
        ),
      ),
    );
  }
}
