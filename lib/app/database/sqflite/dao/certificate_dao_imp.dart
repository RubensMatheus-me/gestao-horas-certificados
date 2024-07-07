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
  
}