import 'package:flutter/material.dart';
import 'package:restrant_app/screens/caregores_meals_screens.dart';

class CatergoresItem extends StatelessWidget {
  const CatergoresItem({
    @required this.id,
    @required this.title,
    @required this.image,
    this.color,
  });
  final String id;
  final String title;
  final Color color;
  final String image;

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
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(radius)),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        '$image',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Icon(
                      Icons.touch_app_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () => selectGategory(context),
      splashColor: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
