enum Complexity {
  simple,
  challenging,
  hard,
}

enum Speciality {
  Veg,
  Vegan,
  GlutenFree,
  NonVeg,
  Spicy,
  Sweet,
  Snacks,
  Salads,
  Soup,
  Dessert
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.speciality,
    required this.isGlutenFree,
    required this.isSnack,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final String categories;
  final String name;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Speciality speciality;
  final bool isGlutenFree;
  final bool isSnack;
  final bool isVegan;
  final bool isVegetarian;
}