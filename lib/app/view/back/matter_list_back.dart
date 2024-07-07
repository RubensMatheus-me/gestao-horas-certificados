import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/app.dart';
import 'package:gestao_horas_certificado/app/domain/entities/matter.dart';
import 'package:gestao_horas_certificado/app/domain/services/matter_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'matter_list_back.g.dart';

class MatterListBack = _MatterListBack with _$MatterListBack;

abstract class _MatterListBack with Store {
  var _service = GetIt.I.get<MatterService>();

  @observable
  Future<List<Matter>> ?list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _MatterListBack() {
    refreshList();
  }

  goToAdd(BuildContext context, [Matter? matter]) {
    Navigator.of(context).pushNamed(MyApp.MATTERS, arguments: matter).then((_) => refreshList());
  }


  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}