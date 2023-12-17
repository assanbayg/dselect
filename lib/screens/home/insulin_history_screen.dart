// ignore_for_file: library_private_types_in_public_api

import 'package:dselect/providers/insulin.dart';
import 'package:dselect/widgets/journey/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InsulinHistoryScreen extends StatefulWidget {
  static const routeName = '/home/history';

  const InsulinHistoryScreen({super.key});
  @override
  _InsulinHistoryScreenState createState() => _InsulinHistoryScreenState();
}

class _InsulinHistoryScreenState extends State<InsulinHistoryScreen> {
  final List<InsulinEntry> _insulinEntries = [
    InsulinEntry(
        time: DateTime(2023, 4, 27, 8, 0),
        insulinType: 'rapid-acting',
        units: 25),
    InsulinEntry(
      time: DateTime(2023, 4, 27, 12, 0),
      units: 10,
      insulinType: 'short-acting',
    ),
    InsulinEntry(
      time: DateTime(2023, 4, 27, 17, 0),
      units: 15,
      insulinType: 'long-acting',
    ),
  ];

  @override
  void initState() {
    InsulinEntryProvider provider = InsulinEntryProvider();
    provider.fetchInsulinTakes();
    super.initState();
  }

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
              DateFormat('HH:mm').format(insulinEntry.time).toString(),
              style: const TextStyle(fontSize: 18.0),
            ),
            title: Text(
              '${insulinEntry.units} units',
              style: const TextStyle(fontSize: 18.0),
            ),
            //trailing: Text('${insulinEntry.insulinType}'),
            subtitle: Text(
              DateFormat('yyyy-MM-dd HH:mm')
                  .format(insulinEntry.time)
                  .toString(),
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
              builder: (BuildContext context) => const AddInsulinEntryScreen(),
            ),
          );
          setState(() {
            _insulinEntries.add(newEntry);
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InsulinEntry {
  DateTime time;
  String insulinType;
  int units;

  InsulinEntry({
    required this.time,
    required this.insulinType,
    required this.units,
  });
}

class AddInsulinEntryScreen extends StatefulWidget {
  const AddInsulinEntryScreen({super.key});

  @override
  _AddInsulinEntryScreenState createState() => _AddInsulinEntryScreenState();
}

class _AddInsulinEntryScreenState extends State<AddInsulinEntryScreen> {
  final TextEditingController _unitsController = TextEditingController();
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<int> list = Provider.of<Insulin>(context).dose;
    List<String> insulinTypes = Provider.of<Insulin>(context).insulinTypes;

    int doseValue = list.first;
    String type = insulinTypes.first;
    return Scaffold(
      appBar: MyAppBar(title: 'Add insulin enter'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Text('Bread Units'),
                    SizedBox(width: size.width * 0.15),
                    DropdownButton(
                      value: doseValue,
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (val) {
                        doseValue = val ?? list.first;
                      },
                      items: list.map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                DropdownButton(
                  value: type,
                  style: Theme.of(context).textTheme.bodyMedium,
                  onChanged: (val) {
                    setState(() {
                      type = val ?? 'Rapid-acting';
                    });
                  },
                  items: insulinTypes
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Time of insulin injection:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: Text(
                DateFormat('HH:mm').format(_selectedTime).toString(),
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

          Navigator.pop(
            context,
            InsulinEntry(
                time: _selectedTime, units: doseValue, insulinType: type),
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
