import 'package:flutter/material.dart';
import 'package:restrant_app/screens/fillters_screen.dart';
import 'package:restrant_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigator(
      String route,
    ) {
      Navigator.of(context).pushReplacementNamed("$route");
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: MediaQuery.of(context).size.height * 0.05),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal.withOpacity(0.4)),
            alignment: Alignment.center,
            child: Text(
              "Cooking Up !",
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
                fontSize: 30,
              ),
            ),
          ),
          ListTileGenrateor(
              context,
              "Meals",
              Icon(
                Icons.restaurant_rounded,
                color: Colors.black,
                size: 23,
              ), () {
            navigator(TabsScreen.routName);
          }),
          ListTileGenrateor(
              context,
              "Fillters",
              Icon(
                Icons.filter_list_rounded,
                color: Colors.black,
                size: 23,
              ), () {
            navigator(FilltersScreen.routeName);
          }),
        ],
      ),
    );
  }

  ListTile ListTileGenrateor(
      BuildContext context, String title, Icon icon, Function function) {
    return ListTile(
      leading: icon,
      title: Text(
        "$title",
        style: Theme.of(context).textTheme.headline1,
      ),
      onTap: function,
    );
  }
}
