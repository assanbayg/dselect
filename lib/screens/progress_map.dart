import 'package:dselect/providers/lesson.dart';
import 'package:dselect/screens/first_lesson.dart';
import 'package:dselect/screens/second_lesson.dart';
import 'package:dselect/screens/third_lesson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressMapWidget extends StatefulWidget {
  const ProgressMapWidget({super.key});

  @override
  State<ProgressMapWidget> createState() => _ProgressMapWidgetState();
}

class _ProgressMapWidgetState extends State<ProgressMapWidget> {
  List<Lesson> lessons = [];

  List screens = const [
    Lesson1Page(),
    Lesson2Page(),
    Lesson3Page(),
  ];

  @override
  Widget build(BuildContext context) {
    lessons = Provider.of<Lessons>(context, listen: true).lessons;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          final lesson = lessons[index];
          final bool isCompleted = lesson.isCompleted;
          final bool isInProgress = !isCompleted && index == 0;

          return GestureDetector(
            onTap: () {
              if (!lessons[index].isCompleted) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Finish previous route!'),
                  ),
                );
                return;
              }
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => screens[index],
              ));
            },
            child: Container(
              width: size.width * 0.25,
              height: size.width * 0.25,
              margin: EdgeInsets.all(size.width * 0.025),
              decoration: BoxDecoration(
                color: Provider.of<Lessons>(context, listen: false)
                        .lessons[index]
                        .isCompleted
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
            ),
          );
        },
      ),
    );
  }
}
