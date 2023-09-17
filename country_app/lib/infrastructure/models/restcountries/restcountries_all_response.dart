import 'dart:convert';

import 'package:country_app/helpers/enums.dart';
import 'package:country_app/infrastructure/models/restcountries/restcountires_common_classes.dart';

/// Mapped class for the response of the restcountries with specific flags
class RestCountriesAllResponse {
  final Flags flags;
  final Name name;
  final String cca3;
  final Region? region;

  RestCountriesAllResponse({
    required this.flags,
    required this.name,
    required this.cca3,
    required this.region,
  });

  factory RestCountriesAllResponse.fromJson(String str) =>
      RestCountriesAllResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestCountriesAllResponse.fromMap(Map<String, dynamic> json) =>
      RestCountriesAllResponse(
          flags: Flags.fromMap(json["flags"]),
          name: Name.fromMap(json["name"]),
          cca3: json["cca3"],
          region: setEnumRegion(json["region"]));

  Map<String, dynamic> toMap() => {
        "flags": flags.toMap(),
        "name": name.toMap(),
        "cca3": cca3,
        "region": region?.value ?? ''
      };
}
