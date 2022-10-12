import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/recipe/controller.dart';
import 'package:larifood_app/app/modules/recipe/widgets/ingredient_component.dart';
import 'package:larifood_app/app/modules/recipe/widgets/label.dart';
import 'package:larifood_app/app/modules/recipe/widgets/prepare_mode_component.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/routes/routes.dart';

class RecipePage extends GetView<RecipeController> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.recipe.value == null
                ? ''
                : controller.recipe.value!.name,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => controller.isAuthor.value
                ? PopupMenuButton<String>(
                    onSelected: (val) {
                      if (val == 'Excluir') {
                        controller.deleteRecipe();
                      }

                      if (val == 'Editar') {
                        Get.toNamed(Routes.UPDATE_RECIPE, arguments: [
                          {'id': controller.recipe.value!.id}
                        ]);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Editar', 'Excluir'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  )
                : Container(),
          )
        ],
      ),
      body: Obx(
        () => controller.recipe.value == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // controller.banner == null
                      //     ? Container()
                      //     : Container(
                      //         child: AdWidget(
                      //           ad: controller.banner!,
                      //         ),
                      //       ),
                      controller.recipe.value!.avatar == null
                          ? Icon(
                              Icons.receipt_long_outlined,
                              size: 200,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                controller.recipe.value!.avatar!,
                                fit: BoxFit.cover,
                                height: 250,
                              ),
                            ),
                      Row(
                        children: [
                          Expanded(
                            child: Obx(
                              () => CheckboxListTile(
                                value: controller.recipe.value!.isPrivate == 1
                                    ? true
                                    : false,
                                contentPadding: EdgeInsets.zero,
                                onChanged: (val) {},
                                checkColor: Colors.white,
                                activeColor: Colors.red,
                                title: Text('Privada'),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                children: [
                                  TextSpan(text: 'Publicada por '),
                                  TextSpan(
                                    text:
                                        controller.recipe.value!.user!.username,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Label(label: 'Ingredientes'),
                      ListView.builder(
                        itemCount: controller.recipe.value!.ingredients.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          var ingredient =
                              controller.recipe.value!.ingredients[index];
                          return IngredientComponent(
                            name: ingredient.name,
                            qtd: ingredient.qtd.toString(),
                            qtdUnit: ingredient.qtd_unit,
                          );
                        },
                      ),
                      Label(label: 'Modo de preparo'),
                      ListView.builder(
                        itemCount: controller.recipe.value!.preparemodes.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          controller.recipe.value!.preparemodes
                              .sort((a, b) => a.order.compareTo(b.order));

                          // controller.recipe.value!.preparemodes
                          //     .sort((a, b) => a.order < b.order
                          //         ? 1
                          //         : a.order == b.order
                          //             ? 0
                          //             : -1);
                          var prepareMode =
                              controller.recipe.value!.preparemodes[index];
                          return PrepareModeComponent(
                            index: index + 1,
                            prepareMode: prepareMode.description,
                          );
                        },
                      ),
                      Label(label: 'Receitas semelhantes'),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          itemCount: controller.similarRecipes.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            var recipe = controller.similarRecipes[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.offNamed(Routes.RECIPE,
                                          arguments: [
                                            {'id': recipe.id}
                                          ],
                                          preventDuplicates: false);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        height: 80,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    recipe.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // Label(
                      //   label: 'Gostou da receita?',
                      //   widget: Row(children: [
                      //     Icon(
                      //       Icons.favorite_border_outlined,
                      //       color: Colors.red,
                      //       size: 30,
                      //     ),
                      //     Icon(
                      //       Icons.bookmark_border_outlined,
                      //       color: Colors.red,
                      //       size: 30,
                      //     )
                      //   ]),
                      // ),
                      Label(label: 'Comentários'),
                      InputField(
                        hintText: 'Enviar um comentário',
                        controller: controller.comment.value,
                        icon: GestureDetector(
                          onTap: () {
                            controller.addComment();
                          },
                          child: Icon(
                            Icons.send_sharp,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ListView.builder(
                            itemCount: controller.recipe.value!.comments.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              var comment =
                                  controller.recipe.value!.comments[index];
                              return Row(
                                children: [
                                  comment.user.avatar == null
                                      ? Icon(
                                          Icons.person,
                                          size: 40,
                                        )
                                      : CircleAvatar(
                                          radius: 25,
                                          backgroundImage: NetworkImage(
                                              comment.user.avatar!),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          comment.user.username,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          comment.content,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller.loggedUserUser.id ==
                                          comment.user.id
                                      ? GestureDetector(
                                          onTap: () {
                                            controller.deleteComment(
                                                comment.id.toString());
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      : Container()
                                  // Column(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.favorite_outline,
                                  //       color: Colors.red,
                                  //     ),
                                  //     Text(
                                  //       '4 curtidas',
                                  //       style: TextStyle(color: Colors.red),
                                  //     )
                                  //   ],
                                  // ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 8),
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       minimumSize: Size(0, 60),
                      //       backgroundColor: Colors.red,
                      //     ),
                      //     onPressed: () {},
                      //     child: controller.isLoading.value
                      //         ? SizedBox(
                      //             width: 30,
                      //             height: 30,
                      //             child: CircularProgressIndicator(
                      //               color: Colors.white,
                      //             ),
                      //           )
                      //         : Text(
                      //             'Ver todos os comentários',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
