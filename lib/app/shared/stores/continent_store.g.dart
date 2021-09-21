// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continent_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContinentStore on _ContinentStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_ContinentStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
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
  void changeState(bool isLoading) {
    final _$actionInfo = _$_ContinentStoreBaseActionController.startAction(
        name: '_ContinentStoreBase.changeState');
    try {
      return super.changeState(isLoading);
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
isLoading: ${isLoading},
continents: ${continents}
    ''';
  }
}
