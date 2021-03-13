import 'package:flutter/material.dart';
import 'package:mealo/dummy_data.dart';
import 'package:mealo/models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
// import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existedMeal = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (existedMeal >= 0) {
        _favoriteMeals.removeAt(existedMeal);
      } else {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    });
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mealo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (_) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailsScreen.routeName: (_) => MealDetailsScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(
              currentFilters: filters,
              setFilters: _setFilters,
            ),
      },
    );
  }
}
