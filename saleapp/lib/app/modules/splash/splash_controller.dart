import 'package:get/get.dart';
import 'package:saleapp/app/data/models/responses/requestToken.dart';
import 'package:saleapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:saleapp/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final LocalAuthRepository? _localAuthRepository =
      Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    _init();
  }

  _init() async {
    try {
      await Future.delayed(Duration(seconds: 4));
      final RequestTokenModel? requestToken =
          await _localAuthRepository!.session;

      Get.offNamed(
        requestToken != null
            ? //AppRoutes.HOJACONSTRUCCION
            AppRoutes.HOME
            : AppRoutes.LOGIN,
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {}
}
