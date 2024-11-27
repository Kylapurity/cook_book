import 'package:cookbook/providers/favourites_provider.dart';
import 'package:cookbook/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavouritesProvider(),
      child: const CookbookApp(),
    ),
  );
}

class CookbookApp extends StatelessWidget {
  const CookbookApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cookbook',
      initialRoute: 'navigator',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
