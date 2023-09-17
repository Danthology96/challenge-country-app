import 'package:country_app/domain/entities/country.dart';

abstract class CountriesRepository {
  Future<List<Country>> getAllCountries();
  Future<Country> getCountry({required String code});
}
