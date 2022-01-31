import 'package:flutter/material.dart';
import 'package:restrant_app/dummy_data.dart';
import 'package:restrant_app/widget/catergores_item.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);
  static const routName = "mainPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Meal App",
      //     style: TextStyle(
      //       fontFamily: "RobotoCondensed",
      //       fontSize: 24,
      //       fontStyle: FontStyle.normal,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: GridView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(19),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2.3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((catData) => CatergoresItem(
                  id: catData.id,
                  title: catData.title,
                  color: catData.color,
                ))
            .toList(),
      ),
    );
  }
}
