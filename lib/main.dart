// ignore_for_file: deprecated_member_use, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:restrant_app/dummy_data.dart';
import 'package:restrant_app/models/meal.dart';
import 'package:restrant_app/screens/caregores_meals_screens.dart';
import 'package:restrant_app/screens/caregores_screen.dart';
import 'package:restrant_app/screens/fillters_screen.dart';
import 'package:restrant_app/screens/meal_detel_screen.dart';
import 'package:restrant_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _fillters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  _setFillters(Map<String, bool> _filltersData) {
    setState(() {
      _fillters = _filltersData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (_fillters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_fillters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_fillters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_fillters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealID) {
    final existingIndex =
        favorietesMeal.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        favorietesMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favorietesMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool isMealFavoretes(String id) {
    return favorietesMeal.any((meal) => meal.id == id);
  }

  @override
  void initState() {
    super.initState();
  }

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favorietesMeal = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.lightBlueAccent[100],
          canvasColor: Color(0xffffffff),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Colors.white, fontSize: 24),
                bodyText2: TextStyle(color: Colors.black),
                headline1: TextStyle(
                    fontSize: 22,
                    fontFamily: "RobotoCondensed",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                headline2: TextStyle(
                    fontSize: 20,
                    fontFamily: "RobotoCondensed",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
      home: TabsScreen(favorietesMeal),
      routes: {
        "mealPage": (context) => CategoresMealsScreen(
              availableMeal,
            ),
        "mainPage": (context) => Categories(),
        "mealDetel": (context) =>
            MealDetailScreen(_toggleFavorites, isMealFavoretes),
        "tabs_mainPage": (context) => TabsScreen(favorietesMeal),
        "fillters": (context) => FilltersScreen(
              saveFillters: _setFillters,
              fillters: _fillters,
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(Key key) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
    );
  }
}
