import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/profile/controller.dart';
import 'package:larifood_app/app/routes/routes.dart';
import 'package:larifood_app/app/widgets/input_field.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                color: Colors.red,
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
                color: Colors.red,
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
                color: Colors.red,
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
                            controller.ownProfile.value == null
                                ? ''
                                : controller
                                    .ownProfile.value!.count.recipesCount
                                    .toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                            controller.ownProfile.value == null
                                ? ''
                                : controller
                                    .ownProfile.value!.count.followerCount
                                    .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
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
                            controller.ownProfile.value == null
                                ? ''
                                : controller
                                    .ownProfile.value!.count.followingCount
                                    .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
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
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                controller.ownProfile.value == null
                                    ? ''
                                    : controller.ownProfile.value!.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.ownProfile.value == null
                                    ? ''
                                    : controller.ownProfile.value!.description,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Obx(
                          () => CheckboxListTile(
                            value: controller.isPrivate.value,
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text(
                              'Privadas',
                              style: TextStyle(color: Colors.black),
                            ),
                            onChanged: (val) {
                              controller.onlyPrivate();
                            },
                            activeColor: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                child: InputField(
                  hintText: 'Pesquisar',
                  padding: 0,
                  icon: GestureDetector(
                    onTap: () {
                      controller.search();
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  controller: controller.searchString.value,
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
                                  mainAxisExtent: 120),
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
