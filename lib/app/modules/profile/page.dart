import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/own_profile.dart';
import 'package:larifood_app/app/modules/profile/controller.dart';
import 'package:larifood_app/app/routes/routes.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.ownProfile.value == null
                ? ''
                : controller.ownProfile.value!.username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black87,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.BOOKMARK);
              },
              child: const Icon(
                Icons.bookmark,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.UPDATE_PROFILE, arguments: [
                  {'user': controller.ownProfile.value}
                ]);
              },
              child: const Icon(
                Icons.settings,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                controller.logout();
              },
              child: const Icon(
                Icons.logout,
              ),
            ),
          ),
        ],
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
                        if (controller.ownProfile.value != null) {
                          if (controller.ownProfile.value!.avatar != null) {
                            return CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  controller.ownProfile.value!.avatar!),
                              backgroundColor: Colors.transparent,
                            );
                          } else {
                            return Icon(
                              Icons.person,
                              size: 100,
                            );
                          }
                        } else {
                          return Container();
                        }
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.ownProfile.value == null
                                ? ''
                                : controller
                                    .ownProfile.value!.count.recipesCount
                                    .toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          'Receitas',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.ownProfile.value == null
                                ? ''
                                : controller
                                    .ownProfile.value!.count.followerCount
                                    .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Text(
                          'Seguidores',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.ownProfile.value == null
                                ? ''
                                : controller
                                    .ownProfile.value!.count.followingCount
                                    .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Text(
                          'Seguindo',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          controller.ownProfile.value == null
                              ? ''
                              : controller.ownProfile.value!.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Obx(
                        () => Text(
                          controller.ownProfile.value == null
                              ? ''
                              : controller.ownProfile.value!.description,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => controller.ownProfile.value != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.ownProfile.value!.recipes.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 120
                          ),
                          itemBuilder: (ctx, index) {
                            var recipe =
                                controller.ownProfile.value!.recipes[index];
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
                                SizedBox(
                                  height: 40,
                                  child: Text(
                                    recipe.name,
                                    // style: TextStyle(fontSize: 10),
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
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
