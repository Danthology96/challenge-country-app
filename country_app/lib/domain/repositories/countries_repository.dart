import 'package:country_app/domain/entities/country.dart';

abstract class CountriesRepository {
  Future<List<Country>> getAllCountries();
  Future<Country> getCountry({required String countryName});
  List<Country> searchCountry(
      {required String query, required List<Country> countries});
  Future<List<Country>> filterRegion({required String region});
}
