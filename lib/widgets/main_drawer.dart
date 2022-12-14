import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler){
    return  ListTile(
          leading: Icon(
            icon,
          ),
          title: Text(title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),),
          onTap: tapHandler,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
              color: Theme.of(context).primaryColor,
            ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          buildListTile(
            'Meals', 
            Icons.restaurant,
            () {
             Navigator.of(context).pushReplacementNamed('/'); 
            },),
          buildListTile(
            'Filters', 
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },),
        ],
      ),
    );
  }
}