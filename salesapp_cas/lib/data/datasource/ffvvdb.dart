import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/models/ffvv/ffvv.dart';

const String FFVV = 'ffvvBox';

class FfvvDB {
  openBoxFfvvDB() async {
    await Hive.openBox<Ffvv>(FFVV,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 1;
    });
  }

  static Box<Ffvv> getOpenFfvvBox() => Hive.box<Ffvv>(FFVV);

  addFfvv(Ffvv ffvv) {
    final ffvvBox = FfvvDB.getOpenFfvvBox();
    ffvvBox.add(ffvv);
  }

  updateFfvv(int index, Ffvv ffvv) {
    final ffvvBox = FfvvDB.getOpenFfvvBox();
    ffvvBox.putAt(index, ffvv);
  }

  deleteAllFfvv() {
    final ffvvBox = FfvvDB.getOpenFfvvBox();
    ffvvBox.clear();
  }

  getFfvv(int index) {
    final ffvvBox = FfvvDB.getOpenFfvvBox();
    final ffvv = ffvvBox.getAt(index);
    return ffvv;
  }

  deleteFfvv(int index) {
    final ffvvBox = FfvvDB.getOpenFfvvBox();
    ffvvBox.deleteAt(index);
  }

  disposeFfvv() {
    final ffvvBox = FfvvDB.getOpenFfvvBox();
    ffvvBox.close();
  }
}
