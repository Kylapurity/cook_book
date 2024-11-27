import 'package:cookbook/helpers/colorpallete.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavbarItem {
  static CustomNavigationBarItem navbarItem(
      assetPath, iconIndex, selectedIndex) {
    return CustomNavigationBarItem(
      icon: SvgPicture.asset(
        assetPath,
        color: selectedIndex == iconIndex
            ? ColorPallete.darkOrange
            : ColorPallete.primaryText,
      ),
    );
  }
}
