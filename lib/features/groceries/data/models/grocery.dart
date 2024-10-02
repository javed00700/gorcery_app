// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'grocery.g.dart';

@HiveType(typeId: 0)
class Grocery {
  @HiveField(0)
  String? itemCode;
  @HiveField(1)
  String? itemName;
  @HiveField(2)
  String? itemDescription;
  @HiveField(3)
  bool? hasBought;
  Grocery({
    this.itemCode,
    this.itemName,
    this.itemDescription,
    this.hasBought,
  });

  Grocery copyWith({
    String? itemCode,
    String? itemName,
    String? itemDescription,
    bool? hasBought,
  }) {
    return Grocery(
      itemCode: itemCode ?? this.itemCode,
      itemName: itemName ?? this.itemName,
      itemDescription: itemDescription ?? this.itemDescription,
      hasBought: hasBought ?? this.hasBought,
    );
  }
}
