import 'package:dselect/providers/lesson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressMapWidget extends StatelessWidget {
  List<Lesson> lessons = [];

  @override
  Widget build(BuildContext context) {
    lessons = Provider.of<Lessons>(context).lessons;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      width: size.width * 0.9,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          final lesson = lessons[index];
          final bool isCompleted = lesson.isCompleted;
          final bool isInProgress = !isCompleted && index == 0;

          return Container(
            width: size.width * 0.25,
            height: size.width * 0.25,
            margin: EdgeInsets.all(size.width * 0.025),
            decoration: BoxDecoration(
              color: isCompleted
                  ? Colors.green
                  : (isInProgress ? Colors.blue : Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                lesson.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
