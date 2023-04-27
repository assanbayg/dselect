import 'package:dselect/providers/glucose_level.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/insulin.dart';

class InsulinEnter extends StatefulWidget {
  const InsulinEnter({super.key});

  @override
  State<InsulinEnter> createState() => _InsulinEnterState();
}

class _InsulinEnterState extends State<InsulinEnter> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<int> list = Provider.of<Insulin>(context).dose;
    List<String> insulinTypes = Provider.of<Insulin>(context).insulinTypes;

    int doseValue = list.first;
    String type = insulinTypes.first;

    return Container(
      height: size.height * 0.25,
      margin: EdgeInsets.only(
        top: size.width * 0.05,
      ),
      padding: EdgeInsets.all(size.height * 0.02),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        onChanged: (val) {},
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
                    onChanged: (val) {},
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
              SizedBox(width: size.width * 0.03),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Enter'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Glucose level'),
                  SizedBox(width: size.width * 0.08),
                  SizedBox(
                    width: size.width * 0.15,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.bodyMedium,
                      onSubmitted: (value) {
                        Provider.of<GlucoseLevel>(context, listen: false)
                            .addNewValue(double.parse(value));
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Add')),
            ],
          ),
        ],
      ),
    );
  }
}
