import 'package:flutter/material.dart';
import 'package:restrant_app/screens/caregores_meals_screens.dart';

class CatergoresItem extends StatelessWidget {
  const CatergoresItem({
    @required this.id,
    @required this.title,
    this.color,
  });
  final String id;
  final String title;
  final Color color;

  void selectGategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoresMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    double radius = 15;
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline1.fontSize,
            fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.6),
                  color.withOpacity(1),
                ])),
      ),
      onTap: () => selectGategory(context),
      splashColor: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
