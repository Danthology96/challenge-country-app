import 'package:flutter/material.dart';

import 'package:country_app/domain/entities/country.dart';
import 'package:country_app/domain/repositories/countries_repository.dart';

class CountriesProvider extends ChangeNotifier {
  final CountriesRepository countriesRepository;

  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];
  List<Country> _currentCountries = [];

  CountriesProvider({required this.countriesRepository});

  List<Country> get allCountries => _allCountries;

  set allCountries(List<Country> value) {
    _allCountries = value;
    notifyListeners();
  }

  List<Country> get filteredCountries => _filteredCountries;

  set filteredCountries(List<Country> value) {
    _filteredCountries = value;
    notifyListeners();
  }

  List<Country> get currentCountries => _currentCountries;

  set currentCountries(List<Country> value) {
    _currentCountries = value;
    notifyListeners();
  }

  Future<void> loadAllCountries() async {
    /// Calls the countriesRepository
    final countries = await countriesRepository.getAllCountries();
    allCountries.addAll(countries);
    currentCountries.addAll(countries);
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
    /// Calls a search of countries of all the given countries
    return countriesRepository.searchCountry(
        query: query, countries: allCountries);
  }

  /// function used in the region filter
  Future<List<Country>> filterRegion(String region) async {
    currentCountries = [];

    ///If no region is received, means that there are no filters,
    /// it will stablish no filters
    if (region == '') {
      return allCountries;
    }

    /// Calls a search of countries of all the given countries
    filteredCountries = await countriesRepository.filterRegion(region: region);
    currentCountries = filteredCountries;
    return filteredCountries;
  }
}
