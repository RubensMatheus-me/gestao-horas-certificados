import 'package:gestao_horas_certificado/app/database/sqflite/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if(_db == null) {
      var path = join(await getDatabasesPath(), 'banco');
      deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (_db, version) async {
          await _db.execute(create_table_materias);
          await _db.execute(create_table_certificados);
          //await _db.execute(insert_certificado);
          //await _db.execute(insert1);
          //await _db.execute(insert2);
          //await _db.execute(insert3);
          
        }
      );
    }
    return _db;
  }
}