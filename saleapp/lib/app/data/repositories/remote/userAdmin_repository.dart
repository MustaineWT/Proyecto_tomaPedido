import 'package:get/get.dart';
import 'package:saleapp/app/data/providers/remote/userAdmin_api.dart';
import 'package:saleapp/app/data/models/responses/responseprocess.dart';

class UserAdminRepository {
  final UserAdminAPI _userAdminAPI = Get.find<UserAdminAPI>();

  Future<ResponseProcess> onRegisterUserAdmin(
          {required String name,
          required String lastname,
          required String bussinesname,
          required String ruc,
          required String direction,
          required String city,
          required String country,
          required String dni,
          required String phone,
          required String emailcompany,
          required int typepersonid,
          required String emailadmin,
          required String directionadmin,
          required String cityadmin,
          required String countryadmin,
          required String user,
          required String password}) =>
      _userAdminAPI.onRegisterUserAdmin(
          name: name,
          lastname: lastname,
          bussinesname: bussinesname,
          ruc: ruc,
          direction: direction,
          city: city,
          country: country,
          dni: dni,
          phone: phone,
          emailcompany: emailcompany,
          typepersonid: typepersonid,
          emailadmin: emailadmin,
          directionadmin: directionadmin,
          cityadmin: cityadmin,
          countryadmin: countryadmin,
          user: user,
          password: password);
}
