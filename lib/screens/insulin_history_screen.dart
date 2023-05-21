// ignore_for_file: library_private_types_in_public_api

import 'package:dselect/main.dart';
import 'package:dselect/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class InsulinHistoryScreen extends StatefulWidget {
  static const routeName = '/home/history';
  @override
  _InsulinHistoryScreenState createState() => _InsulinHistoryScreenState();
}

class _InsulinHistoryScreenState extends State<InsulinHistoryScreen> {
  List<InsulinEntry> _insulinEntries = [
    InsulinEntry(DateTime(2023, 4, 27, 8, 0), 25),
    InsulinEntry(DateTime(2023, 4, 27, 12, 0), 10),
    InsulinEntry(DateTime(2023, 4, 27, 17, 0), 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Insulin History'),
      body: ListView.builder(
        itemCount: _insulinEntries.length,
        itemBuilder: (BuildContext context, int index) {
          InsulinEntry insulinEntry = _insulinEntries[index];
          return ListTile(
            leading: Text(
              '${insulinEntry.time.hour}:${insulinEntry.time.minute}',
              style: const TextStyle(fontSize: 18.0),
            ),
            title: Text(
              '${insulinEntry.units} units',
              style: const TextStyle(fontSize: 18.0),
            ),
            subtitle: Text(
              insulinEntry.time.toString(),
              style: const TextStyle(fontSize: 14.0),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          InsulinEntry newEntry = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddInsulinEntryScreen(),
            ),
          );
          if (newEntry != null) {
            setState(() {
              _insulinEntries.add(newEntry);
            });
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InsulinEntry {
  DateTime time;
  int units;

  InsulinEntry(this.time, this.units);
}

class AddInsulinEntryScreen extends StatefulWidget {
  @override
  _AddInsulinEntryScreenState createState() => _AddInsulinEntryScreenState();
}

class _AddInsulinEntryScreenState extends State<AddInsulinEntryScreen> {
  final TextEditingController _unitsController = TextEditingController();
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Add insulin enter'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter the number of units:',
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              controller: _unitsController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Select the time of your insulin injection:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: Text(
                '${_selectedTime.hour}:${_selectedTime.minute}',
                style: const TextStyle(fontSize: 18.0),
              ),
              onTap: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(_selectedTime),
                );
                if (selectedTime != null) {
                  setState(() {
                    _selectedTime = DateTime(
                      _selectedTime.year,
                      _selectedTime.month,
                      _selectedTime.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );
                  });
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          String units = _unitsController.text;
          if (units.isEmpty) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Please enter the number of units.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          } else {
            int unitsInt = int.parse(units);
            Navigator.pop(
              context,
              InsulinEntry(_selectedTime, unitsInt),
            );
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
