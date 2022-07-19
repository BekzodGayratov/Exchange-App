import 'package:hive_flutter/hive_flutter.dart';

// LOCALDB SERVICE AROUND THE PROJECT

class LocalDBServce {
  // ALL BOX WILL BE OPENED HERE
  static openBox() async {
    await Hive.openBox("currency");
  }

  // ALL BOX WILL BE FILLED UP HERE
  static putToBox({required dynamic data, required String boxName}) {
    clearBox(boxName);
    for (var element in data) {
      print(element);
    }
  }

  // SPECIFIC BOX WILL BE CLEARED ACCORDING WITH boxName
  static clearBox(String boxName) {}

  // SPECIFIC BOX WILL BE DELETED ACCORDING WITH boxName
  static deleteBox() {}
}
