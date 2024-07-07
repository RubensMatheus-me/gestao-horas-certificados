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
        teacher: line['professor'],
        firstValue: line['primeiro_trimestre'],
        secondValue: line['segundo_trimestre'],
        thirdValue: line['terceiro_trimestre'],
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
    double media = (matter.firstValue! + matter.secondValue! + matter.secondValue!) / 3.0;
    matter.average = (media * 10).round() / 10;
    

    if(matter.id == null) {
      sql = 'INSERT INTO matter (nome, professor, primeiro_trimestre, segundo_trimestre, terceiro_trimestre, media) VALUES (?, ?, ?, ?, ?, ?)';
      _db?.rawInsert(sql, [matter.name, matter.teacher ,matter.firstValue, matter.secondValue, matter.thirdValue, matter.average]);
    }else {
      sql = 'UPDATE matter SET nome = ?, professor = ?, primeiro_trimestre = ?, segundo_trimestre = ?, terceiro_trimestre = ?, media = ? WHERE id = ?';
      _db?.rawUpdate(sql, [matter.name, matter.teacher, matter.firstValue, matter.secondValue, matter.thirdValue, matter.average, matter.id]);
    }

  }

  
}