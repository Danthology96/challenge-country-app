class Country {
  final String commonName;
  final String officialName;
  final String capital;
  final String flagUrl;
  final String abreviation;
  final String code;
  final String region;
  final int population;

  final Map<String, dynamic> languages;
  Country({
    required this.capital,
    required this.flagUrl,
    required this.region,
    required this.population,
    required this.languages,
    required this.commonName,
    required this.officialName,
    required this.abreviation,
    required this.code,
  });
}
