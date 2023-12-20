import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.selectedMeal,
  });
  final Meal meal;
  final void Function(BuildContext context, Meal meal) selectedMeal;

  String get affordability {
    return meal.speciality.name[0].toUpperCase() +
        meal.speciality.name.substring(1);
  }

  String get complexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  @override
  Widget build(context) {
    return Card(
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          selectedMeal(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(meal.imageUrl),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 35),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.name,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min',
                          ),
                          const SizedBox(width: 15),
                          MealItemTrait(
                            icon: Icons.work,
                            label: complexity,
                          ),
                          const SizedBox(width: 12),
                          MealItemTrait(
                            icon: Icons.fastfood_outlined,
                            label: affordability,
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
