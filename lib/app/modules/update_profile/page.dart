import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/update_profile/controller.dart';
import 'package:larifood_app/app/modules/update_profile/widgets/LabelUpdateProfile.dart';
import 'package:larifood_app/app/widgets/action_button.dart';
import 'package:larifood_app/app/widgets/input_field.dart';

class UpdateProfilePage extends GetView<UpdateProfileController> {
  final _formKey = GlobalKey<FormState>();

  UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Column(
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
                              : controller.image.value.path != ''
                                  ? Image.file(
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
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.deleteAvatar();
                          },
                          child: const Icon(
                            Icons.remove_circle_outline_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Renato Vinicius',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        GestureDetector(
                          onTap: controller.pickImage,
                          child: const Text(
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
