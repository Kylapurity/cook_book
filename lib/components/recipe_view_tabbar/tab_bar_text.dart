import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarText extends StatelessWidget {
  const TabBarText({
    super.key,
    required this.tabName,
  });

  final String tabName;

  @override
  Widget build(BuildContext context) {
    return Text(
      tabName.toUpperCase(),
      style: GoogleFonts.montserrat(
        letterSpacing: 1,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
