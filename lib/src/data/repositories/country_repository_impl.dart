import 'package:countries/src/constants/categories/string_category.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';
import '../datasources/country_remote_data_source.dart';
import '../models/country_model_extension.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CountryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Country>>> getCountries() async {
    if (await networkInfo.isConnected) {
      try {
        final countryModels = await remoteDataSource.getCountries();
        final countries =
            countryModels.map((model) => model.toEntity()).toList();
        return Right(countries);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(
          NetworkFailure(message: StringCategory.noInternetConnection));
    }
  }
}
