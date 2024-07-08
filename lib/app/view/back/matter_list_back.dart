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

  goToAddMatter(BuildContext context, [Matter? matter]) {
    Navigator.of(context).pushNamed(MyApp.ADD_MATTERS, arguments: matter).then((_) => refreshList());
  }

  goToCertificate(BuildContext context, [Matter? matter]) {
    Navigator.of(context).pushNamed(MyApp.CERTIFICATES, arguments: matter).then((_) => refreshList());
  }

  goToComplementaryHours(BuildContext context, [Matter? matter]) {
    Navigator.of(context).pushNamed(MyApp.COMPLEMENTARY_HOURS, arguments: matter).then((_) => refreshList());
  }

  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}