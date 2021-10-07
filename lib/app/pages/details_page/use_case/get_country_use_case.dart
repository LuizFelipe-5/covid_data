import 'package:covid_data/app/core/failure.dart';
import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class GetCountryUseCase {
  late CountryRepository repository;

  GetCountryUseCase({
    required this.repository,
  });

  Future<Either<Failure, Country>> byName(String name) =>
      repository.getCountry(name);
}
