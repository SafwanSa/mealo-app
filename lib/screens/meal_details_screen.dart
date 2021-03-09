import 'package:flutter/material.dart';
import 'package:mealo/dummy_data.dart';
import 'package:mealo/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static String routeName = '/meal-details';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final meal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == routeArgs['id'];
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
