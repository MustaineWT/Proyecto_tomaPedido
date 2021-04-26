import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/models/seller/seller.dart';

const String SELLER = 'sellerBox';

class SellerDB {
  getOpenSellerBox() async {
    final sellerBox = await Hive.openBox<Seller>(SELLER,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 1;
    });
    return sellerBox;
  }

  addSeller(Seller seller) async {
    await disposeSeller();
    final sellerBox = await getOpenSellerBox();
    //int result = await Hive.box<Seller>(SELLER).add(seller);
    int result = await sellerBox.add(seller);
    return result;
  }

  getAllSellers() async {
    await disposeSeller();
    final sellerBox = await getOpenSellerBox();
    List<Seller> seller = sellerBox.values.toList();
    return seller;
  }

  updateSeller(int index, Seller seller) async {
    await disposeSeller();
    final sellerBox = await getOpenSellerBox();

    await sellerBox.putAt(index, seller);
  }

  deleteSeller() async {
    await disposeSeller();
    final sellerBox = await getOpenSellerBox();
    await sellerBox.clear();
  }

  disposeSeller() async {
    final sellerBox = await getOpenSellerBox();
    await sellerBox.compact();
    await sellerBox.close();
  }
}
