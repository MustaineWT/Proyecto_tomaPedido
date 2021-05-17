import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';

const String ROUTE = 'routeBox';

class RoutesDB {
  openBoxRoutesDB() async {
    await Hive.openBox<Routes>(ROUTE,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 1;
    });
  }

  static Box<Routes> getOpenRouteBox() => Hive.box<Routes>(ROUTE);

  addRoute(Routes route) {
    final routeBox = RoutesDB.getOpenRouteBox();
    routeBox.add(route);
  }

  updateRouter(int index, Routes route) {
    final routeBox = RoutesDB.getOpenRouteBox();
    routeBox.putAt(index, route);
  }

  deleteAllRoute() {
    final routeBox = RoutesDB.getOpenRouteBox();
    routeBox.clear();
  }

  getRoute(int index) {
    final routeBox = RoutesDB.getOpenRouteBox();
    final route = routeBox.getAt(index);
    return route;
  }

  deleteRoute(int index) {
    final routeBox = RoutesDB.getOpenRouteBox();
    routeBox.deleteAt(index);
  }

  disposeRoute() {
    final routeBox = RoutesDB.getOpenRouteBox();
    routeBox.close();
  }
}
