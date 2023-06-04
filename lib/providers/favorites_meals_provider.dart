import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal_model.dart';

final favoritesMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<MealModel>>(
  (ref) => FavoritesMealsNotifier(),
);

class FavoritesMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(MealModel meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state
          .where(
            (element) => element.id != meal.id,
          )
          .toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}
