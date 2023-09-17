import 'package:country_app/domain/datasources/countries_datasource.dart';
import 'package:country_app/domain/entities/country.dart';
import 'package:country_app/domain/repositories/countries_repository.dart';

/// Class to implement the abstract class of the CountriesRepository
class CountryRepositoryImpl extends CountriesRepository {
  final CountriesDataSource dataSource;

  CountryRepositoryImpl({required this.dataSource});

  @override
  Future<List<Country>> getAllCountries() {
    return dataSource.getAllCountries();
  }

  @override
  Future<Country> getCountry({required String code}) {
    return dataSource.getCountry(code: code);
  }
}
