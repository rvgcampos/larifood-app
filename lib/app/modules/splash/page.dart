import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/splash/controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
