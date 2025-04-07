import '../../domain/entities/country.dart';
import 'country_model.dart';

extension CountryModelExtension on CountryModel {
  Country toEntity() => Country(
    name: name,
    capital: capital,
    flagUrl: flag,
  );
}