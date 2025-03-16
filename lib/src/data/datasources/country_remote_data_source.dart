import 'dart:convert';
import 'package:countries/src/constants/categories/api_category.dart';
import 'package:countries/src/constants/categories/string_category.dart';
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
      final response = await dio.get(APICategory.countries);

      if (response.statusCode == 200) {
        final String responseData = response.data;
        final List<dynamic> countriesJson = json.decode(responseData);

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
            message: StringCategory.failedToLoadCountries(
                response.statusCode.toString()));
      }
    } catch (e) {
      throw ServerException(
          message: StringCategory.failedToLoadCountries(e.toString()));
    }
  }
}
