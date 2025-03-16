import 'package:countries/src/domain/entities/country.dart';
import 'package:countries/src/domain/repositories/country_repository.dart';
import 'package:countries/src/domain/usecases/get_countries.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_countries_test.mocks.dart';

@GenerateMocks([CountryRepository])
void main() {
  late GetCountries useCase;
  late MockCountryRepository mockCountryRepository;

  setUp(() {
    mockCountryRepository = MockCountryRepository();
    useCase = GetCountries(mockCountryRepository);
  });

  final tCountries = [
    const Country(
      name: 'Iran',
      capital: 'Tehran',
      flagUrl: 'https://example.com/iran.png',
    ),
  ];

  test(
    'should get list of countries from repository',
        () async {
      // arrange
      when(mockCountryRepository.getCountries())
          .thenAnswer((_) async => Right(tCountries));

      // act
      final result = await useCase();

      // assert
      expect(result, Right(tCountries));
      verify(mockCountryRepository.getCountries());
      verifyNoMoreInteractions(mockCountryRepository);
    },
  );
}