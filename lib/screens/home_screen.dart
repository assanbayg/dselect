import 'package:dselect/screens/insulin_history_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/circle_chart.dart';
import '../widgets/insulin_enter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(
            Icons.menu_rounded,
            color: theme.primaryColor,
          ),
        ),
        title: Text(
          'Welcome back!\nVenera',
          style: theme.textTheme.headlineSmall,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InsulinHistoryScreen.routeName);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Icon(
                Icons.notifications_rounded,
                color: Theme.of(context).primaryColor,
                size: 35,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        toolbarHeight: size.height * 0.1,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CircleChart(),
              InsulinEnter(),
            ],
          ),
        ),
      ),
    );
  }
}
