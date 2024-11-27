import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchRecipeCardText extends StatelessWidget {
  const SearchRecipeCardText({
    Key? key,
    required this.numInstructions,
    required this.recipeName,
  }) : super(key: key);

  final String recipeName;
  final int numInstructions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              recipeName,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: ColorPallete.plainWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            numInstructions >= 10
                ? numInstructions > 20
                    ? 'Hard'
                    : 'Intermediate'
                : 'Easy',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: ColorPallete.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
