import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/models/zone/zone.dart';

const String ZONE = 'zoneBox';

class ZoneDB {
  openBoxZoneDB() async {
    await Hive.openBox<Zone>(ZONE,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 1;
    });
  }

  static Box<Zone> getOpenZoneBox() => Hive.box<Zone>(ZONE);

  addZone(Zone zone) {
    final zoneBox = ZoneDB.getOpenZoneBox();
    zoneBox.add(zone);
  }

  updateZone(int index, Zone zone) {
    final zoneBox = ZoneDB.getOpenZoneBox();
    zoneBox.putAt(index, zone);
  }

  deleteAllZone() {
    final zoneBox = ZoneDB.getOpenZoneBox();
    zoneBox.clear();
  }

  getZone(int index) {
    final zoneBox = ZoneDB.getOpenZoneBox();
    final zone = zoneBox.getAt(index);
    return zone;
  }

  deleteZone(int index) {
    final zoneBox = ZoneDB.getOpenZoneBox();
    zoneBox.deleteAt(index);
  }

  disposeZone() {
    final zoneBox = ZoneDB.getOpenZoneBox();
    zoneBox.close();
  }
}
