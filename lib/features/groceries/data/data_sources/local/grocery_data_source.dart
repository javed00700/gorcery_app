import 'package:gorcery_app/features/groceries/data/models/grocery.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroceryDataSource {
  static const String grocery_Box = "grocery";
  static late final Box<Grocery> groceryBox;

  static Future<void> initializeDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GroceryAdapter());
    groceryBox = await Hive.openBox<Grocery>(grocery_Box);
    await groceryBox.clear();
    addPrifixItem();
  }

  List<Grocery> getAllGroceries() {
    return groceryBox.values.toList();
  }

  Future<List<Grocery>> addGrocery(Grocery grocery) async {
    await groceryBox.put(grocery.itemCode, grocery);
    return groceryBox.values.toList();
  }

  Future<List<Grocery>> setBoughtGrocery(Grocery grocery) async {
    await groceryBox.put(grocery.itemCode, grocery);
    return groceryBox.values.toList();
  }

  Future<List<Grocery>> clearBoughtGrocery() async {
    for (var e in groceryBox.values.toList()) {
      await groceryBox.put(e.itemCode, e.copyWith(hasBought: false));
    }
    return groceryBox.values.toList();
  }

  static void addPrifixItem() {
    if (groceryBox.values.isEmpty) {
      groceryBox.put(
          '1',
          Grocery(
              itemCode: "1",
              itemName: "Milk",
              itemDescription: "Milk",
              hasBought: false));

      groceryBox.put(
          '2',
          Grocery(
              itemCode: "2",
              itemName: "Bread",
              itemDescription: "Bread",
              hasBought: false));
      groceryBox.put(
          '3',
          Grocery(
              itemCode: "3",
              itemName: "Toast",
              itemDescription: "Bread",
              hasBought: false));
    }
  }
}
