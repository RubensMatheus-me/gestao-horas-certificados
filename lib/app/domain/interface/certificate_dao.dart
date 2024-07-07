import 'package:gestao_horas_certificado/app/domain/entities/certificate.dart';

abstract class CertificateDAO {
  save(Certificate certificate);

  Future<List<Certificate>> find();

  remove(dynamic id);
}