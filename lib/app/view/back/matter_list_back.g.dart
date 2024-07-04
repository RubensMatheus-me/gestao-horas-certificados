// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matter_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatterListBack on _MatterListBack, Store {
  late final _$listAtom = Atom(name: '_MatterListBack.list', context: context);

  @override
  Future<List<Matter>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Matter>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_MatterListBackActionController =
      ActionController(name: '_MatterListBack', context: context);

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_MatterListBackActionController.startAction(
        name: '_MatterListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_MatterListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
