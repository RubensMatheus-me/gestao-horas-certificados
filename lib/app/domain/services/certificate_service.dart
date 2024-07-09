import 'package:gestao_horas_certificado/app/domain/entities/certificate.dart';
import 'package:gestao_horas_certificado/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_horas_certificado/app/domain/interface/certificate_dao.dart';
import 'package:get_it/get_it.dart';

class CertificateService {
  final _dao = GetIt.I.get<CertificateDAO>();

  static const int maxHoursEnsino = 40;
  static const int maxHoursExtensao = 155;
  static const int maxHoursSocial = 40;
  
  save(Certificate certificate) async {
    validateCertificateDescription(certificate.description);
    validateCertificateName(certificate.name);
    validateHoursCertificate(certificate.hours?.toString());
    validateTypeCertificate(certificate.type);

    await validateMaxHours(certificate);

    await _dao.save(certificate);
  }

  Future<int>getTotalHour(String? type) {
    return _dao.getTotalHours(type!);
  }

  Future<List<int>>getAllHours(){
    return _dao.getAllHours();
    }

  Future<Map<String, int>>getAllHoursByActivityType() {
    return _dao.getAllHoursByActivityType();
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
    if (trueHours == null) {
    throw DomainLayerException('O valor precisa ser um número inteiro.');
  }
    
    if(trueHours <= 0) {
      throw DomainLayerException('O certificado precisa ter no minimo 1 hora');

    }
  }

  validateTypeCertificate(String? type) {
    if(type == null) {
       throw DomainLayerException('Voce deve escolher o tipo de certificado');
    }
  }

   Future<void> validateMaxHours(Certificate certificate) async {
    int currentHours = await getTotalHour(certificate.type!);
    int maxHours;

    switch (certificate.type) {
      case 'Ensino':
        maxHours = maxHoursEnsino;
        break;
      case 'Extensão':
        maxHours = maxHoursExtensao;
        break;
      case 'Social':
        maxHours = maxHoursSocial;
        break;
      default:
        throw DomainLayerException('Tipo de certificado desconhecido.');
    }

    if ((currentHours + (certificate.hours ?? 0)) > maxHours) {
      throw DomainLayerException('Não é possível adicionar mais horas para o tipo ${certificate.type}. Limite máximo de $maxHours horas atingido.');
    }
  }
} 