import 'package:dselect/screens/chat/chat_screen.dart';
import 'package:dselect/screens/journey/journey_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';
import 'home/home_screen.dart';
import 'chart/chart_screen.dart';
import 'nutrition/nutrition_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  static const routeName = '/nav-bar';
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  Color color = Colors.white;
  var selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ChartScreen(),
    NutritionScreen(),
    JourneyScreen(),
    ChatScreen(),
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
      backgroundColor: color,
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
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (value) => setState(() {
              selectedIndex = value;
              if (value == 3) {
                color = Color.fromRGBO(85, 139, 47, 1);
              } else
                color = Colors.white;
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
                label: 'Diet',
              ),
              BottomNavigationBarItem(
                icon: buildIcon(Icons.emoji_emotions),
                label: 'Learn',
              ),
              BottomNavigationBarItem(
                icon: buildIcon(Icons.chat_rounded),
                label: 'Chat',
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
