import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/glucose_level.dart';

class CircleChart extends StatefulWidget {
  const CircleChart({super.key});

  @override
  State<CircleChart> createState() => _CircleChartState();
}

class _CircleChartState extends State<CircleChart> {
  @override
  Widget build(BuildContext context) {
    double glucoseLevel = Provider.of<GlucoseLevel>(context).glucoseLevel;
    String levelText = 'Your glucose level is ok!';
    Color color = Colors.green;

    if (glucoseLevel >= 3.3 && glucoseLevel <= 5.5) {
      setState(() {
        levelText = 'Your glucose level is ok';
        color = Colors.green;
      });
    }
    if (glucoseLevel > 10) {
      setState(() {
        levelText = 'Your glucose level is very high!';
        color = Colors.red;
      });
    }
    if (glucoseLevel > 5.5 && glucoseLevel <= 10) {
      setState(() {
        levelText = 'Your glucose level is high';
        color = Colors.yellow;
      });
    }
    if (glucoseLevel < 3.3) {
      setState(() {
        levelText = 'Your glucose level is low!';
        color = Colors.red;
      });
    }
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.03,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          child: Text(
            glucoseLevel.toString(),
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: color),
          ),
        ),
        Text(levelText),
      ],
    );
  }
}
