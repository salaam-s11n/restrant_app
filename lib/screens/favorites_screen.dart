import 'package:flutter/material.dart';
import 'package:restrant_app/models/meal.dart';
import 'package:restrant_app/widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorietesMeals;
  const FavoritesScreen(@required this.favorietesMeals);
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    if (favorietesMeals.isEmpty) {
      return Center(
        child: Text(
          "You have no favorites yet, start adding some!",
          style: Theme.of(context).textTheme.headline1,
        ),
      );
    } else {
      return Scaffold(
        body: isPortrait
            ? SafeArea(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Meal_Item(
                      ImageUrl: favorietesMeals[index].imageUrl,
                      affordability: favorietesMeals[index].affordability,
                      complexity: favorietesMeals[index].complexity,
                      duration: favorietesMeals[index].duration,
                      title: favorietesMeals[index].title,
                      id: favorietesMeals[index].id,
                    );
                  },
                  itemCount: favorietesMeals.length,
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
                      ImageUrl: favorietesMeals[index].imageUrl,
                      affordability: favorietesMeals[index].affordability,
                      complexity: favorietesMeals[index].complexity,
                      duration: favorietesMeals[index].duration,
                      title: favorietesMeals[index].title,
                      id: favorietesMeals[index].id,
                    );
                  },
                  itemCount: favorietesMeals.length,
                ),
              ),
      );
    }
  }
}
