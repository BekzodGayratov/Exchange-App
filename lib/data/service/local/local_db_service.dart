import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:music/data/model/currency_model.dart';
import 'package:path_provider/path_provider.dart';

// LOCALDB SERVICE AROUND THE PROJECT

class LocalDBServce {
  // ALL BOX WILL BE OPENED HERE

  static late Box<CurrencyModel> currencyBox;
  static openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    currencyBox = await Hive.openBox<CurrencyModel>("currencyBox");
  }

  // ALL ADAPTERS WILL BE REGISTERED HERE
  static registerAdapters() {
    Hive.registerAdapter(CurrencyModelAdapter());
  }

  // ALL BOX WILL BE FILLED UP HERE

  // Put currency data to currencyBox
  static putCurrencyToBox({required List<CurrencyModel> data}) async {
    // Call clear box function to clear before add new data to box
    await clearBox();
    for (CurrencyModel element in data) {
      await currencyBox.add(element);
    }
  }

  // SPECIFIC BOX WILL BE CLEARED ACCORDING WITH boxName
  static clearBox() async {
    await currencyBox.clear();
    return;
  }

  // SPECIFIC BOX WILL BE DELETED ACCORDING WITH boxName
  static deleteBox() {}
}
