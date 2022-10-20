import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordablity { Affordable, Pricely, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordablity affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.steps,
    @required this.title,
  });
}
