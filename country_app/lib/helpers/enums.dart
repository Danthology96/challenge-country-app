/// Enum for the world regions
enum Region { africa, americas, antarctic, asia, europe, oceania }

/// To get the regionValues of the map with enum
final regionValues = EnumValues({
  "Africa": Region.africa,
  "Americas": Region.americas,
  "Antarctic": Region.antarctic,
  "Asia": Region.asia,
  "Europe": Region.europe,
  "Oceania": Region.oceania
});

/// To globally get any value of a enum
class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
