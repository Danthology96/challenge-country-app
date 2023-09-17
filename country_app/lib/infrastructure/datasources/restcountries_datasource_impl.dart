import 'package:dio/dio.dart';

import 'package:country_app/domain/datasources/countries_datasource.dart';
import 'package:country_app/domain/entities/country.dart';
import 'package:country_app/infrastructure/mappers/country_mapper.dart';
import 'package:country_app/infrastructure/models/restcountries/restcountries_all_response.dart';

class RestCountriesDataSourceImpl extends CountriesDataSource {
  /// Since all endpoints of restcountries uses the same baseUrl, it's better
  /// to make it a baseUrl
  ///
  /// Using dio instead of http package for this reason
  final dio = Dio(BaseOptions(baseUrl: "https://restcountries.com/v3.1"));

  @override
  Future<List<Country>> getAllCountries() async {
    /// To avoid bring all the data, we only need this fields to the main list
    final response = await dio.get("/all", queryParameters: {
      "fields": "capital,flags,region,population,languages,flag,name,cca3"
    });

    final List<Country> countries = [];
    final countriesResponse = response.data;

    /// Needs to map to a country, first will go through a cape
    for (var country in countriesResponse) {
      countries.add(CountryMapper.restCountriesAllCountriesToEntity(
          RestCountriesAllResponse.fromMap(country)));
    }
    return countries;
  }

  @override
  Future<Country> getCountry({String code = ''}) async {
    final response = await dio.get("/name/$code");

    final countryResponse = response.data;

    /// Calls the mapper to avoid app crash
    final Country country =
        CountryMapper.restCountriesCountryToEntity(countryResponse);

    return country;
  }
}