import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal_model.dart';
import 'meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final MealModel meal;
  final void Function(BuildContext context, MealModel meal) onSelectMeal;

  String textTransform(String name) {
    return name[0].toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        onTap: () => onSelectMeal(context, meal),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: meal.imageUrl,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.work,
                          label: textTransform(meal.complexity.name),
                        ),
                        const SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: textTransform(meal.affordability.name),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
