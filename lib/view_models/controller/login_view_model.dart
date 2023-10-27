import 'package:apirest/data/repository/login_repository/login_repository.dart';
import 'package:apirest/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewModal extends GetxController {
  final _api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void login() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };

    _api.loginApi(data).then((value) {
      Utils.snakBar('Login', 'Successfuly');
      loading.value = false;
    }).onError((error, stackTrace) {
      print(error.toString());
      Utils.snakBar('Error', error.toString());
      loading.value = false;
    });
  }
}
