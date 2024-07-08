// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complementary_hours_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComplementaryHoursListBack on _ComplementaryHoursListBack, Store {
  late final _$listAtom =
      Atom(name: '_ComplementaryHoursListBack.list', context: context);

  @override
  Future<List<int>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<int>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_ComplementaryHoursListBackActionController =
      ActionController(name: '_ComplementaryHoursListBack', context: context);

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ComplementaryHoursListBackActionController
        .startAction(name: '_ComplementaryHoursListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ComplementaryHoursListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
