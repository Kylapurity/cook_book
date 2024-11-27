import 'package:cookbook/components/favourite/favourite_card.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    FavouritesProvider fav = Provider.of<FavouritesProvider>(context);

    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Liked Recipes',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: ColorPallete.secondaryText,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: ColorPallete.lightGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0), // Space from the edge
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white, // Background color
              shape: BoxShape.circle, // Make it circular
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black, // Color of the icon
              padding: const EdgeInsets.all(10), // Padding for the button
            ),
          ),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
        shrinkWrap: true,
        itemCount: fav.favorites.length,
        itemBuilder: (context, index) {
          return FavouriteCard(index: index);
        },
      ),
    );
  }
}