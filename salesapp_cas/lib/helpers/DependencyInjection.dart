import 'package:dio/dio.dart';
import 'package:salesapp_cas/data/services/local/local_auth_api.dart';
import 'package:salesapp_cas/data/services/remote/authentication_api.dart';
import 'package:salesapp_cas/data/services/remote/user_api.dart';
import 'package:salesapp_cas/domain/usecase/auth_usecase.dart';
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
    final userApi = UserApi(dio);
    final localAuthApi = LocalAuthApi(prefs);
    final preferencesProvider = UserApi(dio);

    final authUseCase = AuthUseCase(authApi, localAuthApi);
    final userUseCase = UserUseCase(userApi, localAuthApi);

    Get.i.put<AuthUseCase>(authUseCase);
    Get.i.put<UserUseCase>(userUseCase);
    Get.i.put<UserApi>(preferencesProvider);
    Get.i.put<LocalAuthApi>(localAuthApi);

    Get.i.put<VoidCallback>(dispose, tag: 'dispose');
  }

  static void dispose() {
    final dispose = Get.i.find<VoidCallback>(tag: 'dispose');
    dispose();
  }
}
