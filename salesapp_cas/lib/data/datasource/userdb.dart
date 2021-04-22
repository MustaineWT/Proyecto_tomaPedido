import 'package:hive/hive.dart';

import 'package:salesapp_cas/data/models/user/user.dart';

const String USER = 'userBox';

class UserDB {
  getOpenUserBox() async {
    final userBox = await Hive.openBox<User>(USER,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 1;
    });
    return userBox;
  }

  addUser(User user) async {
    final userBox = await getOpenUserBox();
    int result = await userBox.add(user);
    //disposeUser();
    return result;
  }

  getAllUsers() async {
    final userBox = await getOpenUserBox();
    List<User> user = userBox.values.toList();
    //disposeUser();
    return user;
  }

  updateUser(int index, User user) async {
    final userBox = await getOpenUserBox();
    userBox.putAt(index, user);
  }

  deleteUser() async {
    final userBox = await getOpenUserBox();
    await userBox.clear();
  }

  disposeUser() async {
    var userBox = await getOpenUserBox();
    userBox.compact();
    userBox.close();
  }
}
