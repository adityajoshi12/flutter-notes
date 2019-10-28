import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
      tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: Icons.shopping_cart, title: "Basket")
      ],
      activeIconColor: Colors.white,
      circleColor: Colors.amber,
      textColor: Colors.amber,
      inactiveIconColor: Colors.amber,
      onTabChangedListener: (position) {
        setState(() {
          currentPage = position;
          print(currentPage+1);
        });
      },
    );
  }
}
