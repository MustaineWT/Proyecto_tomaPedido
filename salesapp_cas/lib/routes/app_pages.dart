import 'package:flutter/material.dart';
import 'package:salesapp_cas/presentation/login/login_view.dart';
import 'package:salesapp_cas/presentation/splash/splash_view.dart';
import 'package:salesapp_cas/presentation/useradministrator/homeA/homeAdmin_view.dart';
import 'package:salesapp_cas/presentation/userseller/homeS/homeSeller_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const String INITIAL = AppRoutes.SPLASH;

  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.SPLASH: (_) => SplashView(),
    AppRoutes.HOMESELLER: (_) => HomeSellerView(),
    AppRoutes.HOMEADMIN: (_) => HomeAdminView(),
    AppRoutes.LOGIN: (_) => LoginView(),
  };
}
