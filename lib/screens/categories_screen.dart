import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(26.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        ),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(
          catData.id,
          catData.title, 
          catData.color);
      }).toList(),
      ),);
  }
}