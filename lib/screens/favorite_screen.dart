import 'package:flutter/material.dart';
import 'package:mealo/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen({this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("You don't have any favorite meals."),
    );
  }
}
