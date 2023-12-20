import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{

  FavouriteMealsNotifier() : super([]);

  bool toggleFavouriteMealStatus(Meal meal){
      final mealIsFavourite = state.contains(meal);

      if (mealIsFavourite){
        state = state.where((m) => m.id != meal.id).toList();
        return false;
      } else {
        state = [meal,...state];
        return true;
      }
  }
}

final favouriteMealProvider = StateNotifierProvider<FavouriteMealsNotifier , List<Meal>>((ref) {
  return FavouriteMealsNotifier();
},);