import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static String routeName = '/tabs_screen';

  final List<Meal> favoriteMeal;

  const TabsScreen({Key? key, required this.favoriteMeal}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(favoriteMeals: widget.favoriteMeal),
        'title': 'Favorites'
      },
    ];
    super.initState();
  }

  late int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // DefaultTabController(
        // length: 2,
        // initialIndex: 0,
        // child:
        Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: GoogleFonts.getFont('Roboto Slab'),
        ),
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.category_rounded),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(Icons.favorite_rounded),
        //       text: 'Favourites',
        //     ),
        //   ],
        // ),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).canvasColor,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        elevation: 8.0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).canvasColor,
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).canvasColor,
            icon: Icon(Icons.stars_rounded),
            label: 'Favourites',
          ),
        ],
      ),
      // const TabBarView(
      //   children: [
      //     CategoriesScreen(),
      //     FavouriteScreen(),
      //   ],
      // ),
      // ),
    );
  }
}
