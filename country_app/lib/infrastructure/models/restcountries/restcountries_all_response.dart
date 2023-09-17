import 'dart:convert';

import 'package:country_app/helpers/enums.dart';

/// Mapped class for the response of the restcountries with specific flags
class RestCountriesAllResponse {
  final Flags flags;
  final Name name;
  final List<String>? capital;
  final Region region;
  final String cca3;
  final Map<String, String> languages;
  final String flag;
  final int population;

  RestCountriesAllResponse({
    required this.flags,
    required this.name,
    required this.cca3,
    this.capital,
    required this.region,
    required this.languages,
    required this.flag,
    required this.population,
  });

  factory RestCountriesAllResponse.fromJson(String str) =>
      RestCountriesAllResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestCountriesAllResponse.fromMap(Map<String, dynamic> json) =>
      RestCountriesAllResponse(
        flags: Flags.fromMap(json["flags"]),
        name: Name.fromMap(json["name"]),
        cca3: json["cca3"],
        capital: json["capital"] == null
            ? null
            : List<String>.from(json["capital"].map((x) => x)),
        region: regionValues.map[json["region"]]!,
        languages: Map.from(json["languages"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        flag: json["flag"],
        population: json["population"],
      );

  Map<String, dynamic> toMap() => {
        "flags": flags.toMap(),
        "name": name.toMap(),
        "cca3": cca3,
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "region": regionValues.reverse[region],
        "languages":
            Map.from(languages).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "flag": flag,
        "population": population,
      };
}

class Flags {
  final String png;
  final String svg;
  final String alt;

  Flags({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory Flags.fromJson(String str) => Flags.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Flags.fromMap(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toMap() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Name {
  final String common;
  final String official;
  final Map<String, NativeName> nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]).map(
            (k, v) => MapEntry<String, NativeName>(k, NativeName.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}

class NativeName {
  final String official;
  final String common;

  NativeName({
    required this.official,
    required this.common,
  });

  factory NativeName.fromJson(String str) =>
      NativeName.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NativeName.fromMap(Map<String, dynamic> json) => NativeName(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toMap() => {
        "official": official,
        "common": common,
      };
}
