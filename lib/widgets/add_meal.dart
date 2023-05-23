import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/nutrition.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _kcalController = TextEditingController();
  final TextEditingController _buController = TextEditingController();
  final TextEditingController _carbsController = TextEditingController();
  final TextEditingController _proteinController = TextEditingController();
  final TextEditingController _fatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Container(
      height: size.height * 0.6,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Add new meal',
            style: theme.textTheme.headlineSmall,
          ),
          Divider(color: Colors.grey.shade700),
          SizedBox(
            height: size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildInput('Name of a meal', _nameController, false, size),
                buildInput('URL of an image', _urlController, false, size),
                buildInput('Kcal for 100g', _kcalController, true, size),
                buildInput('BU in 100g', _buController, true, size),
                buildInput('Protein in 100g', _proteinController, true, size),
                buildInput('Carbs in 100g', _carbsController, true, size),
                buildInput('Fats in 100g', _fatController, true, size),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Provider.of<Nutrition>(context).menu.add(Food(
                    name: _nameController.text,
                    totalKcal: double.parse(_kcalController.text),
                    totalCarbohydrates: double.parse(_carbsController.text),
                    totalProteins: double.parse(_proteinController.text),
                    totalFats: double.parse(_fatController.text),
                    bu: double.parse(_buController.text),
                    imageUrl: _urlController.text));
              });
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  SizedBox buildInput(String hintText, TextEditingController controller,
      bool isNumber, Size size) {
    return SizedBox(
      width: size.width * 0.8,
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
