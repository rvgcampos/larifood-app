import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:larifood_app/app/modules/home/controller.dart';
import 'package:larifood_app/app/routes/routes.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 100,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                controller.loggedUserUser == null
                    ? Text('')
                    : Text(controller.loggedUserUser.name),
                SizedBox(
                  width: 5,
                ),
                controller.loggedUserUser.avatar == null
                    ? Icon(Icons.person)
                    : CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            NetworkImage(controller.loggedUserUser.avatar!),
                        backgroundColor: Colors.transparent,
                      ),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.recipesList.length,
            itemBuilder: (ctx, index) {
              var recipe = controller.recipesList[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.RECIPE, arguments: [
                    {'id': recipe.value.id}
                  ]);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  recipe.value.user!.avatar == null
                                      ? Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        )
                                      : CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                              recipe.value.user!.avatar!),
                                          backgroundColor: Colors.transparent,
                                        ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    recipe.value.user!.username,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                Jiffy(DateTime.parse(recipe.value.createdAt))
                                    .fromNow(),
                                style: TextStyle(
                                    color: Colors.grey[300], fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: recipe.value.avatar == null
                                  ? Icon(
                                      Icons.receipt_outlined,
                                      size: 200,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        recipe.value.avatar!,
                                        height: 250,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    recipe.value.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     controller.favorite(recipe.value.id!);
                                      //   },
                                      //   child: Text('Teste'),
                                      // ),
                                      Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            controller.like(recipe.value.id!);
                                          },
                                          child: Icon(
                                            recipe.value.usersLikes
                                                ? Icons.favorite
                                                : Icons.favorite_border_outlined,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            controller
                                                .favorite(recipe.value.id!);
                                          },
                                          child: Icon(
                                            recipe.value.usersFavorites
                                                ? Icons.bookmark
                                                : Icons
                                                    .bookmark_outline_outlined,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 20),
                            //   child: Text(
                            //     'Nada melhor do que um picadinho de carne num almoço de sabado',
                            //     softWrap: true,
                            //     style: TextStyle(fontSize: 12),
                            //   ),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
