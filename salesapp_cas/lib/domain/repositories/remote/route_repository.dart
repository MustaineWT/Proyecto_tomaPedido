import 'package:salesapp_cas/data/models/responses/requestToken.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';

abstract class RouteRepository {
  Future<RequestToken> registerRoute(
      token,
      int companyId,
      int branchOfficeId,
      String route,
      String description,
      String zone,
      int mo,
      int tu,
      int we,
      int th,
      int fr,
      int sa,
      int su,
      String ffvv);

  Future<List<Routes>> getRoute(token, int companyId, int branchOfficeId);
}
