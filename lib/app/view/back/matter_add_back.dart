import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/domain/entities/matter.dart';
import 'package:gestao_horas_certificado/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_horas_certificado/app/domain/services/matter_service.dart';
import 'package:get_it/get_it.dart';

class MatterAddBack {
  Matter matter = Matter();
  var _service = GetIt.I.get<MatterService>();

  bool _matterIsValid = false;
  bool _averageIsValid = false;

  bool get isValid => _matterIsValid && _averageIsValid;


  MatterAddBack(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;


    if(parameter == null) {
      matter = Matter();
    }else if(parameter is Matter) {
      matter = parameter;
    }else {
      throw DomainLayerException('matter_add_back error');
    }
  }

  save() async {
    await _service.save(matter);
  }

  String? validateMatter(String? matter) {
    try {
      _service.validateMatter(matter);
      _matterIsValid = true;
      return null;
    }catch(e) {
      _matterIsValid = false;
      return e.toString();
    }
  }
  String? validateAverage(double? average) {
    try{
      _service.validateAverage(average);
      _averageIsValid = true;
      return null;
    }catch(e) {
      _averageIsValid = false;
      return e.toString();
    }
  }
}