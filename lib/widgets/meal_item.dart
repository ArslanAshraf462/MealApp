import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeItem;
  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
   // required this.removeItem,
  });

  String get complexityText {
    switch(complexity) {
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
      return 'unknown';
    }
  }

  String get affordabilityText {
    switch(affordability) {
      case Affordability.Affordable:
      return 'Affordable';
      break;
      case Affordability.Pricey:
      return 'Pricey';
      break;
      case Affordability.Luxurious:
      return 'Expensive';
      break;
      default:
      return 'unknown';
    }
  }

  void selectmMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    ).then((result) {
      if(result!=null){
      //removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectmMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4.0,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250.0,
                      width: double.infinity,
                      fit: BoxFit.cover,),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 10.0,
                    child: Container(
                      width: 280.0,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 20.0),
                      child: Text(
                        title,
                      style: const TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(complexityText),
                      ],
                    ),
                     Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}