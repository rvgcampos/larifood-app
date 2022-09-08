import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:larifood_app/app/core/theme/app_theme.dart';
import 'package:larifood_app/app/data/providers/api.dart';
import 'package:larifood_app/app/routes/pages.dart';
import 'package:larifood_app/app/routes/routes.dart';

void main() async {
  Get.put<Api>(Api());
  await GetStorage.init();
  final box = GetStorage();

  print(box.getValues());

  ValidationBuilder.setLocale('pt-br');
  Intl.defaultLocale = 'pt_BR';

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.LOGIN,
    theme: themeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: const Locale('pt', 'BR'),
    supportedLocales: const [Locale('pt', 'BR')],
  ));
}
