import 'package:flutter/material.dart';
import 'package:meals_app/screens/Category_meals_screen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            fontSize: 20.0,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          // titleMedium: const TextStyle(
          //   fontSize: 20.0,
          //   fontFamily: 'RobotoCondensed',
          //   fontWeight: FontWeight.bold, 
          // ),
        ),
      ),
     // home: CategoriesScreen(),
     initialRoute: '/',
      routes: {
        '/':(ctx) => TabsScreen(), 
        CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName:(ctx) => MealDetailScreen(),
      },
      // onGenerateRoute: (setting){
      //   print(setting.arguments);
      //   if(setting.name == '/mealdetail'){
      //     return ...;
      //   }
      //   else if(setting.name == '/somethingelse'){
      //     return ...;
      //   }
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}