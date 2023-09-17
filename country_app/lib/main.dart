import 'package:country_app/infrastructure/datasources/restcountries_datasource_impl.dart';
import 'package:country_app/infrastructure/repositories/country_repository_impl.dart';
import 'package:country_app/presentation/providers/countries/countries_provider.dart';
import 'package:flutter/material.dart';

import 'package:country_app/config/theme/app_theme.dart';
import 'package:country_app/routes/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final countriesRepository =
        CountryRepositoryImpl(dataSource: RestCountriesDataSourceImpl());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              CountriesProvider(countriesRepository: countriesRepository),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
