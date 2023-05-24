import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Lesson {
  final String title;
  bool isCompleted;

  Lesson(this.title, this.isCompleted);
}

class Lessons with ChangeNotifier {
  List<Lesson> lessons = [
    Lesson('What is Diabetes?', true),
    Lesson('Carbohydrates and BU', false),
    Lesson('You can do it!', false),
  ];

  void updateStatus(int index) {
    lessons[index].isCompleted = true;
    notifyListeners();
  }
}
