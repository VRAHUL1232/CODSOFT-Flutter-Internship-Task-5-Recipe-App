import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category-item.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
    {
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories == category.id)
        .toList();

    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            meals: filteredMeals,
            title: category.name,
          ),
        ),
      );
    });
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      children: [
        for (final category in availableCategory)
          CategoryGridItem(
            category: category,
            selectedCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
