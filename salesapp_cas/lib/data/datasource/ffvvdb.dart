import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';

const String FFVV = 'routeBox';

class FfvvDB {
  openBoxRoutesDB() async {
    await Hive.openBox<Ffvv>(FFVV,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 1;
    });
  }

  static Box<Ffvv> getOpenRouteBox() => Hive.box<Ffvv>(FFVV);

  addRoute(Ffvv ffvv) {
    final ffvvBox = FfvvDB.getOpenRouteBox();
    ffvvBox.add(ffvv);
  }

  updateRouter(int index, Ffvv ffvv) {
    final ffvvBox = FfvvDB.getOpenRouteBox();
    ffvvBox.putAt(index, ffvv);
  }

  deleteAllRoute() {
    final routeBox = FfvvDB.getOpenRouteBox();
    routeBox.clear();
  }

  getRoute(int index) {
    final ffvvBox = FfvvDB.getOpenRouteBox();
    final ffvv = ffvvBox.getAt(index);
    return ffvv;
  }

  deleteRoute(int index) {
    final ffvvBox = FfvvDB.getOpenRouteBox();
    ffvvBox.deleteAt(index);
  }

  disposeRoute() {
    final ffvvBox = FfvvDB.getOpenRouteBox();
    ffvvBox.close();
  }
}
