import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/country.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<Country>>> getCountries();
}
