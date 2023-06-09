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
      appBar: AppBar(
        title: Text('Add Insulin Entry'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the number of units:',
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              controller: _unitsController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Text(
              'Select the time of your insulin injection:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text(
                '${_selectedTime.hour}:${_selectedTime.minute}',
                style: TextStyle(fontSize: 18.0),
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
        onPressed: () {
          String units = _unitsController.text;
          if (units.isEmpty) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Please enter the number of units.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
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
        child: Icon(Icons.check),
      ),
    );
  }
}
