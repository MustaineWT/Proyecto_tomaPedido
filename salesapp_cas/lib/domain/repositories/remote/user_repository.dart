import 'package:salesapp_cas/data/models/user.dart';

import '../../../data/models/responses/requestToken.dart';

abstract class UserRepository {
  Future<RequestToken> registerUser(
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

  Future<User> getUser(token, int personid);
}
