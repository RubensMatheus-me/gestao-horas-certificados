
import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/app.dart';
import 'package:gestao_horas_certificado/app/domain/entities/certificate.dart';
import 'package:gestao_horas_certificado/app/domain/services/certificate_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'complementary_hours_list_back.g.dart';

class ComplementaryHoursListBack = _ComplementaryHoursListBack with _$ComplementaryHoursListBack;

abstract class _ComplementaryHoursListBack with Store {
  var _service = GetIt.I.get<CertificateService>();

  @observable
  Future<List<int>> ?list;

  @action
  refreshList([dynamic value]) {
    list = _service.getAllHours();
  }

  Future<int>getTotalHour(String type) {
    return _service.getTotalHour(type);
  }

  _ComplementaryHoursListBack() {
    refreshList();
  }

  goToAddCertificate(BuildContext context, [Certificate? certificate]) {
    Navigator.of(context).pushNamed(MyApp.ADD_CERTIFICATES, arguments: certificate).then((_) => refreshList());
  }

  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}