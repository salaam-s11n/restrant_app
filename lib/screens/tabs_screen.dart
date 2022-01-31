import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restrant_app/models/meal.dart';
import 'package:restrant_app/screens/caregores_screen.dart';
import 'package:restrant_app/screens/favorites_screen.dart';
import 'package:restrant_app/widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorietesMeals;
  const TabsScreen(this.favorietesMeals);
  static const routName = "tabs_mainPage";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

List<Map<String, Object>> _pages;
int selectedPageIndex = 0;

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    _pages = [
      {
        'page': Categories(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favorietesMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          "${_pages[selectedPageIndex]['title']}",
          style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        currentIndex: selectedPageIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: "Favorites",
          ),
        ],
      ),
    );
  }

  void _selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }
}
