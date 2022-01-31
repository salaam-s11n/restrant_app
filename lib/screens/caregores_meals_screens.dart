// ignore_for_file: unused_local_variable, missing_return, unused_element

import 'package:flutter/material.dart';
import 'package:restrant_app/dummy_data.dart';
import 'package:restrant_app/models/meal.dart';
import 'package:restrant_app/widget/meal_item.dart';

class CategoresMealsScreen extends StatefulWidget {
  CategoresMealsScreen(this.myAvailableMeal);
  static const routeName = "mealPage";
  final List<Meal> myAvailableMeal;

  @override
  _CategoresMealsScreenState createState() => _CategoresMealsScreenState();
}

class _CategoresMealsScreenState extends State<CategoresMealsScreen> {
  void _removeMeal(String mealId) {
    setState(() {
      categoryMeal.removeWhere((element) => element.id == mealId);
    });
  }

  String categoryTitle;
  String categoryId;
  List<Meal> categoryMeal;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    categoryMeal = widget.myAvailableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$categoryTitle",
          style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: isPortrait
          ? SafeArea(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Meal_Item(
                    ImageUrl: categoryMeal[index].imageUrl,
                    affordability: categoryMeal[index].affordability,
                    complexity: categoryMeal[index].complexity,
                    duration: categoryMeal[index].duration,
                    title: categoryMeal[index].title,
                    id: categoryMeal[index].id,
                  );
                },
                itemCount: categoryMeal.length,
              ),
            )
          : SafeArea(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // maxCrossAxisExtent: 200,
                    crossAxisCount: 2,
                    childAspectRatio: 3.6 / 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Meal_Item(
                    ImageUrl: categoryMeal[index].imageUrl,
                    affordability: categoryMeal[index].affordability,
                    complexity: categoryMeal[index].complexity,
                    duration: categoryMeal[index].duration,
                    title: categoryMeal[index].title,
                    id: categoryMeal[index].id,
                  );
                },
                itemCount: categoryMeal.length,
              ),
            ),
    );
  }
}
