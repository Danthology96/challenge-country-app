import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:country_app/presentation/providers/countries/countries_provider.dart';
import 'package:country_app/presentation/widgets/countries/country_content_widget.dart';
import 'package:country_app/domain/entities/country.dart';

class DetailedCountryScreen extends StatefulWidget {
  static const name = 'detailed-country-screen';
  final String countryName;
  const DetailedCountryScreen({super.key, required this.countryName});

  @override
  State<DetailedCountryScreen> createState() => _DetailedCountryScreenState();
}

class _DetailedCountryScreenState extends State<DetailedCountryScreen> {
  late CountriesProvider countriesProvider;

  /// Empty country
  Country country =
      Country(commonName: "", flagUrl: "", officialName: "", code: "");
  bool isFavoriteCountry = false;

  /// Calls the countries provider
  @override
  void initState() {
    countriesProvider = Provider.of<CountriesProvider>(context, listen: false);
    loadCountry();
    super.initState();
  }

  /// load the data in asynchronous form and then, it refreshes the screen
  void loadCountry() async {
    await countriesProvider.loadCountry(widget.countryName).then((value) {
      isFavoriteCountry = isFavorite(countriesProvider, value);
      setState(() {
        country = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// Need a future builder to give time to the app for load data
        body: (country.code == '')
            ? const Center(child: CircularProgressIndicator())
            : NestedScrollView(
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
                        background: FadeInImage(
                          placeholder:
                              const AssetImage('assets/images/placeholder.jpg'),
                          image: NetworkImage(country.flagUrl),
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.cover,
                        ),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (!isFavoriteCountry) {
                                  countriesProvider.favoriteCountries
                                      .add(country);
                                  isFavoriteCountry = true;
                                } else {
                                  countriesProvider.favoriteCountries
                                      .removeWhere((element) =>
                                          element.code == country.code);
                                  isFavoriteCountry = false;
                                }
                              });
                            },
                            icon: (isFavoriteCountry)
                                ? const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  )
                                : const Icon(Icons.star_border_rounded))
                      ],
                    )
                  ];
                },
                body: CountryContentWidget(country: country)));
  }

  bool isFavorite(CountriesProvider provider, Country country) {
    for (var favCountry in provider.favoriteCountries) {
      if (country.code == favCountry.code) {
        return true;
      }
    }
    return false;
  }
}
