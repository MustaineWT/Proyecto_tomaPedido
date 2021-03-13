import 'package:get/get.dart';
import 'package:saleapp/app/modules/client/client_binding.dart';
import 'package:saleapp/app/modules/client/client_view.dart';
import 'package:saleapp/app/modules/home/home_binding.dart';
import 'package:saleapp/app/modules/home/home_view.dart';
import 'package:saleapp/app/modules/login/login_binding.dart';
import 'package:saleapp/app/modules/login/login_view.dart';
import 'package:saleapp/app/modules/signup/signup_binding.dart';
import 'package:saleapp/app/modules/signup/signup_view.dart';
import 'package:saleapp/app/modules/splash/splash_Binfind.dart';
import 'package:saleapp/app/modules/splash/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.CLIENT,
      page: () => ClientView(),
      binding: ClientBinding(),
    ),
  ];
}
