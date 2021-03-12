import 'package:flutter/material.dart';
import './screens/tab_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
// import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (_) => TabsScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (_) => MealDetailsScreen(),
      },
    );
  }
}
