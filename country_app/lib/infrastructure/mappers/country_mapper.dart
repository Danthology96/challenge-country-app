import 'package:country_app/domain/entities/country.dart';
import 'package:country_app/infrastructure/models/restcountries/restcountries_all_response.dart';
import 'package:country_app/infrastructure/models/restcountries/restcountries_country_response.dart';

class CountryMapper {
  static Country restCountriesCountryToEntity(
          RestCountriesCountryResponse restCountry) =>
      Country(
        capital: restCountry.capital.first,
        flagUrl: restCountry.flags.png,
        region: restCountry.region,
        population: restCountry.population,
        languages: restCountry.languages,
        abreviation: restCountry.flag,
        code: restCountry.cca3,
        commonName: restCountry.name.common,
        officialName: restCountry.name.official,
      );

  static Country restCountriesAllCountriesToEntity(
          RestCountriesAllResponse restCountries) =>
      Country(
        capital:
            restCountries.capital!.isEmpty ? '' : restCountries.capital!.first,
        flagUrl: restCountries.flags.png,
        region: restCountries.region.name,
        population: restCountries.population,
        languages: restCountries.languages,
        abreviation: restCountries.flag,
        code: restCountries.cca3,
        commonName: restCountries.name.common,
        officialName: restCountries.name.official,
      );
}
