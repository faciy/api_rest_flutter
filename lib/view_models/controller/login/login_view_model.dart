import 'package:apirest/data/models/login/user_model.dart';
import 'package:apirest/data/repository/login_repository/login_repository.dart';
import 'package:apirest/res/routes/routes.dart';
import 'package:apirest/res/routes/routes_name.dart';
import 'package:apirest/utils/utils.dart';
import 'package:apirest/view_models/controller/user_peferences/user_preferences_view_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewModal extends GetxController {
  final _api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  UserPreferencesViewModal userPreferences = UserPreferencesViewModal();

  RxBool loading = false.obs;

  void login() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };

    _api.loginApi(data).then((value) {
      UserModel userModel = UserModel(token: value['token'], isLogin: true);

      userPreferences.saveUser(userModel).then((value) {
        Get.toNamed(RouteName.Home);
      }).onError((error, stackTrace) {});
      Utils.snakBar('Login', 'Successfuly');
      loading.value = false;
    }).onError((error, stackTrace) {
      print(error.toString());
      Utils.snakBar('Error', error.toString());
      loading.value = false;
    });
  }
}
