
import 'package:gestao_horas_certificado/app/database/sqflite/dao/certificate_dao_imp.dart';
import 'package:gestao_horas_certificado/app/database/sqflite/dao/matter_dao_imp.dart';
import 'package:gestao_horas_certificado/app/domain/services/certificate_service.dart';
import 'package:gestao_horas_certificado/app/domain/interface/certificate_dao.dart';
import 'package:gestao_horas_certificado/app/domain/interface/matter_dao.dart';
import 'package:gestao_horas_certificado/app/domain/services/matter_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<MatterDAO>(MatterDAOImp());
  getIt.registerSingleton<MatterService>(MatterService());

  getIt.registerSingleton<CertificateDAO>(CertificateDaoImp());
  getIt.registerSingleton<CertificateService>(CertificateService());
}