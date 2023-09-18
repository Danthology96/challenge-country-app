import 'package:country_app/presentation/widgets/countries/country_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:country_app/domain/entities/country.dart';
import 'package:country_app/presentation/providers/countries/countries_provider.dart';

/// Screen where the user can search for a country
class SearchScreen extends StatefulWidget {
  static const name = 'search-screen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Country> searchedCountries = [];
  final controller = TextEditingController();
  late final CountriesProvider countryProvider;

  @override
  void initState() {
    /// Instanciating the provider
    countryProvider = Provider.of<CountriesProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscar País"),
      ),
      body: Column(
        children: [
          /// Search widget
          SearchBar(
            controller: controller,
            hintText: "Escriba el nombre del país",
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onChanged: (_) {
              setState(() {
                searchedCountries = [];
                searchedCountries =
                    countryProvider.searchCountry(controller.text);
              });
            },
            leading: const Icon(Icons.search),
          ),

          /// Condition if the suggestions is empty wouldn't show any country
          searchedCountries.isEmpty
              ? const SizedBox()
              : Expanded(
                  child: ListView.separated(
                    itemCount: searchedCountries.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 2),
                    itemBuilder: (context, index) {
                      /// Builds the country tile widget based on the suggestions
                      return CountryListTileWidget(
                          country: searchedCountries[index]);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
