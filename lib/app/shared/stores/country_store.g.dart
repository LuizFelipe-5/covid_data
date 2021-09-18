// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountryStore on _CountryStoreBase, Store {
  final _$countriesAtom = Atom(name: '_CountryStoreBase.countries');

  @override
  ObservableList<Country> get countries {
    _$countriesAtom.reportRead();
    return super.countries;
  }

  @override
  set countries(ObservableList<Country> value) {
    _$countriesAtom.reportWrite(value, super.countries, () {
      super.countries = value;
    });
  }

  final _$countriesFilteredAtom =
      Atom(name: '_CountryStoreBase.countriesFiltered');

  @override
  ObservableList<Country> get countriesFiltered {
    _$countriesFilteredAtom.reportRead();
    return super.countriesFiltered;
  }

  @override
  set countriesFiltered(ObservableList<Country> value) {
    _$countriesFilteredAtom.reportWrite(value, super.countriesFiltered, () {
      super.countriesFiltered = value;
    });
  }

  final _$_CountryStoreBaseActionController =
      ActionController(name: '_CountryStoreBase');

  @override
  void setListCountry(List<Country> value) {
    final _$actionInfo = _$_CountryStoreBaseActionController.startAction(
        name: '_CountryStoreBase.setListCountry');
    try {
      return super.setListCountry(value);
    } finally {
      _$_CountryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListCountryFiltered(List<Country> value) {
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
countries: ${countries},
countriesFiltered: ${countriesFiltered}
    ''';
  }
}
