import 'package:flutter/material.dart';
import 'package:mealo/models/meal.dart';
import 'package:mealo/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen({this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Text("You don't have any favorite meals."),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
            ),
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
