import 'package:dio/dio.dart';
import 'package:salesapp_cas/data/datasource/ffvvdb.dart';
import 'package:salesapp_cas/data/datasource/routesdb.dart';
import 'package:salesapp_cas/data/datasource/sellerdb.dart';
import 'package:salesapp_cas/data/datasource/userdb.dart';
import 'package:salesapp_cas/data/datasource/zonedb.dart';
import 'package:salesapp_cas/data/services/local/local_auth_api.dart';
import 'package:salesapp_cas/data/services/remote/authentication_api.dart';
import 'package:salesapp_cas/data/services/remote/ffvv_api.dart';
import 'package:salesapp_cas/data/services/remote/routes_api.dart';
import 'package:salesapp_cas/data/services/remote/seller_api.dart';
import 'package:salesapp_cas/data/services/remote/user_api.dart';
import 'package:salesapp_cas/data/services/remote/zone_api.dart';
import 'package:salesapp_cas/domain/usecase/auth_usecase.dart';
import 'package:salesapp_cas/domain/usecase/ffvv_usecase.dart';
import 'package:salesapp_cas/domain/usecase/routes_usecase.dart';
import 'package:salesapp_cas/domain/usecase/seller_usecase.dart';
import 'package:salesapp_cas/domain/usecase/user_usecase.dart';
import 'package:salesapp_cas/domain/usecase/zone_usecase.dart';
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
    final ffvvApi = FfvvApi(dio);
    final zoneApi = ZoneApi(dio);

    final userDB = UserDB();
    final sellerDB = SellerDB();
    final routesDB = RoutesDB();
    final ffvvDB = FfvvDB();
    final zoneDB = ZoneDB();

    final authUseCase = AuthUseCase(authApi, localAuthApi);
    final userUseCase = UserUseCase(userApi, localAuthApi, userDB, authApi);
    final sellerUseCase =
        SellerUseCase(sellerApi, localAuthApi, sellerDB, userDB, authApi);
    final routeUseCase =
        RoutesUseCase(routesApi, localAuthApi, routesDB, userDB, authApi);
    final ffvvUseCase =
        FfvvUseCase(ffvvApi, localAuthApi, ffvvDB, userDB, authApi);
    final zoneUseCase =
        ZoneUseCase(zoneApi, localAuthApi, zoneDB, userDB, authApi);

    Get.i.put<AuthUseCase>(authUseCase);
    Get.i.put<LocalAuthApi>(localAuthApi);
    Get.i.put<UserApi>(preferencesProvider);
    Get.i.put<UserUseCase>(userUseCase);
    Get.i.put<UserDB>(userDB);
    Get.i.put<SellerDB>(sellerDB);
    Get.i.put<RoutesDB>(routesDB);
    Get.i.put<SellerUseCase>(sellerUseCase);
    Get.i.put<RoutesUseCase>(routeUseCase);
    Get.i.put<FfvvUseCase>(ffvvUseCase);
    Get.i.put<ZoneUseCase>(zoneUseCase);

    Get.i.put<VoidCallback>(dispose, tag: 'dispose');
  }

  static void dispose() {
    final dispose = Get.i.find<VoidCallback>(tag: 'dispose');
    dispose();
  }
}
