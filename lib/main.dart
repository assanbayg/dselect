import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';
import 'providers/glucose_level.dart';
import 'providers/insulin.dart';
import 'providers/nutrition.dart';
import 'screens/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GlucoseLevel()),
        ChangeNotifierProvider(create: (context) => Insulin()),
        ChangeNotifierProvider(create: (context) => Nutrition()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DSelect',
        theme: basisTheme(),
        home: const NavigationBarScreen(),
      ),
    );
  }
}
