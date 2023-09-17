import 'dart:convert';

import 'package:country_app/infrastructure/models/restcountries/restcountires_common_classes.dart';

/// Mapped class for the response of the restcountries country
class RestCountriesCountryResponse {
  final Name name;
  final String cca3;
  final Map<String, Currency> currencies;
  final List<String> capital;
  final String region;
  final String subregion;
  final Map<String, dynamic> languages;
  final List<String> borders;
  final String flag;
  final int population;
  final List<String> continents;
  final Flags flags;
  final CoatOfArms coatOfArms;

  RestCountriesCountryResponse({
    required this.name,
    required this.cca3,
    required this.currencies,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.borders,
    required this.flag,
    required this.population,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
  });

  factory RestCountriesCountryResponse.fromJson(String str) =>
      RestCountriesCountryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestCountriesCountryResponse.fromMap(Map<String, dynamic> json) =>
      RestCountriesCountryResponse(
        name: Name.fromMap(json["name"]),
        cca3: json["cca3"],
        currencies: Map.from(json["currencies"])
            .map((k, v) => MapEntry<String, Currency>(k, Currency.fromMap(v))),
        capital: List<String>.from(json["capital"].map((x) => x)),
        region: json["region"],
        subregion: json["subregion"],
        languages: json["languages"],
        borders: List<String>.from(json["borders"].map((x) => x)),
        flag: json["flag"],
        population: json["population"],
        continents: List<String>.from(json["continents"].map((x) => x)),
        flags: Flags.fromMap(json["flags"]),
        coatOfArms: CoatOfArms.fromMap(json["coatOfArms"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name.toMap(),
        "cca3": cca3,
        "currencies": Map.from(currencies)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "region": region,
        "subregion": subregion,
        "languages": languages,
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "flag": flag,
        "population": population,
        "continents": List<dynamic>.from(continents.map((x) => x)),
        "flags": flags.toMap(),
        "coatOfArms": coatOfArms.toMap(),
      };
}
