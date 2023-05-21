import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/glucose_level.dart';

class GlucoseStatus extends StatefulWidget {
  const GlucoseStatus({super.key});

  @override
  State<GlucoseStatus> createState() => _GlucoseStatusState();
}

class _GlucoseStatusState extends State<GlucoseStatus> {
  @override
  Widget build(BuildContext context) {
    TextStyle style =
        Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white);
    var provider = Provider.of<GlucoseLevel>(context);
    double value = provider.glucoseLevelList.last;
    double min = provider.min;
    double max = provider.max;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Max: $max', style: style),
              Text('Min: $min', style: style),
            ],
          ),
          Text(
              'Current: ${Provider.of<GlucoseLevel>(context).glucoseLevelList.last}',
              style: style),
        ],
      ),
    );
  }
}
