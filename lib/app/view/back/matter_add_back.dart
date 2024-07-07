import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/domain/entities/matter.dart';
import 'package:gestao_horas_certificado/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_horas_certificado/app/domain/services/matter_service.dart';
import 'package:get_it/get_it.dart';

class MatterAddBack {
  Matter matter = Matter();
  var _service = GetIt.I.get<MatterService>();

  bool _matterIsValid = false;
  //bool _averageIsValid = false;
  bool _teacherIsValid = false;
  bool _valuesIsValid = false;

  String? _firstValue;
  String? _secondValue;
  String? _thirdValue;

  bool get isValid => _matterIsValid && _teacherIsValid && _valuesIsValid;

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
  /*
  String? validateAverage(String? average) {
    try{
      double? avg = double.tryParse(average ?? '');
      _service.validateAverage(avg);
      _averageIsValid = true;
      return null;
    }catch(e) {
      _averageIsValid = false;
      return e.toString();
    }
  }
  */
  String? validateTeacher(String? teacher) {
    try {
      _service.validateTeacher(teacher);
      _teacherIsValid = true;
      return null;
    }catch(e) {
      _teacherIsValid = false;
      return e.toString();
    }
  }

  String? validateFirstValue(String? value) {
    _firstValue = value;
    return validateAllValues();
  }

  String? validateSecondValue(String? value) {
    _secondValue = value;
    return validateAllValues();
  }

  String? validateThirdValue(String? value) {
    _thirdValue = value;
    return validateAllValues();

  }

  String? validateAllValues() {
    double? first = double.tryParse(_firstValue ?? ''); 
    double? second = double.tryParse(_secondValue ?? '');
    double? third = double.tryParse(_thirdValue ?? '');

    try {
      _service.validateValues(first, second, third);
      _valuesIsValid = true;
      return null;
    }catch(e) {
      _valuesIsValid = false;
      return e.toString();
    }
  }

}