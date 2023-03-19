import 'package:flutter/material.dart';

class Insulin with ChangeNotifier {
  final List<String> _insulinTypes = [
    'rapid-acting',
    'short-acting',
    'intermediate-acting',
    'mixed',
    'long-acting',
  ];
  List<int> _dose = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  List<String> get insulinTypes => _insulinTypes;
  List<int> get dose => _dose;
}
