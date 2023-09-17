import 'package:country_app/domain/entities/country.dart';

/// Data origins (Can be anyone)
abstract class CountriesDataSource {
  Future<List<Country>> getAllCountries();
  Future<Country> getCountry({required String code});
}
