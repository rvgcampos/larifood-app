import 'package:get/get.dart';
import 'package:larifood_app/app/modules/another_profile/binding.dart';
import 'package:larifood_app/app/modules/another_profile/page.dart';
import 'package:larifood_app/app/modules/bookmark/binding.dart';
import 'package:larifood_app/app/modules/bookmark/page.dart';
import 'package:larifood_app/app/modules/dashboard/binding.dart';
import 'package:larifood_app/app/modules/dashboard/page.dart';
import 'package:larifood_app/app/modules/forgot_password/binding.dart';
import 'package:larifood_app/app/modules/forgot_password/page.dart';
import 'package:larifood_app/app/modules/login/binding.dart';
import 'package:larifood_app/app/modules/login/page.dart';
import 'package:larifood_app/app/modules/recipe/binding.dart';
import 'package:larifood_app/app/modules/recipe/page.dart';
import 'package:larifood_app/app/modules/register/binding.dart';
import 'package:larifood_app/app/modules/register/page.dart';
import 'package:larifood_app/app/modules/splash/binding.dart';
import 'package:larifood_app/app/modules/splash/page.dart';
import 'package:larifood_app/app/modules/update_profile/binding.dart';
import 'package:larifood_app/app/modules/update_profile/page.dart';
import 'package:larifood_app/app/modules/update_recipe/binding.dart';
import 'package:larifood_app/app/modules/update_recipe/page.dart';
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
      page: () => SplashPage(),
      binding: SplashBinding(),
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
    GetPage(
      name: Routes.ANOTHER_PROFILE,
      page: () => AnotherProfilePage(),
      binding: AnotherProfileBinding(),
    ),
    GetPage(
      name: Routes.RECIPE,
      page: () => RecipePage(),
      binding: RecipeBinding(),
    ),
    GetPage(
      name: Routes.UPDATE_PROFILE,
      page: () => UpdateProfilePage(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: Routes.BOOKMARK,
      page: () => BookmarkPage(),
      binding: BookmarkBinding(),
    ),
    GetPage(
      name: Routes.UPDATE_RECIPE,
      page: () => UpdateRecipePage(),
      binding: UpdateRecipeBinding(),
    ),
  ];
}
