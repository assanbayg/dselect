import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dselect/screens/home/glucose_level_history_screen.dart';
import 'package:dselect/screens/home/insulin_history_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? _userName;

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  Future<void> loadUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
    setState(() {
      _userName = userSnapshot.get('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
      return ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: Icon(icon, size: 36),
        onTap: tapHandler,
      );
    }

    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(children: [
          buildListTile(
            _userName ?? 'User',
            Icons.account_circle_rounded,
            () {},
          ),
          const Divider(thickness: 2),
          buildListTile('Glucose Level History', Icons.history, () {
            Navigator.of(context)
                .pushNamed(GlucoseLevelHistoryScreen.routeName);
          }),
          buildListTile('Insulin History', Icons.history, () {
            Navigator.of(context).pushNamed(InsulinHistoryScreen.routeName);
          }),
          buildListTile('Notifications', Icons.notifications_rounded, () {}),
        ]),
      ),
    );
  }
}
