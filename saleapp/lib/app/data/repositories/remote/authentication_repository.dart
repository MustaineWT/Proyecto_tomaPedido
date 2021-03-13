import 'package:get/get.dart';
import 'package:saleapp/app/data/models/responses/requestToken.dart';
import 'package:saleapp/app/data/providers/remote/authentication_api.dart';

class AuthenticationRepository {
  final AuthenticationAPI? _api = Get.find<AuthenticationAPI>();
  Future<RequestTokenModel> authWithLogin(
          {required String username, required String password}) =>
      _api!.validateWithLogin(username: username, password: password);
}
