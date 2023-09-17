import 'dart:convert';

import 'restcountries_response.dart';

/// Mapped class for the response of the restcountries country
class RestCountriesCountryResponse {
  final Name name;
  final List<String> tld;
  final String cca2;
  final String cca3;
  final String cioc;
  final Map<String, Currency> currencies;
  final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Map<String, dynamic> languages;
  final Map<String, Translation> translations;
  final List<double> latlng;
  final List<String> borders;
  final int area;
  final String flag;
  final Maps maps;
  final int population;
  final String fifa;
  final List<String> timezones;
  final List<String> continents;
  final Flags flags;
  final CoatOfArms coatOfArms;
  final CapitalInfo capitalInfo;
  final PostalCode postalCode;

  RestCountriesCountryResponse({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.cca3,
    required this.cioc,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.borders,
    required this.area,
    required this.flag,
    required this.maps,
    required this.population,
    required this.fifa,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory RestCountriesCountryResponse.fromJson(String str) =>
      RestCountriesCountryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestCountriesCountryResponse.fromMap(Map<String, dynamic> json) =>
      RestCountriesCountryResponse(
        name: Name.fromMap(json["name"]),
        tld: List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        currencies: Map.from(json["currencies"])
            .map((k, v) => MapEntry<String, Currency>(k, Currency.fromMap(v))),
        idd: Idd.fromMap(json["idd"]),
        capital: List<String>.from(json["capital"].map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"],
        subregion: json["subregion"],
        languages: json["languages"],
        translations: Map.from(json["translations"]).map(
            (k, v) => MapEntry<String, Translation>(k, Translation.fromMap(v))),
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        borders: List<String>.from(json["borders"].map((x) => x)),
        area: json["area"],
        flag: json["flag"],
        maps: Maps.fromMap(json["maps"]),
        population: json["population"],
        fifa: json["fifa"],
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<String>.from(json["continents"].map((x) => x)),
        flags: Flags.fromMap(json["flags"]),
        coatOfArms: CoatOfArms.fromMap(json["coatOfArms"]),
        capitalInfo: CapitalInfo.fromMap(json["capitalInfo"]),
        postalCode: PostalCode.fromMap(json["postalCode"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name.toMap(),
        "tld": List<dynamic>.from(tld.map((x) => x)),
        "cca2": cca2,
        "cca3": cca3,
        "cioc": cioc,
        "currencies": Map.from(currencies)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "idd": idd.toMap(),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": region,
        "subregion": subregion,
        "languages": languages,
        "translations": Map.from(translations)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "area": area,
        "flag": flag,
        "maps": maps.toMap(),
        "population": population,
        "fifa": fifa,
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(continents.map((x) => x)),
        "flags": flags.toMap(),
        "coatOfArms": coatOfArms.toMap(),
        "capitalInfo": capitalInfo.toMap(),
        "postalCode": postalCode.toMap(),
      };
}

class CapitalInfo {
  final List<double> latlng;

  CapitalInfo({
    required this.latlng,
  });

  factory CapitalInfo.fromJson(String str) =>
      CapitalInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CapitalInfo.fromMap(Map<String, dynamic> json) => CapitalInfo(
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
      };
}

class CoatOfArms {
  final String png;
  final String svg;

  CoatOfArms({
    required this.png,
    required this.svg,
  });

  factory CoatOfArms.fromJson(String str) =>
      CoatOfArms.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoatOfArms.fromMap(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toMap() => {
        "png": png,
        "svg": svg,
      };
}

class Currency {
  final String name;
  final String symbol;

  Currency({
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "symbol": symbol,
      };
}

class Idd {
  final String root;
  final List<String> suffixes;

  Idd({
    required this.root,
    required this.suffixes,
  });

  factory Idd.fromJson(String str) => Idd.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Idd.fromMap(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: List<String>.from(json["suffixes"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "root": root,
        "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
      };
}

class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  factory Maps.fromJson(String str) => Maps.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Maps.fromMap(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toMap() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Translation {
  final String official;
  final String common;

  Translation({
    required this.official,
    required this.common,
  });

  factory Translation.fromJson(String str) =>
      Translation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toMap() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  final String format;
  final String regex;

  PostalCode({
    required this.format,
    required this.regex,
  });

  factory PostalCode.fromJson(String str) =>
      PostalCode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostalCode.fromMap(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toMap() => {
        "format": format,
        "regex": regex,
      };
}
