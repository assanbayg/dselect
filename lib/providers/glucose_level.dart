import 'package:flutter/material.dart';

class GlucoseLevel with ChangeNotifier {
  //normal range is 3.3-5.5 mmol/L
  double glucoseLevel = 5.5;
  List<double> glucoseLevelList = [];
}
