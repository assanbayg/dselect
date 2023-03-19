import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';
import '../widgets/nutrition_card.dart';
import '../widgets/menu.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MyAppBar(title: 'Nutrition'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NutritionCard(),
              SizedBox(height: size.height * 0.02),
              const Menu(),
            ],
          ),
        ),
      ),
    );
  }
}
