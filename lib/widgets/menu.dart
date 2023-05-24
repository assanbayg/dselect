// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dselect/providers/nutrition.dart';
import 'package:dselect/widgets/food_card.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final TextEditingController searchController = TextEditingController();
  List<Food> menu = [];
  List<Food> duplicateMenu = [];
  bool on = false;

  @override
  void initState() {
    menu = duplicateMenu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    duplicateMenu = Provider.of<Nutrition>(context).menu;
    void _filterSearchResults(String name) {
      setState(() {
        menu = duplicateMenu
            .where(
                (food) => food.name.toLowerCase().contains(name.toLowerCase()))
            .toList();
      });
    }

    return Column(
      children: [
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: SingleChildScrollView(
                      child: Column(
                        children: Provider.of<Nutrition>(context)
                            .eatedFood
                            .map((e) => FoodCard(
                                  food: e,
                                ))
                            .toList(),
                      ),
                    ),
                  );
                });
          },
          child: const Text('Eated food'),
        ),
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            hintText: 'Search',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
            contentPadding: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.search),
          ),
          onChanged: (val) => _filterSearchResults(val),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        on
            ? SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: menu
                        .map((e) => FoodCard(
                              food: e,
                            ))
                        .toList(),
                  ),
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    on = true;
                    searchController.text = 'Try';
                  });
                },
                child: const Text('Menu'),
              ),
      ],
    );
  }
}
