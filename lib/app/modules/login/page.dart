import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/login/controller.dart';
import 'package:larifood_app/app/widgets/action_button.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/routes/routes.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              child: Image.asset('assets/images/logo.png'),
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black87,
              ),
            ),
            const Text(
              'Por favor, informe os detalhes abaixo',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
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
                        controller: controller.email.value,
                        hintText: 'Informe o e-mail',
                        validationBuilder:
                            ValidationBuilder().email().maxLength(50),
                        autofocus: true,
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
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.FORGOT_PASSWORD);
                        },
                        child: const Text(
                          'Esqueceu a senha? Clique aqui',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isLoading.value
                            ? ActionButton(
                                isFilled: controller.isFilled.value,
                                onPressed: controller.login,
                                formKey: _formKey,
                                label: 'Logar',
                                isLoading: true,
                              )
                            : ActionButton(
                                isFilled: controller.isFilled.value,
                                onPressed: controller.login,
                                formKey: _formKey,
                                label: 'Logar',
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Não tem conta? ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            child: const Text(
                              'Cadastre-se',
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
          ],
        ),
      ),
    );
  }
}
