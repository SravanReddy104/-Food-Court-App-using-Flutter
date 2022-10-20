import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '/screens/categories_screen.dart';
import '/screens/favouites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TabsScreen(this.favouriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'categories'},
      {'page': FavouritesScreen(widget.favouriteMeal), 'title': 'Favourites'},
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            title: Text('categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('favourites'),
          ),
        ],
      ),
    );
  }
}
