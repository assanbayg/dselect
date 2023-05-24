import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final bool isCompleted;

  Lesson(this.title, this.isCompleted);
}

class Lessons with ChangeNotifier {
  List<Lesson> lessons = [
    Lesson('1st', true),
    Lesson('2nd', false),
    Lesson('3d', false),
  ];
}
