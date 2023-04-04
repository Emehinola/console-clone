//
// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
//
// Database? _database;
//
// Future<Database> get database async {
//   if(_database != null){
//     return _database!;
//   }
//
//   _database = await initDb();
//   return _database!;
// }
//
// initDb() async {
//   Directory directory =  await getApplicationDocumentsDirectory();
//   String path = join(directory.path, "console.db");
//
//   return await openDatabase(path, version: 1, onOpen: (db) {
//   }, onCreate: (Database db, int version) async {
//     await db.execute("CREATE TABLE User ("
//         "id INTEGER PRIMARY KEY,"
//         "full_name TEXT,"
//         "biodata TEXT,"
//         "official_details TEXT,"
//         "other_details TEXT"
//         ")");
//   });
// }
//
// String join(dynamic value1, dynamic value2){
//   return "$value1$value2";
// }