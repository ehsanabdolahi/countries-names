import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String name;
  final String capital;
  final String flagUrl;

  const Country({
    required this.name,
    required this.capital,
    required this.flagUrl,
  });

  @override
  List<Object> get props => [name, capital, flagUrl];
}