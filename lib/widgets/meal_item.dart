import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screen/mealsDetails.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get AffordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  // void  onSelectmeal(BuildContext context,Meal meal){
  //   Navigator.of(context).push(MaterialPageRoute(builder:(ctx) =>ItemScreen(mealItem: meal) , ));

  // }
  final void Function(BuildContext context, Meal meal) onSelectMeal;
  //void onSelectmeal(BuildContext context) {
  // Navigator.of(context).push(MaterialPageRoute(
  // builder: (ctx) => MealDetailsScreen(meal: meal),
  // ));
  //}

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
            onTap: () => onSelectMeal(context, meal),
            child: Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 44),
                      child: Column(
                        children: [
                          Text(
                            meal.title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MealItemTrait(
                                  icon: Icons.schedule,
                                  label: '${meal.duration} min'),
                              const SizedBox(
                                width: 6,
                              ),
                              MealItemTrait(
                                  icon: Icons.work, label: complexityText),
                              const SizedBox(
                                width: 6,
                              ),
                              MealItemTrait(
                                  icon: Icons.wallet, label: AffordabilityText)
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}
