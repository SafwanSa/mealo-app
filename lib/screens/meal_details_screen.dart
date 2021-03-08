import 'package:flutter/material.dart';
import 'package:mealo/dummy_data.dart';
import 'package:mealo/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static String routeName = '/meal-details';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final meal = DUMMY_MEALS.where((meal) {
      return meal.id == routeArgs['id'];
    }).toList()[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Container(
        child: Text("Meal"),
      ),
    );
  }
}
