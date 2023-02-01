// import 'dart:developer';
// import 'dart:io';
//
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../models/response/rp_temp_model.dart';
// import '../services/api/app_config.dart';
//
// class DatabaseHelper {
//   static const _dbName = '$appName.db';
//   static const _suggestionTable = 'suggestion';
//   static const _favoriteTable = 'favorite';
//   // static const _recentTable = 'recent';
//   // static const _tableCartName = 'cart';
//   // static const _addressTable = 'address_book';
//   static const _dbVersion = 1;
//
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   static Database? _database;
//
//   Future<Database?> get database async {
//     if (_database != null) {
//       return _database;
//     }
//     _database = await _initiateDatabase();
//     return _database;
//   }
//
//   Future<Database> _initiateDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, _dbName);
//     var database = await openDatabase(path, version: _dbVersion,
//         onCreate: (Database db, int version) async {
//       ///suggestion table
//       await db.execute('''
//             CREATE TABLE $_suggestionTable(
//              ${SuggestionColumn.columnTitle} TEXT
//
//             )
//
//         ''');
//
//       ///favorite table
//       await db.execute('''
//             CREATE TABLE $_favoriteTable(
//              ${FavouriteColumn.columnId} INTEGER,
//              ${FavouriteColumn.columnName} TEXT,
//               ${FavouriteColumn.columnPrice} INTEGER,
//              ${FavouriteColumn.columnImage} TEXT,
//              ${FavouriteColumn.columnStockQty} INTEGER,
//              ${FavouriteColumn.columnQty} INTEGER,
//              ${FavouriteColumn.columnDeal} TEXT
//
//             )
//
//         ''');
//
//       // //Cart table
//       // await db.execute('''
//       //       CREATE TABLE $_tableCartName(
//       //       ${CartColumn.columnId} INTEGER,
//       //       ${CartColumn.columnQty} INTEGER,
//       //       ${CartColumn.price} INTEGER,
//       //       ${CartColumn.columnImage} TEXT,
//       //       ${CartColumn.columnTitle} TEXT,
//       //       ${CartColumn.columnSize} TEXT,
//       //       ${CartColumn.columnColor} TEXT,
//       //       ${CartColumn.product} TEXT
//       //
//       //       )
//       //
//       //   ''');
//
//       // //Address book table
//       // await db.execute('''
//       //       CREATE TABLE $_addressTable(
//       //       ${AddressColumn.columnId} INTEGER PRIMARY KEY,
//       //       ${AddressColumn.columnFirstName} TEXT,
//       //       ${AddressColumn.columnLastName} TEXT,
//       //       ${AddressColumn.columnAddress} TEXT,
//       //       ${AddressColumn.columnCity} TEXT,
//       //       ${AddressColumn.columnState} TEXT,
//       //       ${AddressColumn.columnPostCode} TEXT,
//       //       ${AddressColumn.columnCounty} TEXT,
//       //       ${AddressColumn.columnLabel} TEXT,
//       //       ${AddressColumn.columnIsSelect} INTEGER,
//       //       ${AddressColumn.columnEmail} TEXT,
//       //       ${AddressColumn.columnPhone} TEXT,
//       //       ${AddressColumn.columnCountyCode} TEXT
//       //
//       //       )
//       //
//       //   ''');
//       //
//       // ///favorite table
//       // await db.execute('''
//       //       CREATE TABLE $_recentTable(
//       //        ${RecentColumn.columnId} INTEGER,
//       //        ${RecentColumn.columnProducts} TEXT
//       //
//       //       )
//       //
//       //   ''');
//     });
//     return database;
//   }
//
//   /// Favorite function start here ///
//
//   ///Get All all row
//   Future<List<RpTempModel>> getAllFavorite() async {
//     List<RpTempModel> _products = [];
//     Database? db = await instance.database;
//     var results = await db!.query(_favoriteTable);
//     for (var element in results) {
//       var posts = RpTempModel.fromJson(element);
//       _products.add(posts);
//     }
//     return _products;
//   }
//
//   ///Insert row
//   Future insertFavorite(RpTempModel favoriteModel) async {
//     Database? db = await instance.database;
//     var result = await db!.insert(
//       _favoriteTable,
//       favoriteModel.toJson(),
//     );
//     log('result : $result');
//   }
//
//   ///Delete row
//   Future<int> deleteFavorite(int id) async {
//     Database? db = await instance.database;
//     return await db!.delete(_favoriteTable,
//         where: '${FavouriteColumn.columnId} = ?', whereArgs: [id]);
//   }
//
//   ///remove table
//   Future<void> emptyFavoriteList() async {
//     Database? db = await instance.database;
//     db?.delete(_favoriteTable);
//   }
//
//   /// Favorite function end here ///
//
//   /// Suggestion function start here ///
//
//   ///Get All all row
//   Future<List<SuggestionModel>> getAllSuggestions() async {
//     List<SuggestionModel> _posts = [];
//     Database? db = await instance.database;
//     var results = await db!.query(_suggestionTable);
//     for (var element in results) {
//       var posts = SuggestionModel.fromJson(element);
//       _posts.add(posts);
//     }
//     return _posts;
//   }
//
//   ///Insert row
//   Future insertSuggestion(SuggestionModel suggestionModel) async {
//     Database? db = await instance.database;
//     var result = await db!.insert(
//       _suggestionTable,
//       suggestionModel.toJson(),
//     );
//     log('result : $result');
//   }
//
//   ///Delete row
//   Future<int> deleteSuggestion(String id) async {
//     Database? db = await instance.database;
//     return await db!.delete(_suggestionTable,
//         where: '${SuggestionColumn.columnTitle} = ?', whereArgs: [id]);
//   }
//
//   ///remove table
//   Future<void> emptySuggestionList() async {
//     Database? db = await instance.database;
//     db?.delete(_suggestionTable);
//   }
//
//   /// Suggestion function end here ///
// //   /////////========Recent Functions=========//////////////////
// //   /// Recent function start here ///
// //
// //   ///Get All all row
// //   Future<List<RecentPostModel>> getAllRecent() async {
// //     List<RecentPostModel> _products = [];
// //     Database? db = await instance.database;
// //     var results = await db!.query(_recentTable);
// //     for (var element in results) {
// //       var posts = RecentPostModel.fromJson(element);
// //       _products.add(posts);
// //     }
// //     return _products;
// //   }
// //
// //   ///Insert row
// //   Future insertRecent(RecentPostModel recentModel) async {
// //     Database? db = await instance.database;
// //     var result = await db!.insert(
// //       _recentTable,
// //       recentModel.toJson(),
// //     );
// //     log('result : $result');
// //   }
// //
// //   ///Delete row
// //   Future<int> deleteRecent(int id) async {
// //     Database? db = await instance.database;
// //     return await db!.delete(_recentTable,
// //         where: '${RecentColumn.columnId} = ?', whereArgs: [id]);
// //   }
// //
// //   ///remove table
// //   Future<void> emptyRecentList() async {
// //     Database? db = await instance.database;
// //     db?.delete(_recentTable);
// //   }
// //
// //   /// Favorite function end here ///
// //   //===
// //   //=======
// //   ///=----Start Magazine Cart ----=======////
// //   //Get All all row
// //   Future<List<CartModel>> getAllCartList() async {
// //     List<CartModel> _posts = [];
// //     Database? db = await instance.database;
// //     var results = await db!.query(_tableCartName);
// //     for (var element in results) {
// //       var posts = CartModel.fromJson(element);
// //       _posts.add(posts);
// //     }
// //     return _posts;
// //   }
// //
// //   //Insert row
// //   Future insertCart(CartModel model) async {
// //     Database? db = await instance.database;
// //     var result = await db!.insert(
// //       _tableCartName,
// //       model.toJson(),
// //     );
// //     log('result : $result');
// //   }
// //
// //   //Delete row
// //   Future<int> deleteCart(int id) async {
// //     Database? db = await instance.database;
// //     return await db!.delete(_tableCartName,
// //         where: '${CartColumn.columnId} = ?', whereArgs: [id]);
// //   }
// //
// //   //update row
// //   Future updateCart(int id, int qty) async {
// //     Database? db = await instance.database;
// //     Map<String, dynamic> row = {
// //       CartColumn.columnQty: qty,
// //     };
// //     return await db?.update(_tableCartName, row,
// //         where: '${CartColumn.columnId} = ?', whereArgs: [id]);
// //   }
// //
// //   //remove table
// //   Future<void> emptyShopCart() async {
// //     Database? db = await instance.database;
// //     db?.delete(_tableCartName);
// //   }
// //
// //   ///=----End Magazine Cart ----=======////
// //
// //   /// AddressBook function start here ///
// //
// //   ///Get All all row
// //   Future<List<AddressBook>> getAllAddress() async {
// //     List<AddressBook> _products = [];
// //     Database? db = await instance.database;
// //     var results = await db!.query(_addressTable);
// //     for (var element in results) {
// //       var posts = AddressBook.fromJson(element);
// //       _products.add(posts);
// //     }
// //     return _products;
// //   }
// //
// //   ///Insert row
// //   Future insertAddress(AddressBook model) async {
// //     Database? db = await instance.database;
// //     var result = await db!.insert(
// //       _addressTable,
// //       model.toJson(),
// //     );
// //     log('result : $result');
// //   }
// //
// //   //update row
// //   Future updateAddress(int id, AddressBook model) async {
// //     Database? db = await instance.database;
// //     return await db?.update(_addressTable, model.toMap(),
// //         where: '${AddressColumn.columnId} = ?', whereArgs: [id]);
// //   }
// //   //update row
// //
// //   Future updateIsSelectAddress(int id, int select) async {
// //     Database? db = await instance.database;
// //     Map<String, dynamic> row = {
// //       AddressColumn.columnIsSelect: select,
// //     };
// //     return await db?.update(_addressTable, row,
// //         where: '${AddressColumn.columnId} = ?', whereArgs: [id]);
// //   }
// //
// //   ///Delete row
// //   Future<int> deleteAddress(int id) async {
// //     Database? db = await instance.database;
// //     return await db!.delete(_addressTable,
// //         where: '${AddressColumn.columnId} = ?', whereArgs: [id]);
// //   }
// //
// //   ///remove table
// //   Future<void> emptyAddressList() async {
// //     Database? db = await instance.database;
// //     db?.delete(_addressTable);
// //   }
// //
// //   /// AddressBook function end here ///
// }
//
// //
// class FavouriteColumn {
//   static const columnId = 'id';
//   static const columnName = 'product_name';
//   static const columnPrice = 'price';
//   static const columnImage = 'image';
//   static const columnStockQty = 'stock_qty';
//   static const columnQty = 'qty';
//   static const columnDeal = 'deal';
// }
// //
// // class RecentColumn {
// //   static const columnId = 'id';
// //   static const columnProducts = 'product';
// // }
//
// class SuggestionColumn {
//   static const columnTitle = 'title';
//   static const columnId = 'id';
// }
//
// // class CartColumn {
// //   static const columnId = 'id';
// //   static const price = 'price';
// //   static const columnQty = 'quantity';
// //   static const columnImage = 'image';
// //   static const columnTitle = 'title';
// //   static const columnSize = 'size';
// //   static const columnColor = 'color';
// //   static const product = 'product';
// // }
//
// // class AddressColumn {
// //   static const columnId = 'id';
// //   static const columnFirstName = 'first_name';
// //   static const columnLastName = 'last_name';
// //   static const columnAddress = 'address';
// //   static const columnCity = 'city';
// //   static const columnState = 'state';
// //   static const columnPostCode = 'postcode';
// //   static const columnCounty = 'country';
// //   static const columnLabel = 'label_as';
// //   static const columnIsSelect = 'is_select';
// //   static const columnEmail = 'email';
// //   static const columnPhone = 'phone';
// //   static const columnCountyCode = 'countyCode';
// // }
