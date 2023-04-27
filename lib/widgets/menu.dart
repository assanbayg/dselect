import 'package:flutter/material.dart';
import '../providers/nutrition.dart';
import 'food_card.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final TextEditingController searchController = TextEditingController();
  List<Food> duplicateMenu = Food.generateMenu();
  List<Food> menu = [];

  void _filterSearchResults(String name) {
    setState(() {
      menu = duplicateMenu
          .where((food) => food.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    menu = duplicateMenu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: menu
                  .map((e) => FoodCard(
                        name: e.name,
                        link: e.imageUrl,
                        bu: e.bu,
                        kcal: e.totalKcal,
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
