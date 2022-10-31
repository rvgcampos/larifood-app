import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/recipe.dart';
import 'package:larifood_app/app/routes/routes.dart';

class RecipeComponent extends StatelessWidget {
  final Recipe recipe;
  const RecipeComponent({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.RECIPE, arguments: [
          {'id': recipe.id}
        ]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: recipe.avatar == null
                      ? const Icon(
                          Icons.abc,
                          size: 100,
                        )
                      : Image.network(
                          recipe.avatar!,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      // Text(
                      //   'Nada melhor do que um picadinho de carne num almoço de sábado',
                      //   softWrap: true,
                      //   style: TextStyle(fontSize: 12),
                      // ),
                      Row(
                        children: const [
                          // CircleAvatar(
                          //   radius: 10,
                          //   backgroundImage: NetworkImage(imageUrl),
                          //   backgroundColor: Colors.transparent,
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // Text(
                          //   recipe.user!.username,
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
