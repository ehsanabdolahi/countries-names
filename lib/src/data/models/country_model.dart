// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../../domain/entities/country.dart';

part 'country_model.freezed.dart';

part 'country_model.g.dart';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "capital") required String capital,
    required String code,
    @JsonKey(name: "flag") required String flag,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
