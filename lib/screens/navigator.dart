import 'package:cookbook/components/custom_navbar_item.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/screens/favourites_view.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/screens/home_view.dart';
import 'package:cookbook/screens/search_view.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavouritesScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int i) {
    _pageController.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      // body: _screens[_selectedIndex],
      body: PageView(
        scrollBehavior: MyCustomScrollBehavior(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CustomNavigationBar(
          isFloating: true,
          elevation: 4,
          iconSize: 30,
          borderRadius: const Radius.circular(20),
          strokeColor: ColorPallete.darkOrange,
          selectedColor: ColorPallete.darkOrange,
          unSelectedColor: ColorPallete.primaryText,
          items: [
            CustomNavbarItem.navbarItem(
              'assets/icons/home.svg',
              0,
              _selectedIndex,
            ),
            CustomNavbarItem.navbarItem(
              'assets/icons/search.svg',
              1,
              _selectedIndex,
            ),
            CustomNavbarItem.navbarItem(
              'assets/icons/favourite.svg',
              2,
              _selectedIndex,
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
