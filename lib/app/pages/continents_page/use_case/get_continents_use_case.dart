import 'package:covid_data/app/core/failure.dart';
import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:dartz/dartz.dart';

class GetContinentsUseCase {
  late ContinentRepository repository;

  GetContinentsUseCase({required this.repository});

  Future<Either<Failure, List<Continent>>> get() => repository.getContinents();
}
