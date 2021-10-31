import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.SIMPLE:
        return 'Simple';
      case Complexity.CHALLENGING:
        return 'Challenging';
      case Complexity.HARD:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.AFFORDABLE:
        return 'Affordable';
      case Affordability.PRICEY:
        return 'Pricey';
      case Affordability.LUXURIOUS:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10.0),
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
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    width: 300.0,
                    color: Colors.black38,
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: Text(
                      title,
                      style: GoogleFonts.getFont(
                        'Roboto Slab',
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
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule_rounded),
                      const SizedBox(width: 6.0),
                      Text(
                        '$duration min',
                        style: GoogleFonts.getFont(
                          'Roboto Slab',
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work_rounded),
                      const SizedBox(width: 6.0),
                      Text(
                        complexityText,
                        style: GoogleFonts.getFont(
                          'Roboto Slab',
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money_rounded),
                      const SizedBox(width: 2.0),
                      Text(
                        affordabilityText,
                        style: GoogleFonts.getFont(
                          'Roboto Slab',
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
