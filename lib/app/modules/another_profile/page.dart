import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/another_profile/controller.dart';

class AnotherProfilePage extends GetView<AnotherProfileController> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.profile.value == null
                ? ''
                : controller.profile.value!.email,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () {
                        if (controller.profile.value != null) {
                          if (controller.profile.value!.avatar != null) {
                            return CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(imageUrl),
                              backgroundColor: Colors.transparent,
                            );
                          } else {
                            return const Icon(
                              Icons.person,
                              size: 100,
                            );
                          }
                        } else {
                          return Container();
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.profile.value == null
                                ? ''
                                : controller.profile.value!.count.recipesCount
                                    .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        const Text(
                          'Receitas',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.profile.value == null
                                ? ''
                                : controller.profile.value!.count.followerCount
                                    .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        const Text(
                          'Seguidores',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.profile.value == null
                                ? ''
                                : controller.profile.value!.count.followingCount
                                    .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        const Text(
                          'Seguindo',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        // controller.profile.value == null
                        //     ? ''
                        //     : controller.profile.value!.name,
                        'Nome',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Chefe de cozinha profissional',
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 60),
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      controller.followAction();
                    },
                    child: Obx(
                      () => controller.isFollowing.value
                          ? const Text(
                              'Deixar de seguir',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              'Seguir',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.profile.value != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.profile.value!.recipes.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                          ),
                          itemBuilder: (ctx, index) {
                            var recipe =
                                controller.profile.value!.recipes[index];

                            return Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: recipe.avatar == null
                                        ? const Icon(
                                            Icons.receipt,
                                            size: 60,
                                          )
                                        : Image.network(
                                            recipe.avatar!,
                                            fit: BoxFit.cover,
                                            // height: 60,
                                            width: 100,
                                          ),
                                  ),
                                ),
                                Text(
                                  recipe.name,
                                )
                              ],
                            );
                          },
                        ),
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
