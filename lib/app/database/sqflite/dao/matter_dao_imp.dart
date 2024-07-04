import 'package:gestao_horas_certificado/app/database/sqflite/connection.dart';
import 'package:gestao_horas_certificado/app/domain/entities/matter.dart';
import 'package:gestao_horas_certificado/app/domain/interface/matter_dao.dart';
import 'package:sqflite/sqflite.dart';


class MatterDAOImp implements MatterDAO {
  Database? _db;


  @override
  Future<List<Matter>> find() async {
    _db = await Connection.get();

    List<Map<String,dynamic>> result = await _db!.query('matter');
    List<Matter> list = List.generate(result.length, (i) {
      var line = result[i];
      return Matter(
        id: line['id'],
        name: line['nome'],
        average: line['media'],
      );
    });
    return list;
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM matter WHERE id = ?';
    _db?.rawDelete(sql, [id]);
  }

  @override
  save(Matter matter) async {
    _db = await Connection.get();
    var sql;

    if(matter.id == null) {
      sql = 'INSERT INTO matter (nome, media) VALUES (?, ?)';
      _db?.rawInsert(sql, [matter.name, matter.average]);
    }else {
      sql = 'UPDATE matter SET nome = ?, media = ? WHERE id = ?';
      _db?.rawUpdate(sql, [matter.name, matter.average, matter.id]);
    }


  }

  
}