import 'package:country_app/infrastructure/models/restcountries/restcountires_common_classes.dart';

class Country {
  final String commonName;
  final String officialName;
  final String flagUrl;
  final String code;

  /// optional attributes
  final String? capital;
  final String? abreviation;
  final String? region;
  final int? population;
  final Map<String, dynamic>? languages;
  final Map<String, Currency>? currencies;
  final String? subregion;
  final List<String>? borders;
  final CoatOfArms? coatOfArms;

  Country({
    required this.commonName,
    required this.flagUrl,
    required this.officialName,
    required this.code,
    this.capital,
    this.region,
    this.population,
    this.languages,
    this.abreviation,
    this.currencies,
    this.subregion,
    this.borders,
    this.coatOfArms,
  });
}
