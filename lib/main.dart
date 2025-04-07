import 'package:countries/src/features/countries/presentation/bloc/country/country_bloc.dart';
import 'package:countries/src/features/countries/presentation/pages/countries_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<CountryBloc>()),
      ],
      child: MaterialApp(
        title: 'Countries',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CountriesPage(),
      ),
    );
  }
}
