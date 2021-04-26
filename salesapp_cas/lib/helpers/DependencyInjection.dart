import 'package:dio/dio.dart';
import 'package:salesapp_cas/data/datasource/routesdb.dart';
import 'package:salesapp_cas/data/datasource/sellerdb.dart';
import 'package:salesapp_cas/data/datasource/userdb.dart';
import 'package:salesapp_cas/data/services/local/local_auth_api.dart';
import 'package:salesapp_cas/data/services/remote/authentication_api.dart';
import 'package:salesapp_cas/data/services/remote/routes_api.dart';
import 'package:salesapp_cas/data/services/remote/seller_api.dart';
import 'package:salesapp_cas/data/services/remote/user_api.dart';
import 'package:salesapp_cas/domain/usecase/auth_usecase.dart';
import 'package:salesapp_cas/domain/usecase/routes_usecase.dart';
import 'package:salesapp_cas/domain/usecase/seller_usecase.dart';
import 'package:salesapp_cas/domain/usecase/user_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get.dart';

typedef VoidCallback = void Function();

abstract class DependencyInjection {
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    BaseOptions options = new BaseOptions(
      baseUrl: "http://192.168.13.2:3000/Api/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    Dio dio = new Dio(options);
    final authApi = AuthenticationApi(dio);
    final localAuthApi = LocalAuthApi(prefs);
    final preferencesProvider = UserApi(dio);

    final userApi = UserApi(dio);
    final sellerApi = SellerApi(dio);
    final routesApi = RoutesApi(dio);

    final userDB = UserDB();
    final sellerDB = SellerDB();
    final routesDB = RoutesDB();

    final authUseCase = AuthUseCase(authApi, localAuthApi);
    final userUseCase = UserUseCase(userApi, localAuthApi, userDB);
    final sellerUseCase =
        SellerUseCase(sellerApi, localAuthApi, sellerDB, userDB);
    final routeUseCase =
        RoutesUseCase(routesApi, localAuthApi, routesDB, userDB);

    Get.i.put<AuthUseCase>(authUseCase);
    Get.i.put<LocalAuthApi>(localAuthApi);
    Get.i.put<UserApi>(preferencesProvider);
    Get.i.put<UserUseCase>(userUseCase);
    Get.i.put<UserDB>(userDB);
    Get.i.put<SellerUseCase>(sellerUseCase);
    Get.i.put<RoutesUseCase>(routeUseCase);

    Get.i.put<VoidCallback>(dispose, tag: 'dispose');
  }

  static void dispose() {
    final dispose = Get.i.find<VoidCallback>(tag: 'dispose');
    dispose();
  }
}
