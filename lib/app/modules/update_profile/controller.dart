import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:larifood_app/app/data/models/own_profile.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UpdateProfileController extends GetxController {
  @override
  void onInit() {
    OwnProfile ownProfile = Get.arguments[0]['user'];
    name.value.text = ownProfile.name;
    username.value.text = ownProfile.username;
    email.value.text = ownProfile.email;
    description.value.text = ownProfile.description;

    avatar.value = ownProfile.avatar ?? '';
    id.value = ownProfile.id.toString();

    formIsFilled();
    super.onInit();
  }

  var avatar = ''.obs;
  var id = ''.obs;
  var name = TextEditingController().obs;
  var username = TextEditingController().obs;
  var email = TextEditingController().obs;
  var description = TextEditingController().obs;

  var image = File('').obs;

  var isFilled = RxBool(false);
  var isLoading = RxBool(false);

  final UserApi userApi;
  UpdateProfileController(this.userApi);

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  formIsFilled() {
    isFilled.value = email.value.text.isNotEmpty &&
        username.value.text.isNotEmpty &&
        name.value.text.isNotEmpty &&
        description.value.text.isNotEmpty;
  }

  deleteAvatar() async {
    await userApi.deleteAvatar();
    avatar.value = '';
    image.value = File('');
  }

  updateUser() async {
    isLoading.value = true;
    await userApi.updateUser(id.value, {
      "name": name.value.text,
      "username": username.value.text,
      "email": email.value.text,
      // "password": password.value.text,
      "description": description.value.text,
    });

    if (image.value.path != '') {
      var request = http.MultipartRequest(
          'PUT', Uri.parse('http://192.168.1.106:3333/avatar/users'));
      request.files
          .add(await http.MultipartFile.fromPath('file', image.value.path));
      final box = GetStorage();

      request.headers['Authorization'] =
          'Bearer ${(box.read('token')).toString()}';

      await request.send();
    }

    isLoading.value = false;

    Get.back();
  }
}
