import 'package:flutter/material.dart';
import 'package:restrant_app/widget/main_drawer.dart';

class FilltersScreen extends StatefulWidget {
  static const routeName = "fillters";
  final Function saveFillters;
  final Map<String, bool> fillters;
  const FilltersScreen({this.saveFillters, this.fillters});

  @override
  State<FilltersScreen> createState() => _FilltersScreenState();
}

class _FilltersScreenState extends State<FilltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  @override
  void initState() {
    _isGlutenFree = widget.fillters['gluten'];
    _isVegan = widget.fillters['vegan'];
    _isVegetarian = widget.fillters['vegetarian'];
    _isLactoseFree = widget.fillters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                final selectedFillters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegetarian': _isVegetarian,
                  'vegan': _isVegan,
                };
                widget.saveFillters(selectedFillters);
                // Navigator.of(context).pop();
              },
              icon: Icon(Icons.save_alt_rounded),
            )
          ],
          title: Text(
            "Fillters",
            style: TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 24,
              fontStyle: FontStyle.normal,
            ),
          ),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection !",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                BuildListTile(
                  context,
                  _isGlutenFree,
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  (value) {
                    setState(() {
                      _isGlutenFree = value;
                    });
                  },
                ),
                BuildListTile(
                  context,
                  _isLactoseFree,
                  'Lactose-Free',
                  'Only include Lactose-Free meals.',
                  (value) {
                    setState(() {
                      _isLactoseFree = value;
                    });
                  },
                ),
                BuildListTile(
                  context,
                  _isVegan,
                  'Vegan',
                  'Only include Vegan meals.',
                  (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  },
                ),
                BuildListTile(
                  context,
                  _isVegetarian,
                  'Vegetarian',
                  'Only include Vegetarian meals.',
                  (value) {
                    setState(() {
                      _isVegetarian = value;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }

  SwitchListTile BuildListTile(BuildContext context, bool currentValue,
      String title, String subtitle, Function updateVlaue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateVlaue,
      activeColor: Colors.teal,
      title: Text(
        "$title",
        style: Theme.of(context).textTheme.headline1,
      ),
      subtitle: Text(
        "$subtitle",
        style: TextStyle(
            fontFamily: Theme.of(context).textTheme.headline1.fontFamily),
      ),
    );
  }
}
