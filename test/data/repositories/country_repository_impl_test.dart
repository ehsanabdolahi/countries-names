import 'package:countries/src/core/network/network_info.dart';
import 'package:countries/src/data/datasources/country_remote_data_source.dart';
import 'package:countries/src/data/models/country_model.dart';
import 'package:countries/src/data/repositories/country_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'country_repository_impl_test.mocks.dart';

@GenerateMocks([CountryRemoteDataSource, NetworkInfo])
void main() {
  late CountryRepositoryImpl repository;
  late MockCountryRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockCountryRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CountryRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  test(
    'should return country data',
        () async {
      // arrange
      final tCountryModels = [
        const CountryModel(
          name: 'Iran',
          capital: 'Tehran',
          code: 'IR',
          flag: 'https://example.com/iran.png',
        ),
      ];

      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getCountries())
          .thenAnswer((_) async => tCountryModels);

      // act
      final result = await repository.getCountries();

      // assert
      verify(mockRemoteDataSource.getCountries());
      expect(result, isA<Right>());
    },
  );

  test(
    'should return network failure when the device is offline',
        () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // act
      final result = await repository.getCountries();

      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      expect(result, isA<Left>());
    },
  );
}