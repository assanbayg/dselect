import 'package:dselect/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  static const routeName = '/tips/test';
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Test for type 2 diabetes'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
