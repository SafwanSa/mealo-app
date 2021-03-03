import 'package:flutter/material.dart';
import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
                title: catData.title,
                color: catData.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 200,
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 20,
          mainAxisSpacing: 20),
    );
  }
}
