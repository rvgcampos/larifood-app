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
import 'package:larifood_app/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String env = 'dev';
  String host = '';
  if (env == 'dev') {
    host = 'http://192.168.1.133:3333';
  } else if (env == 'prod') {
    host = 'https://larifood-api.herokuapp.com';
    // host = 'https://larifood.onrender.com';
  }
  Get.put<Env>(Env(host: host));

  await GetStorage.init();
  Get.put<Api>(Api());

  ValidationBuilder.setLocale('pt-br');
  Intl.defaultLocale = 'pt_BR';

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      theme: themeData,
      title: 'LariFood',
      
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
    ),
  );
}
