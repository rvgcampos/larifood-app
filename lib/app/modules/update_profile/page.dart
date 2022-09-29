import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/update_profile/controller.dart';
import 'package:larifood_app/app/modules/update_profile/widgets/LabelUpdateProfile.dart';
import 'package:larifood_app/app/widgets/action_button.dart';
import 'package:larifood_app/app/widgets/input_field.dart';

class UpdateProfilePage extends GetView<UpdateProfileController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Atualizar perfil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          onChanged: () {
            controller.formIsFilled();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Obx(
                      () => controller.avatar.value != ''
                          ? controller.image.value.path == ''
                              ? Image.network(
                                  controller.avatar.value,
                                  height: 100,
                                )
                              : Image.file(
                                  controller.image.value,
                                  height: 100,
                                )
                          : const Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.red,
                                size: 100,
                              ),
                            ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Renato Vinicius',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        GestureDetector(
                          onTap: controller.pickImage,
                          child: Text(
                            'Alterar foto de perfil',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const LabelUpdateProfile(
                  name: 'Nome',
                ),
                InputField(
                  hintText: 'Nome',
                  controller: controller.name.value,
                ),
                const LabelUpdateProfile(
                  name: 'Nome de usuário',
                ),
                InputField(
                    hintText: 'Nome de usuário',
                    controller: controller.username.value),
                const LabelUpdateProfile(
                  name: 'E-mail',
                ),
                InputField(
                  hintText: 'E-mail',
                  controller: controller.email.value,
                ),
                const LabelUpdateProfile(
                  name: 'Descrição',
                ),
                InputField(
                    hintText: 'Descrição',
                    controller: controller.description.value),
                Obx(
                  () => controller.isLoading.value
                      ? ActionButton(
                          isFilled: controller.isFilled.value,
                          onPressed: controller.updateUser,
                          formKey: _formKey,
                          label: 'Atualizar',
                          isLoading: true,
                        )
                      : ActionButton(
                          isFilled: controller.isFilled.value,
                          onPressed: controller.updateUser,
                          formKey: _formKey,
                          label: 'Atualizar',
                        ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
