import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/components/home/home_recipe_card.dart';

class HomeResults extends StatefulWidget {
  const HomeResults({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  State<HomeResults> createState() => _HomeResultsState();
}

class _HomeResultsState extends State<HomeResults> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        return RecipeCard(
          recipe: widget.recipes[index],
        );
      },
    );
  }
}
