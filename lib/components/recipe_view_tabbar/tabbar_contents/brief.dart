import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:cookbook/components/recipe_details.dart';
import 'package:cookbook/components/recipe_view_tabbar/tabbar_contents/instructions_structure.dart';
import 'package:flutter/material.dart';

class Brief extends StatelessWidget {
  const Brief({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    int greenARGB = 0;

    return Container(
      color: ColorPallete.lightGrey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: RecipeDetails(
              recipeName: recipe.name,
              numIngredients: recipe.ingredientsList.length,
              numInstructions: recipe.instructionsList.length,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const PageScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipe.instructionsList.length,
            itemBuilder: (context, index) {
              greenARGB += 10;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: InstructionsStructure(
                  color: Color.fromARGB(190, 250, greenARGB, 22),
                  instructionIndex: index + 1,
                  instructionText: recipe.instructionsList[index],
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
