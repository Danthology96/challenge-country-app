import 'dart:convert';

import 'package:country_app/infrastructure/models/restcountries/restcountires_common_classes.dart';

/// Mapped class for the response of the restcountries with specific flags
class RestCountriesAllResponse {
  final Flags flags;
  final Name name;
  final String cca3;

  RestCountriesAllResponse({
    required this.flags,
    required this.name,
    required this.cca3,
  });

  factory RestCountriesAllResponse.fromJson(String str) =>
      RestCountriesAllResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestCountriesAllResponse.fromMap(Map<String, dynamic> json) =>
      RestCountriesAllResponse(
        flags: Flags.fromMap(json["flags"]),
        name: Name.fromMap(json["name"]),
        cca3: json["cca3"],
      );

  Map<String, dynamic> toMap() => {
        "flags": flags.toMap(),
        "name": name.toMap(),
        "cca3": cca3,
      };
}
