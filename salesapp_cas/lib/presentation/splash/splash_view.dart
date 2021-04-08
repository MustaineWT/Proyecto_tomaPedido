import 'package:flutter/material.dart';
import 'package:salesapp_cas/domain/usecase/user_usecase.dart';
import 'package:salesapp_cas/presentation/useradministrator/homeA/homeAdmin_view.dart';
import 'package:salesapp_cas/presentation/userseller/homeS/homeSeller_view.dart';
import '../../helpers/get.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../../presentation/login/login_view.dart';
import '../../utils/colors_constants.dart';
import '../../utils/navigator_utils.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _authUseCase = Get.i.find<AuthUseCase>();
  final _userUseCase = Get.i.find<UserUseCase>();

  Future<void> _init() async {
    final result = await _authUseCase.onInit();
    if (result == 0) {
      popAllAndPush(context, LoginView());
    } else if (result == 1) {
      final typeUser = await _userUseCase.getUser();
      if (typeUser.description == 'Administrador') {
        print('Admin');
        return popAllAndPush(context, HomeAdminView());
      } else {
        return popAllAndPush(context, HomeSellerView());
      }
    } else {
      popAllAndPush(context, LoginView());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _init();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/logoimg/LogoLandPagesalesapp.png",
                width: size.width * 0.7,
                height: size.height * 0.7,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: new AlwaysStoppedAnimation<Color>(gray)),
            Padding(padding: EdgeInsets.only(top: 40.0)),
          ],
        ),
      ),
    );
  }
}
