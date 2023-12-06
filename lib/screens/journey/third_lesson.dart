import 'package:flutter/material.dart';
import 'package:dselect/widgets/journey/my_app_bar.dart';

class Lesson3Page extends StatelessWidget {
  const Lesson3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Why There\'s Nothing to Fear About Diabetes',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'What is diabetes?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Diabetes is not something to be afraid of. It is a condition that some people have, just like having a different color of hair or wearing glasses. It doesn\'t make you different or less special!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'How can we stay healthy with diabetes?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Even if someone has diabetes, they can still lead a happy and healthy life. They can eat yummy and nutritious food, exercise and play, and take medicine if needed. Diabetes doesn\'t stop them from doing things they love!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'What can we do to support others with diabetes?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We can be kind and understanding towards others who have diabetes. We can help them remember to take their medicine, eat healthy food together, and join in fun activities. Being a good friend is important!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('You finished all available routes!'),
          ));
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
