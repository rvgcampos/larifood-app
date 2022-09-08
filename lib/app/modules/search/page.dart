import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/search/controller.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/widgets/input_field_dropdown.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InputField(
                  hintText: 'Pesquisar',
                  controller: controller.search.value,
                  icon: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                  ),
                ),
                InputFieldDropdown(
                  value: controller.selectedTypeSearch,
                  values: [
                    'Usuários',
                    'Receitas pelo nome',
                    'Receitas por ingredientes'
                  ],
                  hintText: 'Escolha o tipo de pesquisa',
                ),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imageUrl,
                                  width: 100,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Brownie',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Nada melhor do que um picadinho de carne num almoço de sábado',
                                      softWrap: true,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundImage:
                                              NetworkImage(imageUrl),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'max',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
