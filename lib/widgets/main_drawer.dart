import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData iconData, Function tapHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26.0,
      ),
      title: Text(
        title,
        style: GoogleFonts.getFont(
          'Roboto Slab',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler(),
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
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: GoogleFonts.getFont(
                'Roboto Slab',
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                color: Theme.of(context).canvasColor,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ListTile(
            leading: const Icon(
              Icons.restaurant_rounded,
              size: 26.0,
            ),
            title: Text(
              'Meals',
              style: GoogleFonts.getFont(
                'Roboto Slab',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_rounded,
              size: 26.0,
            ),
            title: Text(
              'Filters',
              style: GoogleFonts.getFont(
                'Roboto Slab',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
