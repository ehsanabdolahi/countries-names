import 'package:countries/src/constants/categories/string_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country/country_bloc.dart';
import '../bloc/country/country_event.dart';
import '../bloc/country/country_state.dart';
import '../widgets/country_list_item.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(GetCountriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringCategory.worldsCountries),
        centerTitle: true,
      ),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountryLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return CountryListItem(country: country);
              },
            );
          } else if (state is CountryError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringCategory.errorIndicator(state.message),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CountryBloc>().add(GetCountriesEvent());
                    },
                    child: const Text(StringCategory.tryAgain),
                  ),
                ],
              ),
            );
          }
          return const Center(
              child: Text(StringCategory.pleaseTapLoadingButton));
        },
      ),
    );
  }
}
