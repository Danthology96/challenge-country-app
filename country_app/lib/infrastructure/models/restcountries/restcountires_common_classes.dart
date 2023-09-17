import 'dart:convert';

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
        alt: json["alt"] ?? '',
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
