import 'package:dselect/providers/nutrition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
  final Food food;

  const FoodCard({
    super.key,
    required this.food,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(widget.food.imageUrl)),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    'kcal: ${widget.food.totalKcal}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey),
                  ),
                  Text(
                    'BU: ${widget.food.bu}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Food food = widget.food;
                setState(() {
                  Provider.of<Nutrition>(context, listen: false)
                      .eatedFood
                      .add(food);
                });

                // Provider.of<Nutrition>(context, listen: false).totalKcal +=
                //     food.totalKcal;
                // Provider.of<Nutrition>(context, listen: false)
                //     .totalCarbohydrates += food.totalCarbohydrates;
                // Provider.of<Nutrition>(context, listen: false).totalProteins +=
                //     food.totalProteins;
                // Provider.of<Nutrition>(context, listen: false).totalFats +=
                //     food.totalFats;
                Provider.of<Nutrition>(context, listen: false).updateStats(
                  food.totalKcal,
                  food.totalCarbohydrates,
                  food.totalProteins,
                  food.totalFats,
                );
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 30)),
              child: const Text('I eated this')),
        ],
      ),
    );
  }
}
