import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/dashboard/controller.dart';
import 'package:larifood_app/app/modules/home/binding.dart';
import 'package:larifood_app/app/modules/home/page.dart';
import 'package:larifood_app/app/modules/profile/binding.dart';
import 'package:larifood_app/app/modules/profile/page.dart';
import 'package:larifood_app/app/modules/publish/binding.dart';
import 'package:larifood_app/app/modules/publish/page.dart';
import 'package:larifood_app/app/modules/reels/binding.dart';
import 'package:larifood_app/app/modules/reels/page.dart';
import 'package:larifood_app/app/modules/search/binding.dart';
import 'package:larifood_app/app/modules/search/page.dart';
import 'package:larifood_app/app/routes/routes.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          onDestinationSelected: controller.changePageIndex,
          selectedIndex: controller.currentPageIndex.value,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: 'Início',
              selectedIcon: Icon(
                Icons.home_filled,
                color: Colors.red,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: 'Pesquisar',
              selectedIcon: Icon(
                Icons.search,
                color: Colors.red,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.add_outlined),
              label: 'Publicar',
              selectedIcon: Icon(
                Icons.add,
                color: Colors.red,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.loop_outlined,
              ),
              label: 'Reels',
              selectedIcon: Icon(
                Icons.loop,
                color: Colors.red,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
              selectedIcon: Icon(
                Icons.person,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/home',
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == '/home') {
            return GetPageRoute(
              routeName: Routes.HOME,
              page: () => HomePage(),
              binding: HomeBinding(),
            );
          } else if (settings.name == '/search') {
            return GetPageRoute(
              routeName: Routes.SEARCH,
              page: () => SearchPage(),
              binding: SearchBinding(),
            );
          } else if (settings.name == '/publish') {
            return GetPageRoute(
              routeName: Routes.PUBLISH,
              page: () => PublishPage(),
              binding: PublishBinding(),
            );
          } else if (settings.name == '/reels') {
            return GetPageRoute(
              routeName: Routes.REELS,
              page: () => ReelsPage(),
              binding: ReelsBinding(),
            );
          } else if (settings.name == '/profile') {
            return GetPageRoute(
              routeName: Routes.PROFILE,
              page: () => ProfilePage(),
              binding: ProfileBinding(),
            );
          }
        },
      ),
    );
  }
}
