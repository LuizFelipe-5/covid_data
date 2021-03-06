// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountryStore on _CountryStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_CountryStoreBase.isLoading');

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

  final _$countriesAtom = Atom(name: '_CountryStoreBase.countries');

  @override
  ObservableList<String> get countries {
    _$countriesAtom.reportRead();
    return super.countries;
  }

  @override
  set countries(ObservableList<String> value) {
    _$countriesAtom.reportWrite(value, super.countries, () {
      super.countries = value;
    });
  }

  final _$countriesFilteredAtom =
      Atom(name: '_CountryStoreBase.countriesFiltered');

  @override
  ObservableList<String> get countriesFiltered {
    _$countriesFilteredAtom.reportRead();
    return super.countriesFiltered;
  }

  @override
  set countriesFiltered(ObservableList<String> value) {
    _$countriesFilteredAtom.reportWrite(value, super.countriesFiltered, () {
      super.countriesFiltered = value;
    });
  }

  final _$_CountryStoreBaseActionController =
      ActionController(name: '_CountryStoreBase');

  @override
  void changeState(bool isLoading) {
    final _$actionInfo = _$_CountryStoreBaseActionController.startAction(
        name: '_CountryStoreBase.changeState');
    try {
      return super.changeState(isLoading);
    } finally {
      _$_CountryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListCountry(List<String> value) {
    final _$actionInfo = _$_CountryStoreBaseActionController.startAction(
        name: '_CountryStoreBase.setListCountry');
    try {
      return super.setListCountry(value);
    } finally {
      _$_CountryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListCountryFiltered(List<String> value) {
    final _$actionInfo = _$_CountryStoreBaseActionController.startAction(
        name: '_CountryStoreBase.setListCountryFiltered');
    try {
      return super.setListCountryFiltered(value);
    } finally {
      _$_CountryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
countries: ${countries},
countriesFiltered: ${countriesFiltered}
    ''';
  }
}
