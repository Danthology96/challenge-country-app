import 'package:country_app/domain/entities/country.dart';

/// Data origins (Can be anyone)
abstract class CountriesDataSource {
  Future<List<Country>> getAllCountries();
  Future<Country> getCountry({required String countryName});
  List<Country> searchCountry(
      {required String query, required List<Country> countries});
  Future<List<Country>> filterRegion({required String region});
}
