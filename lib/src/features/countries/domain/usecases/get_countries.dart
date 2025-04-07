import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/country.dart';
import '../repositories/country_repository.dart';

class GetCountries {
  final CountryRepository repository;

  GetCountries(this.repository);

  Future<Either<Failure, List<Country>>> call() {
    return repository.getCountries();
  }
}
