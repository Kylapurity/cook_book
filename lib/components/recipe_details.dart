import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
    required this.recipeName,
    required this.numInstructions,
    required this.numIngredients,
  });

  final String recipeName;
  final int numInstructions;
  final int numIngredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          recipeName.toUpperCase(),
          style: GoogleFonts.montserrat(
            color: ColorPallete.primaryText,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fastfood_outlined,
              color: ColorPallete.lightOrange,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$numIngredients ingredients',
              style: GoogleFonts.montserrat(
                color: ColorPallete.secondaryText,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.list_alt,
              color: ColorPallete.lightOrange,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$numInstructions steps',
              style: GoogleFonts.montserrat(
                color: ColorPallete.secondaryText,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
