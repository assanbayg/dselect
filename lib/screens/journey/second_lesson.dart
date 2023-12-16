import 'package:dselect/providers/lesson.dart';
import 'package:dselect/widgets/journey/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Lesson2Page extends StatelessWidget {
  const Lesson2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Understanding Carbohydrates and Bread Units',
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What are carbohydrates?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Carbohydrates are special types of food that give us energy. They are found in things like bread, pasta, rice, and fruits. Our bodies need carbohydrates to stay healthy and strong!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'What are bread units?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bread units help us understand how much carbohydrate is in the food we eat. It\'s like a special measuring unit! For example, one slice of bread is equal to one bread unit. This helps us know how much carbohydrate we are eating and how it affects our bodies.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Why is it important to know about carbohydrates and bread units?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Knowing about carbohydrates and bread units helps us make healthy choices when we eat. We can decide how much carbohydrate we want to eat and how it might affect our bodies. It\'s like being a food detective!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Provider.of<Lessons>(context, listen: false).updateStatus(2);
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
