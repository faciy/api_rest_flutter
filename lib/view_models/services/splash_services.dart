import 'dart:async';
import 'package:apirest/res/routes/routes_name.dart';
import 'package:apirest/view_models/controller/user_peferences/user_preferences_view_modal.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    UserPreferencesViewModal userPreferences = UserPreferencesViewModal();

    userPreferences.getUser().then(
      (value) {
        print('token ${value.token}: ${value.token}');
        print('isLogin ${value.isLogin}');
        if (value.token == null) {
          Timer(const Duration(seconds: 3), () {
            Get.toNamed(RouteName.Login);
          });
        } else {
          Timer(const Duration(seconds: 3), () {
            Get.toNamed(RouteName.Home);
          });
        }
      },
    );
  }
}
