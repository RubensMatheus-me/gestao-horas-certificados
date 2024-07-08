import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/domain/entities/certificate.dart';
import 'package:gestao_horas_certificado/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_horas_certificado/app/domain/services/certificate_service.dart';
import 'package:get_it/get_it.dart';


class CertificateAddBack {
  Certificate certificate = Certificate();
  var _service = GetIt.I.get<CertificateService>();

  bool certificateNameIsValid = false;
  bool certificateDescriptionIsValid = false;
  bool certificateHoursIsValid = false;
  bool certificateTypeIsValid = false;

  bool get isValid => certificateNameIsValid && certificateDescriptionIsValid && certificateHoursIsValid && certificateTypeIsValid;
  

  CertificateAddBack(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;
    
    if(parameter == null) {
      certificate = Certificate();
    }else if(parameter is Certificate) {
      certificate = parameter;
    }else {
      throw DomainLayerException('certificate_add_back error');
    }
  }
  
  save() async {
    await _service.save(certificate);
  }
  
  String? validateCertificateName(String? name) {
    try {
      _service.validateCertificateName(name);
      certificateNameIsValid = true;
      return null;
    }catch(e) {
      certificateNameIsValid = false;
      return e.toString();
    }
  }

  String? validateCertificateDescription(String? description) {
    try {
      _service.validateCertificateDescription(description);
      certificateDescriptionIsValid = true;
      return null;
    }catch(e) {
      certificateDescriptionIsValid = false;
      return e.toString();
    }
  }
  
  String? validateCertificateHours(String? hour) {
    int? hours = int.tryParse(hour ?? '');

    try {
      _service.validateHoursCertificate(hours.toString());
      certificateHoursIsValid = true;
      return null;
    }catch(e) {
      certificateHoursIsValid = false;
      return e.toString();
    }
  }

  String? validateCertificateType(String? type) {
    try {
      _service.validateTypeCertificate(type);
      certificateTypeIsValid = true;
      return null;
    }catch(e) {
      certificateTypeIsValid = false;
      return e.toString();
    }
  }
  
}