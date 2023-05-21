import 'package:dselect/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/my_app_bar.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Information'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              title: const Text('Test for type 2 diabetes'),
              trailing: const Icon(Icons.east),
              onTap: () => Navigator.pushNamed(context, TestScreen.routeName),
            ),
            ListTile(
              title: const Text('What is diabetes?'),
              trailing: const Icon(Icons.east),
              onTap: () async {
                final Uri _url = Uri.parse(
                    'https://www.who.int/news-room/fact-sheets/detail/diabetes');

                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                }
              },
            ),
            ListTile(
              title: const Text('Tips for diabetes management '),
              trailing: const Icon(Icons.east),
              onTap: () {},
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.indigo.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tip of the day',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const Text(
                      'Try to avoid fried food since it takes metabolize glucose',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
