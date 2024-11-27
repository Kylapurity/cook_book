import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:cookbook/screens/home_view.dart';
import 'package:cookbook/screens/navigator.dart';
import 'package:cookbook/screens/recipe_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case 'navigator':
        return MaterialPageRoute(builder: (_) => const NavigatorScreen());
      case 'home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case 'recipe-details':
        if (args is Recipe) {
          return MaterialPageRoute(
            builder: (_) => RecipeDetailsScreen(
              recipe: args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPallete.darkOrange,
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
