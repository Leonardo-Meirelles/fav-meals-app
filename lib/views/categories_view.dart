import 'package:flutter/material.dart';

import '../data/dummy_category.dart';
import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../widgets/category_grid_item.dart';
import 'meals_view.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({
    super.key,
    required this.availableMeals,
  });

  final List<MealModel> availableMeals;

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _selectCategory(BuildContext context, CategoryModel category) {
    final mealsList = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MealsView(
        title: category.title,
        meals: mealsList,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            )
        ],
      ),
      builder: (context, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
