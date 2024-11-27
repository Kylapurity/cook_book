import 'package:cookbook/helpers/colorpallete.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class InstructionsStructure extends StatelessWidget {
  const InstructionsStructure({
    super.key,
    required this.color,
    required this.instructionIndex,
    required this.instructionText,
  });

  final Color color;
  final int instructionIndex;
  final String instructionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 0,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 10,
            child: Text(
              instructionIndex.toString(),
              style: GoogleFonts.montserrat(
                color: ColorPallete.plainWhite,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            instructionText.trimLeft(),
            style: GoogleFonts.montserrat(
              fontSize: 13,
              color: ColorPallete.primaryText,
            ),
          ),
        ),
      ],
    );
  }
}
