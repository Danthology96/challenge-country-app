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
}
