import 'package:flutter/material.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:cookbook/components/search/search_recipe_card.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({
    super.key,
    required this.recipes,
  });

  final List<Recipe> recipes;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          if (widget.recipes.isNotEmpty)
            Text(
              'Search Results',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: widget.recipes.length,
            itemBuilder: (context, index) {
              return SearchRecipeCard(recipe: widget.recipes[index]);
            },
          ),
        ],
      ),
    );
  }
}
