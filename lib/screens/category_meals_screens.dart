import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> dispalyedMeals;
  bool loadedInitdata = false;
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    if (!loadedInitdata) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryid = routeArgs['id'];
      dispalyedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryid);
      }).toList();
      loadedInitdata = true;
    }

    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      dispalyedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: dispalyedMeals[index].id,
              title: dispalyedMeals[index].title,
              affordablity: dispalyedMeals[index].affordability,
              complexity: dispalyedMeals[index].complexity,
              duration: dispalyedMeals[index].duration,
              imageurl: dispalyedMeals[index].imageUrl,
            );
          },
          itemCount: dispalyedMeals.length),
    );
  }
}
