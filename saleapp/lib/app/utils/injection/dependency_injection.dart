import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:saleapp/app/data/providers/local/local_auth.dart';
import 'package:saleapp/app/data/providers/remote/authentication_api.dart';
import 'package:saleapp/app/data/providers/remote/userAdmin_api.dart';
import 'package:saleapp/app/data/providers/remote/client_api.dart';
import 'package:saleapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:saleapp/app/data/repositories/remote/authentication_repository.dart';
import 'package:saleapp/app/data/repositories/remote/userAdmin_repository.dart';
import 'package:saleapp/app/data/repositories/remote/client_repository.dart';

class DependencyInjection {
  static void init() {
    Get.put<Dio>(Dio(BaseOptions(baseUrl: 'http://192.168.13.2:3000/Api/v1')));

    // providers
    Get.put<AuthenticationAPI>(AuthenticationAPI());
    Get.put<LocalAuth>(LocalAuth());
    Get.put<UserAdminAPI>(UserAdminAPI());
    Get.put<ClientAPI>(ClientAPI());

    /// repositories
    Get.put<AuthenticationRepository>(AuthenticationRepository());
    Get.put<LocalAuthRepository>(LocalAuthRepository());
    Get.put<UserAdminRepository>(UserAdminRepository());
    Get.put<ClientRepository>(ClientRepository());
  }
}
