import 'package:dselect/screens/journey/progress_map.dart';
import 'package:flutter/material.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyanAccent.shade200,
        body: Stack(
          children: [
            Container(
              height: size.height,
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/mountains_background.png'),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: const Text(
                        'Hey! Start your diabetes learning today!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                        height: size.width * 0.5,
                        child: Image.asset('assets/images/irbis.png')),
                  ],
                ),
                const ProgressMapWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
