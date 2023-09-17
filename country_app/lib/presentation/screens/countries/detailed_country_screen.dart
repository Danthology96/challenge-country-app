import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:country_app/presentation/providers/countries/countries_provider.dart';
import 'package:country_app/presentation/widgets/countries/country_content_widget.dart';
import 'package:country_app/domain/entities/country.dart';

class DetailedCountryScreen extends StatelessWidget {
  static const name = 'detailed-country-screen';
  final String countryName;
  const DetailedCountryScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    /// Calls the countries provider
    final countriesProvider =
        Provider.of<CountriesProvider>(context, listen: false);

    return Scaffold(
      /// Need a future builder to give time to the app for load data
      body: FutureBuilder(
        /// calls the loadCountries
        future: countriesProvider.loadCountry(countryName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final Country country = snapshot.data!;
            return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      titleTextStyle:
                          Theme.of(context).textTheme.headlineMedium,
                      expandedHeight: 200,
                      centerTitle: true,
                      title: Text(
                        country.commonName,
                      ),
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image(
                          image: NetworkImage(country.flagUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.star_border_rounded))
                      ],
                    )
                  ];
                },
                body: CountryContentWidget(country: country));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
