import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/bookmark/controller.dart';
import 'package:larifood_app/app/routes/routes.dart';

class BookmarkPage extends GetView<BookmarkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritas',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.recipes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (ctx, index) {
                var recipe = controller.recipes[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.RECIPE, arguments: [
                          {'id': recipe.id}
                        ]);
                      },
                      child: SizedBox(
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: recipe.avatar == null
                              ? const Icon(
                                  Icons.image_outlined,
                                  size: 60,
                                )
                              : Image.network(
                                  recipe.avatar!,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    // Text(
                    //   recipe.name,
                    // ),
                    Text(
                      recipe.name,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
