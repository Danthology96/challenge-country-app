import 'package:country_app/presentation/providers/countries/countries_provider.dart';
import 'package:country_app/presentation/widgets/countries/country_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteCountriesScreen extends StatelessWidget {
  static const name = '/favorites';
  const FavoriteCountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countriesProvider =
        Provider.of<CountriesProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: (countriesProvider.favoriteCountries.isEmpty)
          ? const Center(
              child: Text("¡Agrega tus países favoritos!"),
            )
          : ListView.separated(
              itemCount: countriesProvider.favoriteCountries.length,
              separatorBuilder: (context, index) => const Divider(height: 2),
              itemBuilder: (context, index) {
                return CountryListTileWidget(
                    country: countriesProvider.favoriteCountries[index]);
              },
            ),
    );
  }
}
