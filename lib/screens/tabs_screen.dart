import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restrant_app/models/meal.dart';
import 'package:restrant_app/screens/caregores_screen.dart';
import 'package:restrant_app/screens/favorites_screen.dart';
import 'package:restrant_app/widget/main_drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorietesMeals;
  const TabsScreen(this.favorietesMeals);
  static const routName = "tabs_mainPage";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

List<Map<String, Object>> _pages;
int selectedPageIndex = 0;
PageController _pageController = PageController();

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
          style: Theme.of(context).textTheme.headline1,
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: SalomonBottomBar(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
          currentIndex: selectedPageIndex,
          onTap: (index) async {
            setState(() {
              selectedPageIndex = index;
            });
            await _pageController.animateToPage(index,
                duration: Duration(seconds: 3), curve: Curves.easeInOutExpo);
          },
          items: [
            /// Categories
            SalomonBottomBarItem(
              icon: Icon(Icons.category_rounded),
              title: Text("Categories"),
              selectedColor: Colors.green,
            ),

            /// Favorites
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_rounded),
              title: Text("Favorites"),
              selectedColor: Colors.teal,
            ),
          ]),
      // BottomNavigationBar(
      //   onTap: _selectPage,
      //   backgroundColor: Colors.white,
      //   currentIndex: selectedPageIndex,
      //   selectedItemColor: Colors.teal,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: false,
      //   elevation: 10,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.category_rounded),
      //       label: "Categories",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_rounded),
      //       label: "Favorites",
      //     ),
      //   ],
      // ),
    );
  }

  void _selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }
}
