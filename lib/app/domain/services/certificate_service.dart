import 'package:gestao_horas_certificado/app/domain/entities/certificate.dart';
import 'package:gestao_horas_certificado/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_horas_certificado/app/domain/interface/certificate_dao.dart';
import 'package:get_it/get_it.dart';

class CertificateService {
  final _dao = GetIt.I.get<CertificateDAO>();
  
  save(Certificate certificate) {
    validateCertificateDescription(certificate.description);
    validateCertificateName(certificate.name);
    validateHoursCertificate(certificate.hours?.toString());
    validateTypeCertificate(certificate.type);

    _dao.save(certificate);
  }

  Future<int>getTotalHour(String? type) {
    return _dao.getTotalHours(type!);
  }

  Future<List<int>>getAllHours(){
    return _dao.getAllHours();
    }
  

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Certificate>> find() {
    return _dao.find();
  }

  validateCertificateName(String? name) {
    var min = 4;
    var max = 100;

    if(name == null) {
      throw DomainLayerException('O nome do certificado é obrigatorio.');
    }else if(name.length < min) {
      throw DomainLayerException('O nome do certificado deve possuir pelo menos $min caracteres.');
    }else if(name.length > max) {
      throw DomainLayerException('O nome do certificado deve possuir no maximo $max caracteres.');
    }
  }

  validateCertificateDescription(String? description) {
    var max = 200;

     if(description!.length > max) {
      throw DomainLayerException('A descrição do certificado deve possuir no maximo $max caracteres.');
    }
  }
  
  validateHoursCertificate(String? hours) {

    if(hours == null || hours.isEmpty) {
      throw DomainLayerException('A quantidade de horas é obrigatoria.');
    }
    final int? trueHours = int.tryParse(hours);
    
    if(trueHours! <= 0) {
      throw DomainLayerException('O certificado precisa ter no minimo 1 hora');

    }
  }

  validateTypeCertificate(String? type) {
    if(type == null) {
       throw DomainLayerException('Voce deve escolher o tipo de certificado');
    }
  }
} 