import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/meal_item.dart';
import 'meal_details_view.dart';

class MealsView extends StatelessWidget {
  const MealsView({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<MealModel> meals;

  void _onSelectMeal(BuildContext context, MealModel meal) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MealDetailsView(
        meal: meal,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nothing here',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 20),
          Text(
            'Select a different category',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      bodyContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index], onSelectMeal: _onSelectMeal);
        },
      );
    }

    if (title == null) {
      return bodyContent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: bodyContent,
    );
  }
}
