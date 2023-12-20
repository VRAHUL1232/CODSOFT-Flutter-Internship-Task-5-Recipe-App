import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal.details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  List<Meal> _displayItems = List.from(dummyMeals);

  void updateList(String value) {
    setState(() {
      _displayItems = dummyMeals
          .where(
              (meal) => meal.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget emptyPage = Container(
      margin: EdgeInsets.only(top: 40),
      child: Text("No result found...",style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onBackground)),
    );

    Widget _categoryName(int index){
      final categoryId = _displayItems[index].categories;
      String categoryName = "";
      for (final category in availableCategory){
        if (category.id == categoryId){
          categoryName = category.name;
        }
      }
      return Text(categoryName);
    }

    void _onPressedMeal(int index){
      Future.delayed(const Duration(milliseconds: 200),(){
        Navigator.of(context).push(
          MaterialPageRoute(builder:(context) => MealDetails(meal: _displayItems[index]),)
      );
      },);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: TextField(
                onChanged: (value) {
                  updateList(value);
                },
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 23),
                    hintText: "Search...",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
            _displayItems.isEmpty
                ? emptyPage
                : Expanded(
                    child: ListView.builder(
                      itemCount: _displayItems.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: ListTile(
                          onTap: (){
                            _onPressedMeal(index);
                          },
                          title: Text(_displayItems[index].name),
                          subtitle: _categoryName(index),
                          leading: Image.asset(_displayItems[index].imageUrl,width: 50,height: 50,fit: BoxFit.cover,),
                          trailing: Text(_displayItems[index].speciality.name),
                        ),
                      )
                    ),
                  )
          ],
        ));
  }
}
