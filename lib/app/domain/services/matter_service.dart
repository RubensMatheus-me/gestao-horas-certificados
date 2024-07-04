import 'package:gestao_horas_certificado/app/domain/entities/matter.dart';
import 'package:gestao_horas_certificado/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_horas_certificado/app/domain/interface/matter_dao.dart';
import 'package:get_it/get_it.dart';

class MatterService {
  final _dao = GetIt.I.get<MatterDAO>();
  
  save(Matter matter) {
    validateMatter(matter.name);
    validateAverage(matter.average);
    _dao.save(matter);
  }

  remove(dynamic id) {
    if(id==null) {
      throw DomainLayerException('ID não pode ser nulo');
    }
    _dao.remove(id);
  }

  Future<List<Matter>> find() {
    return _dao.find();
  }

  validateMatter(String? matter) {
    var min = 4;
    var max = 20;

    if(matter == null) {
      throw DomainLayerException('O nome da matéria é obrigatorio.');
    }else if(matter.length < min) {
      throw DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
    }else if(matter.length > max) {
      throw DomainLayerException('O nome deve possuir no maximo $max caracteres.');
    }

  }
  
  validateAverage(double? average) {
    if(average == null) {
      throw DomainLayerException('É necessário inserir as notas');
    }
  }


}

