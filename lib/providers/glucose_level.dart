import 'dart:developer';

import 'package:dselect/service/blood_level_service.dart';
import 'package:flutter/material.dart';

class GlucoseLevel with ChangeNotifier {
  final BloodLevelService _bloodLevelService = BloodLevelService();

  //normal range is 3.3-5.5 mmol/L
  Map<String, double> glucoseLevelRange = {
    'low': 3.3,
    'high': 5.5,
    'extreme': 15.5,
  };

  List<double> glucoseLevelList = [5, 5];
  List<Map<String, dynamic>> glucoseLevelDataList = [];

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

  Future<void> fetchBloodLevels() async {
    print("FETTch");
    final List<Map<String, dynamic>> bloodLevels =
        await _bloodLevelService.getBloodLevels();

    glucoseLevelList = bloodLevels
        .map((bloodLevel) => double.parse(bloodLevel['level'].toString()))
        .toList();

    glucoseLevelDataList = bloodLevels;
    log(glucoseLevelList.toString());
    notifyListeners();
  }

  Future<void> addNewValue(double newVal) async {
    await _bloodLevelService.createBloodLevel({'level': newVal});
    fetchBloodLevels();
  }
}
