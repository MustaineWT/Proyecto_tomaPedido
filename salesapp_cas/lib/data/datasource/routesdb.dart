import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';

const String ROUTE = 'routeBox';

class RoutesDB {
  getOpenRouteBox() async {
    final routeBox = await Hive.openBox<Routes>(ROUTE,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 1;
    });
    return routeBox;
  }

  addRoute(Routes route) async {
    await disposeRoute();
    final routeBox = await getOpenRouteBox();
    //int result = await Hive.box<Routes>(ROUTE).add(route);
    int result = await routeBox.add(route);
    return result;
  }

  getAllRoutes() async {
    await disposeRoute();
    final routeBox = await getOpenRouteBox();
    List<Routes> route = routeBox.values.toList();
    return route;
  }

  updateRouter(int index, Routes route) async {
    await disposeRoute();
    final routeBox = await getOpenRouteBox();

    await routeBox.putAt(index, route);
  }

  deleteRoute() async {
    await disposeRoute();
    final routeBox = await getOpenRouteBox();
    await routeBox.clear();
  }

  disposeRoute() async {
    final routeBox = await getOpenRouteBox();
    await routeBox.compact();
    await routeBox.close();
  }
}
