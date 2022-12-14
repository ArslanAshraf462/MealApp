import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categoerymeals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInItData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_loadedInItData==false){
      final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInItData = true;
    }
     
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id==mealId);
    });
  }
  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body:  Center(
      child: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
          id: displayedMeals![index].id,
          title: displayedMeals![index].title, 
          imageUrl: displayedMeals![index].imageUrl, 
          duration: displayedMeals![index].duration, 
          complexity: displayedMeals![index].complexity, 
          affordability: displayedMeals![index].affordability,
         // removeItem: _removeMeal,
          );
      },
      itemCount: displayedMeals!.length,
      ),
    ),
    );
  }
}