import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientsStructure extends StatelessWidget {
  const IngredientsStructure({
    super.key,
    required this.ingredientName,
    required this.color,
    required this.ingredientMeasure,
  });

  final String ingredientName;
  final String ingredientMeasure;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorPallete.plainWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: color,
              ),
            ),
            Expanded(
              child: Text(
                ingredientName,
                style: GoogleFonts.montserrat(
                  color: ColorPallete.secondaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                ingredientMeasure.toLowerCase(),
                style: GoogleFonts.montserrat(
                  color: ColorPallete.primaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
