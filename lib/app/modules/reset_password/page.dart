import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/reset_password/controller.dart';
import 'package:larifood_app/app/widgets/action_button.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/routes/routes.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  final _formKey = GlobalKey<FormState>();

  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                child: Image.asset('assets/images/logo.png'),
              ),
             const Text(
                'Cadastre sua nova senha',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black87,
                ),
              ),
             const Text(
                'Informe sua nova senha e clique no botão abaixo.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
             const SizedBox(
                height: 22,
              ),
              Form(
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
                        controller: controller.password.value,
                        hintText: 'Informe a nova senha',
                        validationBuilder: ValidationBuilder().minLength(3),
                        autofocus: true,
                      ),
                      Obx(
                        () => controller.formError.value == 'TOKEN_EXPIRED'
                            ? const Text(
                                'Token expirado',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            : Container(),
                      ),
                      Obx(
                        () => controller.isLoading.value
                            ? ActionButton(
                                isFilled: controller.isFilled.value,
                                onPressed: controller.resetPassword,
                                formKey: _formKey,
                                label: 'Logar',
                                isLoading: true,
                              )
                            : ActionButton(
                                isFilled: controller.isFilled.value,
                                onPressed: controller.resetPassword,
                                formKey: _formKey,
                                label: 'Atualizar Senha',
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
