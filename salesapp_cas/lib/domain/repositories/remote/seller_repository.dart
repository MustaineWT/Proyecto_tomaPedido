import 'package:salesapp_cas/data/models/responses/requestToken.dart';
import 'package:salesapp_cas/data/models/seller/seller.dart';

abstract class SellerRepository {
  Future<RequestToken> registerSeller(
      token,
      int companyId,
      int branchOfficeId,
      String name,
      String lastName,
      String direction,
      String city,
      String country,
      String dni,
      String phone,
      String email,
      int typePersonaid,
      String user,
      String password);

  Future<List<Seller>> getSeller(token, int companyId, int branchOfficeId);
}
