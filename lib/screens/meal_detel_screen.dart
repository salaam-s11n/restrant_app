// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:restrant_app/dummy_data.dart';
import 'package:restrant_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function addToFaivoretes;
  final Function isMealFavoretes;
  const MealDetailScreen(this.addToFaivoretes, this.isMealFavoretes);
  static const routeName = "mealDetel";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    var fontFamily = Theme.of(context).textTheme.headline1.fontFamily;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMeal.title,
            style: Theme.of(context).textTheme.headline1,
          ),
          leading: BackButton(
            color: Colors.black,
          ),
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addToFaivoretes(mealId),
          child: isMealFavoretes(mealId)
              ? Icon(
                  Icons.favorite_rounded,
                  color: Colors.teal,
                )
              : Icon(Icons.favorite_outline_rounded),
          backgroundColor: Colors.white,
        ),
        body: isPortrait
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    MealImage(
                      context,
                      selectedMeal,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                    BuildTitleWidget(context, 'Ingradients'),
                    BuildContenerForList(
                      context,
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: selectedMeal.ingredients.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            color:
                                Theme.of(context).accentColor.withOpacity(0.5),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Text(
                                selectedMeal.ingredients[index],
                                style: TextStyle(
                                    fontFamily: fontFamily, fontSize: 18),
                              ),
                            ),
                          );
                        },
                      ),
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                    BuildTitleWidget(context, 'Steps'),
                    BuildContenerForList(
                      context,
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: selectedMeal.steps.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal.withOpacity(0.2),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: CircleAvatar(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      fontFamily: fontFamily,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                                backgroundColor: Colors.teal,
                              ),
                              title: Text(
                                "${selectedMeal.steps[index]}",
                                style: TextStyle(
                                    fontFamily: fontFamily, fontSize: 18),
                              ),
                            ),
                          );
                        },
                      ),
                      MediaQuery.of(context).size.height * 0.25,
                    )
                  ],
                ))
            : Container(
                // color: Colors.red,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: MealImage(
                            context,
                            selectedMeal,
                            MediaQuery.of(context).size.height,
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    // height:
                                    //     MediaQuery.of(context).size.height * 0.34,
                                    // width: MediaQuery.of(context).size.width * 0.2,
                                    alignment: Alignment.center,
                                    child: BuildTitleWidget(
                                        context, 'Ingradients')),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    // height:
                                    //     MediaQuery.of(context).size.height * 0.34,
                                    // width: MediaQuery.of(context).size.width * 0.2,
                                    alignment: Alignment.center,
                                    child: BuildTitleWidget(context, 'Steps')),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: BuildContenerForList(
                                context,
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: selectedMeal.ingredients.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Text(
                                          selectedMeal.ingredients[index],
                                          style: TextStyle(
                                              fontFamily: fontFamily,
                                              fontSize: 18),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                MediaQuery.of(context).size.height,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: BuildContenerForList(
                                context,
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: selectedMeal.steps.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.teal.withOpacity(0.2),
                                      ),
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        leading: CircleAvatar(
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                                fontFamily: fontFamily,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          backgroundColor: Colors.teal,
                                        ),
                                        title: Text(
                                          "${selectedMeal.steps[index]}",
                                          style: TextStyle(
                                              fontFamily: fontFamily,
                                              fontSize: 18),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                MediaQuery.of(context).size.height,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }

  Container MealImage(BuildContext context, Meal selectedMeal, double size) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      width: double.infinity,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          selectedMeal.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container BuildContenerForList(
      BuildContext context, Widget child, double size) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.teal.withOpacity(0.5),
            width: 0.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 0.2,
              offset: Offset(0, 1.5), // changes position of shadow
            ),
          ]),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      height: size,
      width: double.infinity,
      child: child,
    );
  }

  Container BuildTitleWidget(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "$text",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
