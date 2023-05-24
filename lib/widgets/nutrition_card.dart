import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/nutrition.dart';

class NutritionCard extends StatefulWidget {
  const NutritionCard({super.key});

  @override
  State<NutritionCard> createState() => _NutritionCardState();
}

class _NutritionCardState extends State<NutritionCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.15,
      padding: EdgeInsets.all(size.width * 0.025),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: double.maxFinite,
            width: size.width * 0.25,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${Provider.of<Nutrition>(context, listen: true).totalKcal.toInt()}\nkcal',
              style: theme.textTheme.bodyLarge!,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(width: size.width * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        height: 15,
                        child: CircleAvatar(backgroundColor: Colors.red),
                      ),
                      Text('Carbs: '),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        height: 15,
                        child: CircleAvatar(backgroundColor: Colors.green),
                      ),
                      Text('Proteins: '),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        height: 15,
                        child: CircleAvatar(backgroundColor: Colors.yellow),
                      ),
                      Text('Fats: '),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      '${Provider.of<Nutrition>(context, listen: true).totalCarbohydrates.round()}g'),
                  Text(
                      '${Provider.of<Nutrition>(context, listen: true).totalProteins}g'),
                  Text(
                      '${Provider.of<Nutrition>(context, listen: true).totalFats.round()}g'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
