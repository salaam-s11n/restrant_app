import 'package:flutter/material.dart';
import 'package:restrant_app/models/meal.dart';
import 'package:restrant_app/screens/caregores_meals_screens.dart';
import 'package:restrant_app/screens/meal_detel_screen.dart';

class Meal_Item extends StatelessWidget {
  final String ImageUrl;
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const Meal_Item({
    @required this.ImageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.id,
  });
  String get complaxityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';

        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';

        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      // if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    var fontFamily = Theme.of(context).textTheme.headline1.fontFamily;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    double radius = 15;
    return Container(
      height: MediaQuery.of(context).size.height * 0.36,
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Expanded>[
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        ImageUrl,
                        // height: isPortrait
                        //     ? MediaQuery.of(context).size.height * 0.25
                        //     : MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                        width: isPortrait
                            ? MediaQuery.of(context).size.width * 0.65
                            : MediaQuery.of(context).size.width * 0.325,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontFamily: fontFamily,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$duration min",
                            style: TextStyle(fontFamily: fontFamily),
                          )
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.menu_book),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$complaxityText",
                            style: TextStyle(fontFamily: fontFamily),
                          )
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.price_check_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$affordabilityText",
                            style: TextStyle(fontFamily: fontFamily),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
