import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:mojo_live_tv/presentation/screens/category_page/category_page.dart';
import 'package:mojo_live_tv/presentation/screens/country_page/country_page.dart';
import 'package:mojo_live_tv/presentation/screens/home_page/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  final _screenList = [
    const HomePage(),
    const CategoryPage(),
    const CountryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[currentPage],
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.location_on_outlined, title: "Country"),
          TabData(iconData: Icons.bookmark_added, title: "Saved"),
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}
