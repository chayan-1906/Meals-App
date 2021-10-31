import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  const FiltersScreen(
      {Key? key, required this.currentFilters, required this.saveFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: GoogleFonts.getFont(
            'Roboto Slab',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final _selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(_selectedFilters);
            },
            icon: Icon(
              Icons.save_rounded,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection',
              style: GoogleFonts.getFont(
                'Roboto Slab',
                fontSize: 19.0,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                  title: Text(
                    'Gluten-free',
                    style: GoogleFonts.getFont(
                      'Roboto Slab',
                    ),
                  ),
                  subtitle: Text(
                    'Only include gluten-free meals',
                    style: GoogleFonts.getFont(
                      'Roboto Slab',
                    ),
                  ),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                  title: Text(
                    'Lactose-free',
                    style: GoogleFonts.getFont(
                      'Roboto Slab',
                    ),
                  ),
                  subtitle: Text(
                    'Only include lactose-free meals',
                    style: GoogleFonts.getFont(
                      'Roboto Slab',
                    ),
                  ),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                  title: Text(
                    'Vegetarian',
                    style: GoogleFonts.getFont(
                      'Roboto Slab',
                    ),
                  ),
                  subtitle: Text(
                    'Only include vegetarian meals',
                    style: GoogleFonts.getFont(
                      'Roboto Slab',
                    ),
                  ),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                  title: Text(
                    'Vegan',
                    style: GoogleFonts.getFont(
                      'Roboto Slab',
                    ),
                  ),
                  subtitle: Text(
                    'Only include vegan meals',
                    style: GoogleFonts.getFont(
                      'Roboto Slab',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
