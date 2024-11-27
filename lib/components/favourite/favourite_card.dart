// ignore: unused_import
import 'package:cookbook/components/favourite_button.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cookbook/components/search/search_recipe_card_text.dart';

class FavouriteCard extends StatefulWidget {
  const FavouriteCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    FavouritesProvider fav = Provider.of<FavouritesProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPallete.lightOrange,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                'recipe-details',
                arguments: fav.favorites[widget.index],
              );
            },
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                        fav.favorites[widget.index].image,
                      ),
                    ),
                  ),
                  height: 350.0,
                ),
                Container(
                  height: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black,
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
                SearchRecipeCardText(
                  numInstructions:
                      fav.favorites[widget.index].instructionsList.length,
                  recipeName: fav.favorites[widget.index].name,
                )
              ],
            ),
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         child: ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //             elevation: 0,
    //             backgroundColor: ColorPallete.plainWhite,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
    //           ),
    //           onPressed: () {
    //             Navigator.pushNamed(
    //               context,
    //               'recipe-details',
    //               arguments: fav.favorites[widget.index],
    //             );
    //           },
    //           child: Row(
    //             children: [
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(12),
    //                 child: SizedBox(
    //                   height: 50,
    //                   child: Image.network(
    //                     fav.favorites[widget.index].image,
    //                     fit: BoxFit.fitHeight,
    //                   ),
    //                 ),
    //               ),
    //               Expanded(
    //                 child: Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 6),
    //                   child: Text(
    //                     fav.favorites[widget.index].name,
    //                     style: GoogleFonts.montserrat(
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w600,
    //                       color: ColorPallete.secondaryText,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //             // trailing: FavouriteButton(recipe: fav.favorites[widget.index],),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
