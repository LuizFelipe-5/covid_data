// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsStore on _DetailsStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_DetailsStoreBase.isLoading');

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

  final _$countryAtom = Atom(name: '_DetailsStoreBase.country');

  @override
  Country get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(Country value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$_DetailsStoreBaseActionController =
      ActionController(name: '_DetailsStoreBase');

  @override
  void changeState(bool isLoading) {
    final _$actionInfo = _$_DetailsStoreBaseActionController.startAction(
        name: '_DetailsStoreBase.changeState');
    try {
      return super.changeState(isLoading);
    } finally {
      _$_DetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountry(Country country) {
    final _$actionInfo = _$_DetailsStoreBaseActionController.startAction(
        name: '_DetailsStoreBase.setCountry');
    try {
      return super.setCountry(country);
    } finally {
      _$_DetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
country: ${country}
    ''';
  }
}
