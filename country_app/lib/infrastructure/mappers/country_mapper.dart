import 'package:country_app/domain/entities/country.dart';
import 'package:country_app/infrastructure/models/restcountries/restcountries_all_response.dart';
import 'package:country_app/infrastructure/models/restcountries/restcountries_country_response.dart';

class CountryMapper {
  /// constructor to the detailed country
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
        currencies: restCountry.currencies,
        subregion: restCountry.subregion,
        borders: restCountry.borders,
        coatOfArms: restCountry.coatOfArms,
      );

  /// constructor for the generic country displayed on the country's list
  static Country restCountriesAllCountriesToEntity(
          RestCountriesAllResponse restCountries) =>
      Country(
        flagUrl: restCountries.flags.png,
        code: restCountries.cca3,
        commonName: restCountries.name.common,
        officialName: restCountries.name.official,
      );
}
