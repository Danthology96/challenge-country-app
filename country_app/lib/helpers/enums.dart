/// Enum for the world regions
enum Region {
  africa("Africa"),
  americas("Americas"),
  antarctic("Antarctic"),
  asia("Asia"),
  europe("Europe"),
  oceania("Oceania"),
  none("None");

  const Region(this.value);
  final String value;
}

/// function to set a region from a String (from json)
Region? setEnumRegion(String value) {
  switch (value) {
    case "Africa":
      return Region.africa;
    case "Americas":
      return Region.americas;
    case "Antarctic":
      return Region.antarctic;
    case "Asia":
      return Region.asia;
    case "Europe":
      return Region.europe;
    case "Oceania":
      return Region.oceania;
    default:
      return Region.none;
  }
}
