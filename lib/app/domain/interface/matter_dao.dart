import 'package:gestao_horas_certificado/app/domain/entities/matter.dart';

abstract class MatterDAO {
  save(Matter matter);

  Future<List<Matter>> find();

  remove(dynamic id);
}