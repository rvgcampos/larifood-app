import 'package:get/get.dart';
import 'package:larifood_app/app/modules/dashboard/binding.dart';
import 'package:larifood_app/app/modules/dashboard/page.dart';
import 'package:larifood_app/app/modules/forgot_password/binding.dart';
import 'package:larifood_app/app/modules/forgot_password/page.dart';
import 'package:larifood_app/app/modules/home/binding.dart';
import 'package:larifood_app/app/modules/home/page.dart';
import 'package:larifood_app/app/modules/login/binding.dart';
import 'package:larifood_app/app/modules/login/page.dart';
import 'package:larifood_app/app/modules/register/binding.dart';
import 'package:larifood_app/app/modules/register/page.dart';
import 'package:larifood_app/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
