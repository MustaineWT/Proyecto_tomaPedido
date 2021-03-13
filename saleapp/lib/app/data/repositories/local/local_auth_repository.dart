import 'package:get/get.dart';
import 'package:saleapp/app/data/models/responses/requestToken.dart';
import 'package:saleapp/app/data/providers/local/local_auth.dart';

class LocalAuthRepository {
  final LocalAuth? _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(RequestTokenModel requestToken) =>
      _localAuth!.setSession(requestToken);

  Future<void> clearSession() => _localAuth!.clearSession();

  Future<RequestTokenModel?> get session => _localAuth!.getSession();
}
