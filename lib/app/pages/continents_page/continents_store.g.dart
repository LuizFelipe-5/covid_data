// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continents_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContinentStore on _ContinentStoreBase, Store {
  final _$stateAtom = Atom(name: '_ContinentStoreBase.state');

  @override
  AppState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$continentsAtom = Atom(name: '_ContinentStoreBase.continents');

  @override
  ObservableList<Continent> get continents {
    _$continentsAtom.reportRead();
    return super.continents;
  }

  @override
  set continents(ObservableList<Continent> value) {
    _$continentsAtom.reportWrite(value, super.continents, () {
      super.continents = value;
    });
  }

  final _$_ContinentStoreBaseActionController =
      ActionController(name: '_ContinentStoreBase');

  @override
  void changeState(AppState state) {
    final _$actionInfo = _$_ContinentStoreBaseActionController.startAction(
        name: '_ContinentStoreBase.changeState');
    try {
      return super.changeState(state);
    } finally {
      _$_ContinentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListContinent(List<Continent> value) {
    final _$actionInfo = _$_ContinentStoreBaseActionController.startAction(
        name: '_ContinentStoreBase.setListContinent');
    try {
      return super.setListContinent(value);
    } finally {
      _$_ContinentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
continents: ${continents}
    ''';
  }
}
