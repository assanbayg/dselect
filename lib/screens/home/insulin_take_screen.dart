import 'package:dselect/providers/insulin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddInsulinEntryScreen extends StatefulWidget {
  const AddInsulinEntryScreen({super.key});

  @override
  _AddInsulinEntryScreenState createState() => _AddInsulinEntryScreenState();
}

class _AddInsulinEntryScreenState extends State<AddInsulinEntryScreen> {
  final TextEditingController _unitsController = TextEditingController();
  DateTime _selectedTime = DateTime.now();
  String _selectedInsulinType = 'rapid-acting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Insulin Entry'),
        ),
        body: Scaffold(
          appBar: AppBar(
            title: const Text('Add Insulin Entry'),
          ),
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
                const SizedBox(height: 16.0),
                const Text(
                  'Select your insulin type:',
                  style: TextStyle(fontSize: 18.0),
                ),
                DropdownButton<String>(
                  value: _selectedInsulinType,
                  items: Provider.of<Insulin>(context)
                      .insulinTypes
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedInsulinType = newValue!;
                    });
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
                double unitsInt = double.parse(units);
                Navigator.pop(
                  context,
                  InsulinEntry(_selectedTime, unitsInt, _selectedInsulinType),
                );
              }
            },
            child: const Icon(Icons.check),
          ),
        ));
  }
}
