import 'package:salesapp_cas/data/models/responses/requestToken.dart';
import 'package:salesapp_cas/data/models/zone/zone.dart';

abstract class ZoneRepository {
  Future<RequestToken> registerZone(token, int companyId, int branchOfficeId,
      String zone, String description, int ffvv);

  Future<List<Zone>> getZone(token, int companyId, int branchOfficeId);
  Future<RequestToken> deleteZone(
      token, int companyId, int branchOfficeId, String zone);
}
