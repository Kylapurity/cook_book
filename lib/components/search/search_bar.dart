import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cookbook/helpers/debouncer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({
    super.key,
    required this.getRecipes,
  });

  final Function getRecipes;

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (string) {
        _debouncer.run(() {
          if (string.isEmpty) {
            widget.getRecipes('empty');
          } else {
            widget.getRecipes(string);
          }
        });
      },
      cursorColor: ColorPallete.darkOrange,
      style: GoogleFonts.montserrat(),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintText: 'Something delicious',
        hintStyle: GoogleFonts.montserrat(
          color: ColorPallete.darkGrey,
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorPallete.lightGrey,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            color: ColorPallete.darkGrey,
          ),
        ),
        filled: true,
        fillColor: ColorPallete.defaultGrey,
      ),
      autofocus: true,
    );
  }
}
