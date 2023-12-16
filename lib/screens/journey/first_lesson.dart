import 'package:dselect/providers/lesson.dart';
import 'package:dselect/widgets/journey/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Lesson1Page extends StatelessWidget {
  const Lesson1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Introduction to Diabetes'),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What is diabetes?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Diabetes is a condition that affects how our bodies use food for energy. It happens when our body has trouble using a special hormone called insulin.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Types of diabetes: type 1 and type 2',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'There are two main types of diabetes. Type 1 diabetes is when our body\'s insulin-making cells stop working. Type 2 diabetes is when our body has a hard time using insulin. Sometimes, our body needs a little help to use insulin properly.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Causes and risk factors',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'We don\'t know exactly why some people get diabetes, but certain things can make it more likely. Things like having family members with diabetes, eating too much unhealthy food, and not exercising enough can increase the chances of getting diabetes.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Provider.of<Lessons>(context, listen: false).updateStatus(1);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The next route is unlocked!'),
          ));
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
