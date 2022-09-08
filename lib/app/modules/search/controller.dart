import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var search = TextEditingController().obs;

  var selectedTypeSearch = Rxn<String>();
}
