import 'dart:convert';
import 'package:dio/dio.dart';
import '../../core/error/exceptions.dart';
import '../models/country_model.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> getCountries();
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final Dio dio;

  CountryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CountryModel>> getCountries() async {
    try {
      final response = await dio.get(
          'https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json');

      if (response.statusCode == 200) {
        final List<dynamic> countriesJson = response.data;
        return countriesJson.map((json) {
          return CountryModel.fromJson({
            'name': json['name'] ?? '',
            'capital': json['capital'] ?? '',
            'code': json['code'] ?? '',
            'flag': json['flag'] ?? '',
          });
        }).toList();
      } else {
        throw ServerException(
            message: 'Failed to load countries: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException(
          message: 'Failed to load countries: ${e.toString()}');
    }
  }
}
