import 'package:flutter/material.dart';

class InsulinEnter extends StatelessWidget {
  const InsulinEnter({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<int> list = [1, 2, 3, 4, 5, 6, 7];
    int dropdownButtonValue = list.first;

    return Container(
      height: size.height * 0.10,
      margin: EdgeInsets.all(size.height * 0.02),
      padding: EdgeInsets.all(size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton(
            value: dropdownButtonValue,
            style: Theme.of(context).textTheme.bodyMedium,
            onChanged: (val) {},
            items: list.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Enter'),
          ),
        ],
      ),
    );
  }
}
