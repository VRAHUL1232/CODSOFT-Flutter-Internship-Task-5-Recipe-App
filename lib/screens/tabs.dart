import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favourite_provider.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/provider/meals.provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/screens/search_screen.dart';
import 'package:meals_app/widgets/drawer.dart';

class TabsScreen extends ConsumerStatefulWidget{
const TabsScreen({super.key});

ConsumerState<TabsScreen> createState(){
  return _TabsScreenState();
}

}

const kinitialValues = {
    Filter.gluten : false,
    Filter.snack : false,
    Filter.vegan : false,
    Filter.vegetarian : false
  };

class _TabsScreenState extends ConsumerState<TabsScreen>{

  int _selectedPageIndex = 0;

  Map<Filter, bool> _selectedFilters = kinitialValues;

  List<Meal> _filteredMeals = [];

  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onSelectedScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters")  {
      final result = await Navigator.of(context).push <Map<Filter , bool>> (MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    setState(() {
      _selectedFilters = result ?? kinitialValues;
    });
    }
  }

  @override
  Widget build(BuildContext context){
    final meals = ref.watch(providerMeals);

    _filteredMeals = meals.where((meal){
      if (_selectedFilters[Filter.gluten]! && !meal.isGlutenFree)
        return false;
      if (_selectedFilters[Filter.snack]! && !meal.isSnack)
        return false;
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan)
        return false;
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian)
        return false;
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(availableMeals: _filteredMeals);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      final favouriteMeal = ref.watch(favouriteMealProvider);
      activePage = MealsScreen(meals: favouriteMeal,);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        actions: [
          if (activePageTitle == 'Categories')
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder:(context) => SearchScreen(),)
            );
          }, icon: Icon(Icons.search))
        ],
      ),
      drawer: MainDrawer(onSelectedScreen: onSelectedScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        items:const  [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
        ],
      ),
    );
  }
}
