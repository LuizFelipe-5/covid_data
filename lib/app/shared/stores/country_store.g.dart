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

  @override
  String toString() {
    return '''
countries: ${countries}
    ''';
  }
}
