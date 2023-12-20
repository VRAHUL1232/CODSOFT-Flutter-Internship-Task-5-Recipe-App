import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

enum Filter {
  gluten,
  snack,
  vegetarian,
  vegan,
}

  var _glutenfreeFilterSet = false;
  var _snackFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;

class _FilterScreenState extends State<FilterScreen> {
  @override

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluten : _glutenfreeFilterSet,
            Filter.snack : _snackFilterSet,
            Filter.vegan : _veganFilterSet,
            Filter.vegetarian : _vegetarianFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenfreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _glutenfreeFilterSet = isChecked;
                });
              },
              title: Text("Gluten-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              subtitle: Text('Only include gluten-free meals.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
              contentPadding:const EdgeInsets.only(left: 30,right: 20),
            ),
      
            SwitchListTile(
              value: _snackFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _snackFilterSet = isChecked;
                });
              },
              title: Text("Snack",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              subtitle: Text('Only include Snack items.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
              contentPadding:const EdgeInsets.only(left: 30,right: 20),
            ),
      
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text("Vegetarian",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              subtitle: Text('Only include vegetarian meals.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
              contentPadding:const EdgeInsets.only(left: 30,right: 20),
            ),
      
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text("Vegan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              subtitle: Text('Only include vegan meals.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
              contentPadding:const EdgeInsets.only(left: 30,right: 20),
            ),
          ],
        ),
      ),
    );
  }
}
