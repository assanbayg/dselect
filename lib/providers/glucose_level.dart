import 'package:flutter/material.dart';

class GlucoseLevel with ChangeNotifier {
  //normal range is 3.3-5.5 mmol/L
  Map<String, double> glucoseLevelRange = {
    'low': 3.3,
    'high': 5.5,
    'extreme': 15.5,
  };

  List<double> glucoseLevelList = [
    11.7,
    10.4,
    9.8,
    14.7,
    14,
    13.5,
    12,
    13.8,
    14.5,
    15.5,
    13,
    11,
    5,
    10.8,
    9,
    6,
    8.9,
    9.7,
    10.9,
    10.4,
    11.6,
    8.7,
    7.5,
    5.9,
    6.6,
  ];

  double get max {
    double maxVal = 0.0;
    for (double val in glucoseLevelList) {
      if (val > maxVal) {
        maxVal = val;
      }
    }
    return maxVal;
  }

  double get min {
    double minVal = 100;
    for (double val in glucoseLevelList) {
      if (val < minVal) {
        minVal = val;
      }
    }
    return minVal;
  }

  void addNewValue(double newVal) {
    glucoseLevelList.add(newVal);
    glucoseLevelList.removeAt(0);
    notifyListeners();
  }
}
