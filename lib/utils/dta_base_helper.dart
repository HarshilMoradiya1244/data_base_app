import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:data_base/model/incomeExpense_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' ;
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? dataBase;
  final String DB_NAME = "data.db";

  Future<Database> checkDb() async {
    if (dataBase != null) {
      return dataBase!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DB_NAME);

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String incomeTable =
          "CREATE TABLE incomeExpense(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT, amount TEXT, category TEXT,notes TEXT,time TEXT ,date TEXT,status INTEGER)";
      String categoryTable =
          "CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)";
      db.execute(incomeTable);
      db.execute(categoryTable);
    });
  }

  Future<void> insertData(DBModel dbModel) async {
    dataBase = await checkDb();
    dataBase!.insert("incomeExpense", {
      "title": dbModel.title,
      "amount": dbModel.amount,
      "category": dbModel.category,
      "notes": dbModel.notes,
      "time": dbModel.time,
      "date": dbModel.date,
      "status": dbModel.status,
    });
  }

  void insertCategory({required String name})async{
    dataBase = await checkDb();
    dataBase!.insert("category", {"name":name});
  }

  Future<List<Map>> readCategory() async {
    dataBase = await checkDb();
    String query = "SELECT * FROM category";
    List<Map> data = await dataBase!.rawQuery(query,null);
    return data;
  }

  Future<List<DBModel>>  readIncomeExpense() async {
    dataBase = await checkDb();
    String query = "SELECT * FROM incomeExpense";
    List<Map> data = await dataBase!.rawQuery(query,null);
    List<DBModel> modelList = data.map((e) => DBModel.mapToModel(e)).toList();
    return modelList;
  }

  Future<void> categoryDelete({required String id}) async {
    dataBase = await checkDb();
    dataBase!.delete("category",where: "id=?",whereArgs: [id]);
  }

  void updateData() {}

}
