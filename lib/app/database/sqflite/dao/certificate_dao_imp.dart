import 'package:gestao_horas_certificado/app/database/sqflite/connection.dart';
import 'package:gestao_horas_certificado/app/domain/entities/certificate.dart';
import 'package:gestao_horas_certificado/app/domain/interface/certificate_dao.dart';
import 'package:sqflite/sqflite.dart';

class CertificateDaoImp implements CertificateDAO {
  Database? _db;

  @override
  Future<List<Certificate>> find() async {
    _db = await Connection.get();

    List<Map<String, dynamic>> result = await _db!.query('certificate');

    List<Certificate> list = List.generate(result.length, (i) {
      var line = result[i];
      return Certificate (
        id: line['id'],
        name: line['nome_certificado'],
        description: line['descricao_certificado'],
        hours: line['horas_certificado'],
        type: line['tipo_certificado'],
      );
    });
    return list;
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM certificate WHERE id = ?';
    _db?.rawDelete(sql, [id]);
  }

  @override
  save(Certificate certificate) async {
    _db = await Connection.get();
    var sql;

    if(certificate.id == null) {
      sql = 'INSERT INTO certificate (nome_certificado, descricao_certificado, horas_certificado, tipo_certificado) VALUES (?, ?, ?, ?)';
      _db?.rawInsert(sql, [certificate.name, certificate.description, certificate.hours, certificate.type]);
    }else {
      sql = 'UPDATE certificate SET nome_certificado = ?, descricao_certificado = ?, horas_certificado = ?, tipo_certificado = ? WHERE id = ?';
      _db?.rawUpdate(sql, [certificate.name, certificate.description, certificate.hours, certificate.type, certificate.id]);
    }
  }
  
  @override
  Future<int>getTotalHours(String type) async {
    _db = await Connection.get();
    var sql = 'SELECT SUM(horas_certificado) AS total FROM certificate WHERE tipo_certificado = ?';
    var result = await _db!.rawQuery(sql, [type]);

  if (result.isNotEmpty) {
    int totalHours = result.first['total'] != null ? result.first['total'] as int : 0;
    return totalHours;
  } else {
    return 0;
  }
  }

    @override
  Future<List<int>>getAllHours() async {
    _db = await Connection.get();
    var sql = 'SELECT SUM(horas_certificado) AS total FROM certificate';
    var result = await _db!.rawQuery(sql);

    if (result.isNotEmpty) {
      List<int> totalHours = result.map((row) {
        int? total = row['total'] as int?;
        return total ?? 0;
      }).toList();
      return totalHours;
    } else {
      return [];
    } 
  }

  @override
Future<Map<String, int>> getAllHoursByActivityType() async {
  _db = await Connection.get();
  var sql = 'SELECT tipo_certificado, SUM(horas_certificado) AS total FROM certificate GROUP BY tipo_certificado';
  var result = await _db!.rawQuery(sql);

  if (result.isNotEmpty) {
    Map<String, int> totalHoursByActivityType = {};
    for (var row in result) {
      String activityType = row['tipo_certificado'] as String;
      int totalHours = row['total'] != null ? row['total'] as int : 0;
      totalHoursByActivityType[activityType] = totalHours;
    }
    return totalHoursByActivityType;
  } else {
    return {};
  }
}
  
}
