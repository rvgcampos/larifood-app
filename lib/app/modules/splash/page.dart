import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/splash/controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SplashPage')),
        body: SafeArea(child: Text('SplashController')));
  }
}