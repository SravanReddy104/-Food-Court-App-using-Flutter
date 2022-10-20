import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  Function saveFilters;
  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
        actions: [
          IconButton(
              onPressed: () {
                final slectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(slectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'adjust your meal',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                    'GlutenFree', 'only include gluten free meals', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTile(
                    'LactoseFree',
                    'only include lactoefree free meals',
                    _lactosefree, (newValue) {
                  setState(() {
                    _lactosefree = newValue;
                  });
                }),
                _buildSwitchTile(
                    'isvegan', 'only include vegan free meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Vegetarian',
                    'only include vegetarian free meals',
                    _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
