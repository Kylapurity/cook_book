import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cookbook/providers/favourites_provider.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    FavouritesProvider fav = Provider.of<FavouritesProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: const Color(0xFF808080).withOpacity(0.2),
            spreadRadius: 0,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: ColorPallete.plainWhite,
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            if (widget.recipe.isFavourite) {
              fav.removeFavoriteRecipe(widget.recipe);
              widget.recipe.isFavourite = false;
            } else {
              fav.addFavoriteRecipe(widget.recipe);
              widget.recipe.isFavourite = true;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(widget.recipe.isFavourite),
            );
          },
          icon: Icon(
            widget.recipe.isFavourite ? Icons.favorite : Icons.favorite_border,
            color: ColorPallete.darkOrange,
          ),
        ),
      ),
    );
  }

  showSnackBar(isFavourite) {
    return SnackBar(
      content: isFavourite
          ? Text(
              'Added item to favourites list',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
              ),
            )
          : Text(
              'Removed item from favourites list',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
              ),
            ),
      duration: Duration(milliseconds: 1500),
      backgroundColor: ColorPallete.lightOrange,
      margin: const EdgeInsets.all(10),
      elevation: 2,
      behavior: SnackBarBehavior.floating,
    );
  }
}
