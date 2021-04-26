import 'package:salesapp_cas/data/models/responses/requestToken.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';

abstract class RouteRepository {
  Future<RequestToken> registerRoute(token, int companyId, int branchOfficeId,
      String route, String description, String zone, String ffvv);

  Future<List<Routes>> getRoute(token, int companyId, int branchOfficeId);
}
