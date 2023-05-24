import 'package:flutter/widgets.dart';

class Nutrition with ChangeNotifier {
  double totalKcal = 0;
  double totalCarbohydrates = 0;
  double totalProteins = 0;
  double totalFats = 0;

  void updateStats(double kcal, carbs, proteins, fats) {
    totalKcal += kcal;
    totalCarbohydrates += carbs;
    totalProteins += proteins;
    totalFats += fats;
    notifyListeners();
  }

  List<Food> eatedFood = [];

  List<Food> menu = [
    Food(
      name: 'Borscht',
      totalKcal: 0.33,
      totalCarbohydrates: 4.3,
      totalProteins: 2.8,
      totalFats: 2.4,
      bu: 0.33,
      imageUrl:
          'https://www.seriouseats.com/thmb/yfX1_61oE0sslBovpNAB59EKoaI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2017__01__20161212-borscht-vicky-wasik-13-a57b9fc72b0d40f8a4a10e79a9ab78dd.jpg',
    ),
    Food(
      name: 'Cottage Cheese 0.6%',
      totalKcal: 110,
      totalCarbohydrates: 3,
      totalProteins: 22,
      totalFats: 0,
      bu: 0.25,
      imageUrl:
          'https://ss.sport-express.ru/userfiles/materials/172/1723410/volga.jpg',
    ),
    Food(
      name: 'Lentil soup',
      totalKcal: 67.8,
      totalCarbohydrates: 5.2,
      totalProteins: 2.5,
      totalFats: 4.2,
      bu: 0.42,
      imageUrl:
          'https://www.maggi.ru/data/images/recept/img640x500/recept_2124_5jmv.jpg',
    ),
    Food(
      name: 'Honey cake',
      totalKcal: 311.1,
      totalCarbohydrates: 62.3,
      totalProteins: 8.3,
      totalFats: 3.9,
      bu: 5.17,
      imageUrl:
          'https://www.gastronom.ru/binfiles/images/20151001/bf10f42c.jpg',
    )
  ];
}

class Food with ChangeNotifier {
  String name;
  double totalKcal;
  double totalCarbohydrates;
  double totalProteins;
  double totalFats;
  double bu;
  String imageUrl;

  Food({
    required this.name,
    required this.totalKcal,
    required this.totalCarbohydrates,
    required this.totalProteins,
    required this.totalFats,
    required this.bu,
    required this.imageUrl,
  });
}
