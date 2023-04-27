import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String link;
  final double kcal;
  final double bu;

  const FoodCard({
    super.key,
    required this.name,
    required this.link,
    required this.kcal,
    required this.bu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          SizedBox(height: 100, width: 100, child: Image.network(link)),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                'kcal: $kcal',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              Text(
                'BU: $bu',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
