import 'package:gestao_horas_certificado/app/domain/entities/certificate.dart';

abstract class CertificateDAO {
  save(Certificate certificate);

  Future<List<Certificate>> find();

  Future<List<int>> getAllHours();

  remove(dynamic id);

  Future<int>getTotalHours(String type);
  
}