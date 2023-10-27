import 'package:apirest/res/routes/routes_name.dart';
import 'package:apirest/view/home/home_view.dart';
import 'package:apirest/view/login/login_view.dart';
import 'package:apirest/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.SplashScreen,
          page: () => SplashScreen(),
          transitionDuration: Duration(milliseconds: 200),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.Login,
          page: () => const LoginView(),
          transitionDuration: Duration(milliseconds: 200),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.Home,
          page: () => const HomeView(),
          transitionDuration: Duration(milliseconds: 200),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
