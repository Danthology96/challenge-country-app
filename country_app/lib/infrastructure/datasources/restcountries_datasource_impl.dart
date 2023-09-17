import 'package:country_app/infrastructure/mappers/country_mapper.dart';
import 'package:country_app/infrastructure/models/restcountries/restcountries_country_response.dart';
import 'package:dio/dio.dart';

import 'package:country_app/domain/datasources/countries_datasource.dart';
import 'package:country_app/domain/entities/country.dart';
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
    final response = await dio
        .get("/all", queryParameters: {"fields": "flags,name,cca3,region"});

    final List<Country> countries = [];
    final countriesResponse = response.data;

    /// Needs to map to a country, first will go through a mapper
    for (var country in countriesResponse) {
      countries.add(CountryMapper.restCountriesAllCountriesToEntity(
          RestCountriesAllResponse.fromMap(country)));
    }
    return countries;
  }

  @override
  Future<Country> getCountry({String countryName = ''}) async {
    final response = await dio
        .get("/name/$countryName", queryParameters: {"fullText": true});

    /// The query returns a list of 1 item
    final List<dynamic> countryResponse = response.data;

    /// Calls the mapper to avoid app crash
    final Country country = CountryMapper.restCountriesCountryToEntity(
        RestCountriesCountryResponse.fromMap(countryResponse.first));

    return country;
  }

  @override
  List<Country> searchCountry(
      {required String query, required List<Country> countries}) {
    /// Makes a subquery in all the countries where the query contains that
    /// characters
    List<Country> queryCountries = [];
    if (query != "") {
      queryCountries = countries.where((country) {
        final countryStr = country.commonName.toLowerCase();
        final input = query.toLowerCase();
        if (!queryCountries.contains(country)) {
          return countryStr.contains(input);
        } else {
          return false;
        }
      }).toList();
      return queryCountries;
    } else {
      return [];
    }
  }

  @override
  Future<List<Country>> filterRegion({required String region}) async {
    /// To avoid bring all the data, we only need this fields to the main list
    final response = await dio.get("/region/$region",
        queryParameters: {"fields": "flags,name,cca3,region"});
    final List<Country> filteredCountries = [];
    final countriesResponse = response.data;

    /// Needs to map to a country, first will go through a mapper
    for (var country in countriesResponse) {
      filteredCountries.add(CountryMapper.restCountriesAllCountriesToEntity(
          RestCountriesAllResponse.fromMap(country)));
    }
    return filteredCountries;
  }
}
