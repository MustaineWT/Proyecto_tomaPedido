import 'package:salesapp_cas/data/models/ffvv/ffvv.dart';
import 'package:salesapp_cas/data/models/responses/requestToken.dart';

abstract class FfvvRepository {
  Future<RequestToken> registerFfvv(
      token, int companyId, int branchOfficeId, int ffvv, String description);

  Future<List<Ffvv>> getFfvv(token, int companyId, int branchOfficeId);
  Future<RequestToken> deleteFfvv(
      token, int companyId, int branchOfficeId, int ffvv);
}
