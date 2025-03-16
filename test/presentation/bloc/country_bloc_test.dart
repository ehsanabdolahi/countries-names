import 'package:countries/src/domain/entities/country.dart';
import 'package:countries/src/domain/usecases/get_countries.dart';
import 'package:countries/src/presentation/bloc/country/country_bloc.dart';
import 'package:countries/src/presentation/bloc/country/country_event.dart';
import 'package:countries/src/presentation/bloc/country/country_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'country_bloc_test.mocks.dart';

@GenerateMocks([GetCountries])
void main() {
  late CountryBloc bloc;
  late MockGetCountries mockGetCountries;

  setUp(() {
    mockGetCountries = MockGetCountries();
    bloc = CountryBloc(getCountries: mockGetCountries);
  });

  test('initial state should be CountryInitial', () {
    expect(bloc.state, equals(CountryInitial()));
  });

  blocTest<CountryBloc, CountryState>(
    'should emit [CountryLoading, CountryLoaded] when data fetched successfully',
    build: () {
      when(mockGetCountries())
          .thenAnswer((_) async => const Right([
        Country(
          name: 'Iran',
          capital: 'Tehran',
          flagUrl: 'https://example.com/iran.png',
        ),
      ]));
      return bloc;
    },
    act: (bloc) => bloc.add(GetCountriesEvent()),
    expect: () => [
      isA<CountryLoading>(),
      isA<CountryLoaded>(),
    ],
  );
}