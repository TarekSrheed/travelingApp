import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import '../screens/categories_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({Key? key}) : super(key: key);
  final List<Trip> favoritesTrips;

  TabsScreen(this.favoritesTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;
  @override
  void initState() {
    _screens = [
      {
        'screen': CategoriesScreen(),
        'title': " تصنيفات الرحلات",
      },
      {
        'screen': FaveritesScreen(widget.favoritesTrips),
        'title': "الرحلات المفضلة",
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
