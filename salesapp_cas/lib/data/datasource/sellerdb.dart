import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/models/seller/seller.dart';

const String SELLER = 'sellerBox';

class SellerDB {
  openBoxSellerDB() async {
    await Hive.openBox<Seller>(SELLER,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 1;
    });
    print('Apertura Box Seller');
    print('===================');
  }

  static Box<Seller> getOpenSellerBox() => Hive.box<Seller>(SELLER);

  addSeller(Seller seller) {
    final sellerBox = SellerDB.getOpenSellerBox();
    sellerBox.add(seller);
  }

  updateSeller(int index, Seller seller) {
    final sellerBox = SellerDB.getOpenSellerBox();
    sellerBox.putAt(index, seller);
  }

  deleteAllSeller() {
    final sellerBox = SellerDB.getOpenSellerBox();
    sellerBox.clear();
  }

  disposeSeller() {
    final sellerBox = SellerDB.getOpenSellerBox();
    sellerBox.close();
    print('Cerrado Box Seller');
    print('===================');
  }
}
