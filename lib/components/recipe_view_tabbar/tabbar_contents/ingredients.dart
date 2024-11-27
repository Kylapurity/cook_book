import 'package:cookbook/components/recipe_view_tabbar/tabbar_contents/ingredients_structure.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    int greenARGB = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorPallete.lightGrey,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorPallete.plainWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorPallete.lightOrange,
                      child: SvgPicture.asset(
                        'assets/icons/servings.svg',
                        height: 22,
                        color: ColorPallete.plainWhite,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Servings',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: ColorPallete.secondaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '1',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: ColorPallete.primaryText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: recipe.ingredientsList.length,
                    itemBuilder: (context, index) {
                      greenARGB += 16;
                      return IngredientsStructure(
                        ingredientName: recipe.ingredientsList[index],
                        ingredientMeasure: recipe.ingredientsMeasure[index],
                        color: Color.fromARGB(190, 250, greenARGB, 60),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        decoration: const BoxDecoration(
                          color: ColorPallete.lightGrey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
