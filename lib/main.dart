import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './widgets/category_item.dart';
import './screens/category_meals_screens.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final List<Meal> favouriteMeals = [];
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  final List<Meal> favouriteMeals = [];
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final exixtingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exixtingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(exixtingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavourite(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "meals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeals),
        CategoryItem.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavourite, _isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters)
      },
    );
  }
}
