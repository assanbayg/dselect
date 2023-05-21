import 'package:dselect/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  static const routeName = '/tips/test';
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController _fastingPlasmaGlucoseController =
      TextEditingController();
  String _result = '';

  void _interpretResult(double fastingPlasmaGlucose) {
    if (fastingPlasmaGlucose >= 126) {
      _result = 'You may have diabetes';
    } else if (fastingPlasmaGlucose >= 100 && fastingPlasmaGlucose < 126) {
      _result = 'You are at risk for diabetes';
    } else {
      _result = 'Your fasting plasma glucose level is normal';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Test for type 2 diabetes'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.15,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                'This test for educational purposes only and should not be used as a substitute for medical advice or a professional diagnosis.',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 30),
            const Text(
              'Enter your fasting plasma glucose level:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                controller: _fastingPlasmaGlucoseController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'mg/dL',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double fastingPlasmaGlucose = double.tryParse(
                    _fastingPlasmaGlucoseController.text.trim())!;
                if (fastingPlasmaGlucose != null) {
                  setState(() {
                    _interpretResult(fastingPlasmaGlucose);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please enter a valid number'),
                  ));
                }
              },
              child: const Text('Results'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _result,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
