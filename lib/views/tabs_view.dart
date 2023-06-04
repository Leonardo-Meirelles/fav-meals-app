import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/favorites_meals_provider.dart';
import '../providers/filters_providers.dart';
import '../widgets/main_drawer.dart';
import 'categories_view.dart';
import 'filters_view.dart';
import 'meals_view.dart';

class TabsView extends ConsumerStatefulWidget {
  const TabsView({super.key});

  @override
  ConsumerState<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends ConsumerState<TabsView> {
  int _selectedViewIndex = 0;

  void _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  void _setView(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersView(),
        ),
      );

      // setState(() {
      //   _selectedFilters = result ?? kInitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);

    Widget activeView = CategoriesView(
      availableMeals: filteredMeals,
    );

    String activeViewTitle = 'Pick your category';

    if (_selectedViewIndex == 1) {
      final favoritesMeals = ref.watch(favoritesMealsProvider);

      activeView = MealsView(
        meals: favoritesMeals,
      );

      activeViewTitle = 'Your Favorites!';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeViewTitle),
      ),
      drawer: MainDrawer(onSelectView: _setView),
      body: activeView,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectView(index),
        currentIndex: _selectedViewIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.set_meal),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
