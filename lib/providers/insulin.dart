import 'package:dselect/service/insulin_service.dart';
import 'package:flutter/material.dart';

class Insulin with ChangeNotifier {
  final List<String> insulinTypes = [
    'rapid-acting',
    'short-acting',
    'intermediate-acting',
    'mixed',
    'long-acting',
  ];
  final List<int> _dose = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // Map<int, String> get insulinTypesMap => _insulinTypesMap;
  List<int> get dose => _dose;
}

class InsulinEntry {
  DateTime time;
  double units;
  String insulinType;

  InsulinEntry(this.time, this.units, this.insulinType);
}

class InsulinEntryProvider with ChangeNotifier {
  final InsulinService _insulinService = InsulinService();
  List<InsulinEntry> insulinTakes = [];

  Future<void> fetchInsulinTakes() async {
    final List<Map<String, dynamic>> fetchedInsulinTakes =
        await _insulinService.getInsulinTakes();
    insulinTakes = fetchedInsulinTakes
        .map((e) => InsulinEntry(
            DateTime.parse(e['timestamp']), e["units"], 'radid-acting'))
        .toList();
    notifyListeners();
  }
}
