import '../../../data/models/responses/requestToken.dart';

abstract class UserAdminRepository {
  Future<RequestToken> registerUserAdmin(
      String bussinesName,
      String ruc,
      String direction,
      String city,
      String country,
      String phone,
      String emailCompany,
      String name,
      String lastName,
      String dni,
      int typePersonid,
      String emailAdmin,
      String directionAdmin,
      String cityAdmin,
      String countryAdmin,
      String user,
      String password);
}
