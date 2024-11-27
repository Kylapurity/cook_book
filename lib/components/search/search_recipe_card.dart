import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:cookbook/components/search/search_recipe_card_text.dart';

class SearchRecipeCard extends StatelessWidget {
  const SearchRecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallete.lightOrange,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'recipe-details', arguments: recipe);
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    recipe.image,
                  ),
                ),
              ),
              height: 350.0,
            ),
            Container(
              height: 350.0,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
            SearchRecipeCardText(
              numInstructions: recipe.instructionsList.length,
              recipeName: recipe.name,
            ),
          ],
        ),
      ),
    );
  }
}
