import 'package:dselect/providers/glucose_level.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GlucoseLevelHistoryScreen extends StatefulWidget {
  static const routeName = '/home/glucose_history';

  const GlucoseLevelHistoryScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _GlucoseLevelHistoryScreenState createState() =>
      _GlucoseLevelHistoryScreenState();
}

class _GlucoseLevelHistoryScreenState extends State<GlucoseLevelHistoryScreen> {
  @override
  void initState() {
    super.initState();
    final glucoseLevel = GlucoseLevel();
    glucoseLevel.fetchBloodLevels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Glucose Level History')),
        body: Consumer<GlucoseLevel>(
          builder: (ctx, glucoseLevels, _) => ListView.builder(
            itemCount: glucoseLevels.glucoseLevelDataList.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: Text(
                DateFormat('HH:mm')
                    .format(DateTime.parse(
                        glucoseLevels.glucoseLevelDataList[i]['timestamp']))
                    .toString(),
                style: const TextStyle(fontSize: 18.0),
              ),
              title: Text(
                '${glucoseLevels.glucoseLevelDataList[i]['level']} mmol/L',
                style: const TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                DateFormat('yyyy-MM-dd HH:mm')
                    .format(DateTime.parse(
                        glucoseLevels.glucoseLevelDataList[i]['timestamp']))
                    .toString(),
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
          ),
        ));
  }
}
