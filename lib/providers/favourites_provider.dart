import 'package:flutter/material.dart';
import 'package:cookbook/models/recipe.dart';

class FavouritesProvider extends ChangeNotifier {
  List<Recipe> favorites = [];

  addFavoriteRecipe(Recipe recipe) {
    favorites.add(recipe);
    notifyListeners();
  }

  removeFavoriteRecipe(Recipe recipe) {
    favorites.remove(recipe);
    notifyListeners();
  }
}

