import 'package:flutter/material.dart';

import 'package:country_app/domain/entities/country.dart';
import 'package:country_app/domain/repositories/countries_repository.dart';

class CountriesProvider extends ChangeNotifier {
  final CountriesRepository countriesRepository;

  List<Country> allCountries = [];

  CountriesProvider({required this.countriesRepository});

  Future<void> loadAllCountries() async {
    /// Calls the countriesRepository
    final countries = await countriesRepository.getAllCountries();

    allCountries.addAll(countries);
    notifyListeners();
  }

  Future<Country> loadCountry(String countryName) async {
    /// Calls the countriesRepository
    final country =
        await countriesRepository.getCountry(countryName: countryName);
    return country;
  }

  /// function used by the search country bar
  List<Country> searchCountry(String query) {
    /// Makes a subquery in all the countries where the query contains that
    /// characters
    List<Country> queryCountries = [];
    if (query != "") {
      queryCountries = allCountries.where((countries) {
        final country = countries.commonName.toLowerCase();
        final input = query.toLowerCase();
        if (!queryCountries.contains(countries)) {
          return country.contains(input);
        } else {
          return false;
        }
      }).toList();
      return queryCountries;
    } else {
      return [];
    }
  }
}
