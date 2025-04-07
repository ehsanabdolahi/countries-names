// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'country_model.freezed.dart';

part 'country_model.g.dart';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    required String name,
    required String capital,
    required String code,
    required String flag,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
