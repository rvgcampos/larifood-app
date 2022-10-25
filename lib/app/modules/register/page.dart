import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/register/controller.dart';
import 'package:larifood_app/app/widgets/action_button.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/routes/routes.dart';

class RegisterPage extends GetView<RegisterController> {
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastre-se',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            controller.formIsFilled();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputField(
                  controller: controller.name.value,
                  hintText: 'Informe o nome',
                  validationBuilder: ValidationBuilder().minLength(3),
                  autofocus: true,
                ),
                InputField(
                  controller: controller.email.value,
                  hintText: 'Informe o e-mail',
                  validationBuilder: ValidationBuilder().email().maxLength(50),
                  autofocus: true,
                ),
                InputField(
                  controller: controller.username.value,
                  hintText: 'Informe o nome do usuário',
                  validationBuilder: ValidationBuilder().minLength(3),
                ),
                Obx(
                  () => InputField(
                    controller: controller.password.value,
                    hintText: 'Informe o senha',
                    validationBuilder: ValidationBuilder().minLength(3),
                    obscureText: controller.isHide.value,
                    icon: GestureDetector(
                      child: controller.isHide.value
                          ? const Icon(Icons.lock_open)
                          : const Icon(Icons.lock_outline),
                      onTap: () {
                        controller.togglePassword();
                      },
                    ),
                  ),
                ),
                Obx(
                  () => CheckboxListTile(
                    title: const Text(
                        "Ao criar uma conta, você concorda com nossos termos de uso e política de privacidade."),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    contentPadding: const EdgeInsets.all(0),
                    value: controller.isChecked.value,
                    onChanged: (newValue) {
                      controller.isChecked.value = newValue!;
                      controller.formIsFilled();
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? ActionButton(
                          isFilled: controller.isFilled.value,
                          onPressed: controller.register,
                          formKey: _formKey,
                          label: 'Registrar',
                          isLoading: true,
                        )
                      : ActionButton(
                          isFilled: controller.isFilled.value,
                          onPressed: controller.register,
                          formKey: _formKey,
                          label: 'Registrar',
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Já tem uma conta? ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: const Text(
                        'Faça login',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
