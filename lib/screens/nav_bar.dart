import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';
import 'home_screen.dart';
import 'chart_screen.dart';
import 'nutrition_screen.dart';
import 'tips_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  static const routeName = '/nav-bar';
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  var selectedIndex = 0;
  static const List<Widget> screens = [
    HomeScreen(),
    ChartScreen(),
    NutritionScreen(),
    TipsScreen(),
  ];

  Widget buildIcon(IconData icon) {
    return Icon(
      icon,
      size: MediaQuery.of(context).size.height * 0.04,
    );
  }

  Widget buildAssetIcon(String assetName) {
    return ImageIcon(
      AssetImage(assetName),
      size: MediaQuery.of(context).size.height * 0.03,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (value) => setState(() {
              selectedIndex = value;
            }),
            items: [
              BottomNavigationBarItem(
                icon: buildAssetIcon('assets/icons/home.png'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: buildIcon(Icons.bar_chart_rounded),
                label: 'Chart',
              ),
              BottomNavigationBarItem(
                icon: buildIcon(Icons.restaurant_rounded),
                label: 'Nutrition',
              ),
              BottomNavigationBarItem(
                icon: buildIcon(Icons.tips_and_updates_rounded),
                label: 'Tips',
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
