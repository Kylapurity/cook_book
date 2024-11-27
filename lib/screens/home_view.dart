import 'package:cookbook/components/home/home_loading.dart';
import 'package:cookbook/components/home/home_result.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:cookbook/services/recipe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  List<Recipe>? _recipes = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeService().getRecipes();
    _recipes!.shuffle();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> refresh() async {
    setState(() {
      _isLoading = true;
    });
    _recipes = await RecipeService().getRecipes();
    _recipes!.shuffle();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      appBar: AppBar(
        title: const Text('Home'), // You can customize the title as needed
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
              },
              color: Colors.black, // Color of the icon
              padding: const EdgeInsets.all(10), // Padding for the icon
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: RefreshIndicator(
          color: ColorPallete.darkOrange,
          onRefresh: refresh,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/cookbook-logo.svg'),
                _isLoading
                    ? const HomeLoading()
                    : HomeResults(recipes: _recipes!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}