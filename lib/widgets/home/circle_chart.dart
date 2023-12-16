import 'package:dselect/widgets/chart/glucose_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/glucose_level.dart';

class CircleChart extends StatefulWidget {
  const CircleChart({super.key});

  @override
  State<CircleChart> createState() => _CircleChartState();
}

class _CircleChartState extends State<CircleChart> {
  @override
  void initState() {
    GlucoseLevel glucoseLevelProvider =
        Provider.of<GlucoseLevel>(context, listen: false);
    glucoseLevelProvider.fetchBloodLevels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<double> glucoseLevelList =
        Provider.of<GlucoseLevel>(context).glucoseLevelList;
    double glucoseLevel =
        Provider.of<GlucoseLevel>(context).glucoseLevelList.last;
    Map<String, double> glucoseLevelRange =
        Provider.of<GlucoseLevel>(context).glucoseLevelRange;

    String levelText = '';
    String tipText = '';
    Color color = Colors.green;

    if (glucoseLevel >= glucoseLevelRange['low']! &&
        glucoseLevel <= glucoseLevelRange['high']!) {
      setState(() {
        levelText = 'Your glucose level is ok';
        tipText = 'Relax, no need to worry';
        color = Colors.green;
      });
    }
    if (glucoseLevel > glucoseLevelRange['extreme']!) {
      setState(() {
        levelText = 'Your glucose level is very high!';
        tipText = 'You need to have rapid-acting insulin!';
        color = Colors.red;
      });
    }
    if (glucoseLevel > glucoseLevelRange['high']! &&
        glucoseLevel <= glucoseLevelRange['extreme']!) {
      setState(() {
        levelText = 'Your glucose level is high';
        tipText = 'Have a walk and exercise for a bit';
        color = Colors.yellow.shade600;
      });
    }
    if (glucoseLevel < glucoseLevelRange['low']!) {
      setState(() {
        levelText = 'Your glucose level is low!';
        tipText = 'Try to it something sweet';
        color = Colors.red;
      });
    }
    return Column(
      children: [
        Container(
          height: size.width * 0.5,
          margin: EdgeInsets.symmetric(
            vertical: size.width * 0.03,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: size.width * 0.03,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                glucoseLevel.toString(),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: color),
              ),
              Text(
                'mmol/L',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        Text(levelText),
        Container(
          height: size.height * 0.075,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: size.width * 0.02,
            left: size.width * 0.01,
            right: size.width * 0.01,
          ),
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02, horizontal: size.height * 0.03),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            border: Border.all(width: 2, color: color.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(tipText, style: TextStyle(color: color)),
        )
      ],
    );
  }
}
