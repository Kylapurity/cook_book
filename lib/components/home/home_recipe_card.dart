import 'package:cookbook/components/favourite_button.dart';
import 'package:cookbook/components/recipe_details.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF808080).withOpacity(0.3),
              blurRadius: 20,
              // offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              'recipe-details',
              arguments: recipe,
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorPallete.plainWhite,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: SizedBox(
                      height: 345,
                      width: 345,
                      child: Image.network(
                        recipe.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 310, left: 10),
                    child: FavouriteButton(
                      recipe: recipe,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 35),
                child: RecipeDetails(
                  recipeName: recipe.name,
                  numIngredients: recipe.ingredientsList.length,
                  numInstructions: recipe.instructionsList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
