import 'package:hive/hive.dart';

part 'currency_model.g.dart';

@HiveType(typeId: 0)
class CurrencyModel {
  CurrencyModel({
    this.title,
    this.code,
    this.cbPrice,
    this.nbuBuyPrice,
    this.nbuCellPrice,
    this.date,
  });

  @HiveField(0)
  String? title;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? cbPrice;
  @HiveField(3)
  String? nbuBuyPrice;
  @HiveField(4)
  String? nbuCellPrice;
  @HiveField(5)
  Date? date;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        title: json["title"],
        code: json["code"],
        cbPrice: json["cb_price"],
        nbuBuyPrice: json["nbu_buy_price"],
        nbuCellPrice: json["nbu_cell_price"],
        date: dateValues.map[json["date"]],
      );
}

enum Date { THE_16072022 }

final dateValues = EnumValues({"16.07.2022": Date.THE_16072022});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
