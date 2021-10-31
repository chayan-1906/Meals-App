import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavouriteScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Center(
          child: Text(
            'You have no favourites yet - start adding some!',
            style: GoogleFonts.getFont(
              'Roboto Slab',
              fontStyle: FontStyle.italic,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return Container(
      child: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      ),
    );
  }
}
